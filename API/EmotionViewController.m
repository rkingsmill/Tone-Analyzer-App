//
//  EmotionViewController.m
//  API
//
//  Created by Yasmin Ahmad on 2016-05-31.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//

#import "EmotionViewController.h"
#import "DataFetcher.h"
#import "VBPieChart.h"
#import "DocumentTone.h"
#import "ToneCategory.h"
#import "Tone.h"
#import "SentenceTone.h"
#import "SocialViewController.h"
#import "LanguageViewController.h"

@interface EmotionViewController ()

@property VBPieChart *chartTop;
@property NSNumber *pieceValue;
@property (nonatomic, strong) NSMutableArray *sentenceTones;
@property (nonatomic, strong) NSMutableArray *sentencesToHighlight;
@property (strong, nonatomic) IBOutlet UIButton *languageSwitchButton;
@property (strong, nonatomic) IBOutlet UIButton *socialSwitchButton;

@end

@implementation EmotionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.sentenceTones = [[NSMutableArray alloc] init];
    self.sentencesToHighlight = [[NSMutableArray alloc] init];
    
    if (self.data) {
        self.text = self.data.content;
        self.emotionSummaryView.text = self.text;
    }
    
    //change graph size and position next line
    UIColor *borderColor = [UIColor colorWithRed:0.808 green:0.784 blue:0.937 alpha:1.0];
    self.emotionSummaryView.layer.borderColor = borderColor.CGColor;
    self.emotionSummaryView.layer.borderWidth = 2.0;
    self.emotionSummaryView.layer.cornerRadius = 5.0;

//    self.emotionView.layer.borderColor = borderColor.CGColor;
//    self.emotionView.layer.borderWidth = 4.0;
    self.emotionView.layer.cornerRadius = 5.0;
    self.emotionView.backgroundColor = [UIColor colorWithRed:0.961 green:0.961 blue:0.961 alpha:1.0];
    
    self.emotionDescriptionLabel.textColor = [UIColor colorWithRed:0.373 green:0.745 blue:0.843 alpha:1.0];
    self.emotionSummaryView.text = self.emotionUserText;
    self.emotionSummaryView.editable = NO;
    self.emotionSummaryView.backgroundColor = [UIColor colorWithRed:0.961 green:0.961 blue:0.961 alpha:1.0];
    self.emotionSummaryView.textColor = [UIColor colorWithRed:0.404 green:0.404 blue:0.404 alpha:1.0]; 
    
    self.navigationController.navigationBar.topItem.title = @"HOME";
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    
    self.languageSwitchButton.layer.cornerRadius = self.languageSwitchButton.frame.size.height / 2;
    self.languageSwitchButton.backgroundColor =[UIColor colorWithRed:0.671 green:0.573 blue:0.702 alpha:1.0];
    
    self.socialSwitchButton.layer.cornerRadius = self.socialSwitchButton.frame.size.height / 2;
    self.socialSwitchButton.backgroundColor = [UIColor colorWithRed:0.671 green:0.573 blue:0.702 alpha:1.0];
    
    
    DataFetcher *fetcher = [DataFetcher new];
    
    //Get data from server
    [fetcher fetchData:self.text completion:^(DataFetcher *fetcher) {
    
        //CAN EDIT CHART SIZE AND POSITION NEXT LINE
        self.chartTop = [[VBPieChart alloc] initWithFrame:CGRectMake(40, 25, 200, 200)];
        self.chartTop.delegate = self;
        [self.emotionGraphView addSubview:self.chartTop];
        self.chartTop.holeRadiusPrecent = 0.5;
        
        self.sentenceTones = [fetcher.sentencesTones copy];
        
        NSMutableArray *tones = [[NSMutableArray alloc] init];
        for (ToneCategory *category in fetcher.dt.toneCategories) {
            if ([category.name isEqualToString:@"Emotion Tone"]) {
                for (Tone *t in category.tones) {
                    //t.color = [t color];
                    [tones addObject:@{@"name" : t.name, @"value": t.score, @"color": t.color}];
                }
                break;
            }
        }
        [self.chartTop setChartValues:tones animation:YES duration:0.4 options:VBPieChartAnimationFan];
    }];
}

-(void)getPieceName{
    
    //add label text here
    NSString *name = self.chartTop.piePieceName;
    if (name == nil) {
        return;
    }
    int int1 = floorf(self.chartTop.piePieceValue.floatValue * 100);
    //NSString *value = [self.chartTop.piePieceValue stringValue];
    NSString *displayLabel = [NSString stringWithFormat:@"%@: %d/100", name, int1];
    self.nameLabelEmotion.text = displayLabel;
    
    //self.valueLabelEmotion.text = [self.chartTop.piePieceValue stringValue];
    
     UIColor *color = [self color];
     self.emotionDescriptionLabel.textColor = color;
     self.nameLabelEmotion.textColor = color;
    
    if ([self.chartTop.piePieceName  isEqual: @"Anger"]) {
        
        self.emotionDescriptionLabel.text = @"Evoked due to injustice, conflict, humiliation, negligence or betrayal.";
    }
    
    if ([self.chartTop.piePieceName  isEqual: @"Disgust"]) {
        //self.nameLabelEmotion.textColor = [UIColor colorWithRed:0.635 green:0.635 blue:0.816 alpha:1.0];
        //self.valueLabelEmotion.textColor = [UIColor colorWithRed:0.635 green:0.635 blue:0.816 alpha:1.0];
        self.emotionDescriptionLabel.text = @"An emotional response of revulsion to something considered offensive or unpleasant. It is a sensation that refers to something revolting.";
        //self.emotionDescriptionLabel.textColor = [UIColor colorWithRed:0.635 green:0.635 blue:0.816 alpha:1.0];
    }
    
    if ([self.chartTop.piePieceName  isEqual: @"Fear"]) {
        //self.nameLabelEmotion.textColor = [UIColor colorWithRed:0.604 green:0.808 blue:0.922 alpha:1.0];
        //self.valueLabelEmotion.textColor = [UIColor colorWithRed:0.604 green:0.808 blue:0.922 alpha:1.0];
        self.emotionDescriptionLabel.text = @"A response to impending danger. It is a survival mechanism that is a reaction to some negative stimulus. It may be a mild caution or an extreme phobia.";
        //self.emotionDescriptionLabel.textColor = [UIColor colorWithRed:0.604 green:0.808 blue:0.922 alpha:1.0];
}
    
    if ([self.chartTop.piePieceName  isEqual: @"Joy"]) {
        //self.nameLabelEmotion.textColor = [UIColor colorWithRed:0.949 green:0.949 blue:0.478 alpha:1.0];
        //self.valueLabelEmotion.textColor = [UIColor colorWithRed:0.949 green:0.949 blue:0.478 alpha:1.0];
        self.emotionDescriptionLabel.text = @"Joy or happiness has shades of enjoyment, satisfaction and pleasure. There is a sense of well-being, inner peace, love, safety and contentment.";
        //self.emotionDescriptionLabel.textColor = [UIColor colorWithRed:0.949 green:0.949 blue:0.478 alpha:1.0];
    }
    
    if ([self.chartTop.piePieceName  isEqual: @"Sadness"]) {
        //self.nameLabelEmotion.textColor = [UIColor colorWithRed:0.980 green:0.655 blue:0.424 alpha:1.0];
        //self.valueLabelEmotion.textColor = [UIColor colorWithRed:0.980 green:0.655 blue:0.424 alpha:1.0];
        self.emotionDescriptionLabel.text = @"Indicates a feeling of loss and disadvantage. When a person can be observed to be quiet, less energetic and withdrawn.";
         //self.emotionDescriptionLabel.textColor = [UIColor colorWithRed:0.980 green:0.655 blue:0.424 alpha:1.0];
     }

    NSLog (@"%@, %@", self.chartTop.piePieceName, self.chartTop.piePieceValue);
    
    
    for (SentenceTone *sentenceTone in self.sentenceTones) {
        NSLog(@"Sentence: %@", sentenceTone.sentence);
        for (ToneCategory *category in sentenceTone.toneCategories) {
            for (Tone *t in category.tones) {
                NSLog(@"Name: %@, Score: %@", t.name, t.score);
                if ([t.name isEqualToString: self.chartTop.piePieceName] && [t.score doubleValue] > 0.5) {
                    NSLog(@"Adding to highlight %@", t);
                    [self.sentencesToHighlight addObject:sentenceTone.sentence];
                }
            }
        }
    }
    
    for (NSString *sentence in self.sentencesToHighlight) {
        [self highlightText:sentence];
    }
    
    if ([self.sentencesToHighlight count]) {
        [self.sentencesToHighlight removeAllObjects];
    }
}

-(void) highlightText:(NSString *)srcTxt {
    NSUInteger srcTxtLen = srcTxt.length;
    int idx = 0;
    while (idx<(self.emotionSummaryView.text.length-srcTxtLen)) {
        NSRange srcRange = NSMakeRange(idx, srcTxtLen);
        if ([[self.emotionSummaryView.text substringWithRange:srcRange] isEqualToString:srcTxt]) {
            NSMutableAttributedString *tmpAttrTxt = [[NSMutableAttributedString alloc] initWithAttributedString:self.emotionSummaryView.attributedText];
            
            UIColor *color = [self color];
            
            [tmpAttrTxt addAttribute:NSBackgroundColorAttributeName value:color range:srcRange];
            self.emotionSummaryView.attributedText = tmpAttrTxt;
            idx += srcTxtLen;
        } else {
            idx++;
        }
    }
}
- (void)pieceMovingBackToOriginalPosition {
    NSRange srcRange = NSMakeRange(0, self.emotionSummaryView.text.length);
    NSMutableAttributedString *tmpAttrTxt = [[NSMutableAttributedString alloc] initWithAttributedString:self.emotionSummaryView.attributedText];
    [tmpAttrTxt addAttribute:NSBackgroundColorAttributeName value:[UIColor clearColor] range:srcRange];
    self.emotionSummaryView.attributedText = tmpAttrTxt;
    self.nameLabelEmotion.text = @"";
    self.emotionDescriptionLabel.text = @"";
}

-(UIColor*)color {
    
    UIColor *color = [UIColor new];
    
    if ([self.chartTop.piePieceName  isEqual: @"Anger"]) {
        color = [UIColor colorWithRed:0.231 green:0.690 blue:0.561 alpha:1.0];
        
    }
    
    if ([self.chartTop.piePieceName  isEqual: @"Disgust"]) {
        color = [UIColor colorWithRed:0.635 green:0.635 blue:0.816 alpha:1.0];
      
    }
    
    if ([self.chartTop.piePieceName  isEqual: @"Fear"]) {
        color = [UIColor colorWithRed:0.110 green:0.663 blue:0.788 alpha:1.0];

    }
    
    if ([self.chartTop.piePieceName  isEqual: @"Joy"]) {
        color = [UIColor colorWithRed:0.773 green:0.294 blue:0.549 alpha:1.0];
      
    }
    
    if ([self.chartTop.piePieceName  isEqual: @"Sadness"]) {
        color = [UIColor colorWithRed:0.980 green:0.655 blue:0.424 alpha:1.0];
    }

    return color;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"EmoToSocial"]) {
        
        SocialViewController *svc = (SocialViewController *)[segue destinationViewController];
        svc.data = self.data;
    }
    
    if ([[segue identifier] isEqualToString:@"EmoToLang"]) {
        
        LanguageViewController *lvc = (LanguageViewController *)[segue destinationViewController];
        lvc.data = self.data;
    }

}


@end
