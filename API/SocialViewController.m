//
//  SocialViewController.m
//  API
//
//  Created by Yasmin Ahmad on 2016-06-01.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//

#import "SocialViewController.h"
#import "DataFetcher.h"
#import "VBPieChart.h"
#import "DocumentTone.h"
#import "ToneCategory.h"
#import "Tone.h"
#import "SentenceTone.h"
#import "EmotionViewController.h"
#import "LanguageViewController.h"

@interface SocialViewController ()

@property VBPieChart *chartSocial;
@property NSNumber *pieceValue;
@property (nonatomic, strong) NSMutableArray *sentenceTones;
@property (nonatomic, strong) NSMutableArray *sentencesToHighlight;
@property (strong, nonatomic) IBOutlet UIButton *languageSwitchButton;
@property (strong, nonatomic) IBOutlet UIButton *emotionSwitchButton;

@end

@implementation SocialViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.data) {
        
        self.text = self.data.content;
    }
    
    UIColor *borderColor = [UIColor colorWithRed:0.808 green:0.784 blue:0.937 alpha:1.0];
//    self.socialView.layer.borderColor = borderColor.CGColor;
//    self.socialView.layer.borderWidth = 4.0;
    self.socialView.layer.cornerRadius = 5.0;
    self.socialView.backgroundColor = [UIColor colorWithRed:0.961 green:0.961 blue:0.961 alpha:1.0];
    
    self.socialSummaryView.layer.borderColor = borderColor.CGColor;
    self.socialSummaryView.layer.borderWidth = 2.0;
    self.socialSummaryView.layer.cornerRadius = 5.0;
    self.socialSummaryView.backgroundColor = [UIColor colorWithRed:0.961 green:0.961 blue:0.961 alpha:1.0];
    self.socialSummaryView.textColor = [UIColor colorWithRed:0.404 green:0.404 blue:0.404 alpha:1.0]; 
    
    self.socialSummaryView.text = self.socialUserText;
    self.socialSummaryView.editable = NO;
    
    self.navigationController.navigationBar.topItem.title = @"HOME";
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    
    self.emotionSwitchButton.layer.cornerRadius = self.emotionSwitchButton.frame.size.height / 2;
    self.emotionSwitchButton.backgroundColor =[UIColor colorWithRed:0.671 green:0.573 blue:0.702 alpha:1.0];
    
    self.languageSwitchButton.layer.cornerRadius = self.languageSwitchButton.frame.size.height / 2;
    self.languageSwitchButton.backgroundColor =[UIColor colorWithRed:0.671 green:0.573 blue:0.702 alpha:1.0];
    
    
    
    DataFetcher *fetcher = [DataFetcher new];
    
    self.sentenceTones = [[NSMutableArray alloc] init];
    self.sentencesToHighlight = [[NSMutableArray alloc] init];
    
    [fetcher fetchData:self.text completion:^(DataFetcher *fetcher) {
        
        //CAN EDIT CHART SIZE AND POSITION NEXT LINE
        self.chartSocial = [[VBPieChart alloc] initWithFrame:CGRectMake(40, 25, 200, 200)];
        self.chartSocial.delegate = self;
        [self.graphView addSubview:self.chartSocial];
        self.chartSocial.holeRadiusPrecent = 0.5;
        
        self.sentenceTones = [fetcher.sentencesTones copy];
        
        NSMutableArray *tones = [[NSMutableArray alloc] init];
        for (ToneCategory *category in fetcher.dt.toneCategories) {
            
            if ([category.name isEqualToString:@"Social Tone"]) {
                for (Tone *t in category.tones) {
                    [tones addObject:@{@"name" : t.name, @"value": t.score, @"color": t.color}];
            }
              break;
            }
        }
        [self.chartSocial setChartValues:tones animation:YES duration:0.4 options:VBPieChartAnimationFan];
    }];
}

-(void)getPieceName{
    
    NSString *name = self.chartSocial.piePieceName;
    
    if (name == nil) {
        return;
    }

    int int1 = floorf(self.chartSocial.piePieceValue.floatValue * 100);
    NSString* value = [NSString stringWithFormat:@"%d", int1];
    
    NSString *displayLabel = [NSString stringWithFormat:@"%@: %@/100",name, value];
    self.nameLabelSocial.text = displayLabel;
    
//    self.nameLabelSocial.text = self.chartSocial.piePieceName;
//    self.valueLabelSocial.text = [self.chartSocial.piePieceValue stringValue];
    
    if ([self.chartSocial.piePieceName  isEqual: @"Openness"]) {
        self.nameLabelSocial.textColor = [UIColor colorWithRed:0.231 green:0.690 blue:0.561 alpha:1.0];
        self.descriptionLabelSocial.text = @"The extent a person is open to experience a variety of activities.";
        self.descriptionLabelSocial.textColor = [UIColor colorWithRed:0.231 green:0.690 blue:0.561 alpha:1.0];
    }
    
    if ([self.chartSocial.piePieceName  isEqual: @"Conscientiousness"]) {
        self.nameLabelSocial.textColor = [UIColor colorWithRed:0.635 green:0.635 blue:0.816 alpha:1.0];
        self.descriptionLabelSocial.text = @"The tendency to act in an organized or thoughtful way.";
        self.descriptionLabelSocial.textColor = [UIColor colorWithRed:0.635 green:0.635 blue:0.816 alpha:1.0];
    }
    
    if ([self.chartSocial.piePieceName  isEqual: @"Extraversion"]) {
        self.nameLabelSocial.textColor = [UIColor colorWithRed:0.110 green:0.663 blue:0.788 alpha:1.0];
        self.descriptionLabelSocial.text = @"The tendency to seek stimulation in the company of others.";
        self.descriptionLabelSocial.textColor = [UIColor colorWithRed:0.110 green:0.663 blue:0.788 alpha:1.0];
    }
    
    if ([self.chartSocial.piePieceName  isEqual: @"Agreeableness"]) {
        self.nameLabelSocial.textColor = [UIColor colorWithRed:0.773 green:0.294 blue:0.549 alpha:1.0];
        self.descriptionLabelSocial.text = @"The tendency to be compassionate and cooperative towards others.";
        self.descriptionLabelSocial.textColor = [UIColor colorWithRed:0.773 green:0.294 blue:0.549 alpha:1.0];
    }
    
    if ([self.chartSocial.piePieceName  isEqual: @"Emotional Range"]) {
        self.nameLabelSocial.textColor = [UIColor colorWithRed:0.980 green:0.655 blue:0.424 alpha:1.0];
        self.descriptionLabelSocial.text = @"The extent a person’s emotion is sensitive to the environment.";
        self.descriptionLabelSocial.textColor = [UIColor colorWithRed:0.980 green:0.655 blue:0.424 alpha:1.0];
    }
    
    
    for (SentenceTone *sentenceTone in self.sentenceTones) {
        NSLog(@"Sentence: %@", sentenceTone.sentence);
        for (ToneCategory *category in sentenceTone.toneCategories) {
            for (Tone *t in category.tones) {
                NSLog(@"Name: %@, Score: %@", t.name, t.score);
                if ([t.name isEqualToString: self.chartSocial.piePieceName] && [t.score doubleValue] > 0.6) {
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
    while (idx<(self.socialSummaryView.text.length-srcTxtLen)) {
        NSRange srcRange = NSMakeRange(idx, srcTxtLen);
        if ([[self.socialSummaryView.text substringWithRange:srcRange] isEqualToString:srcTxt]) {
            NSMutableAttributedString *tmpAttrTxt = [[NSMutableAttributedString alloc] initWithAttributedString:self.socialSummaryView.attributedText];
            
            UIColor *color = [self color];
            
            [tmpAttrTxt addAttribute:NSBackgroundColorAttributeName value:color range:srcRange];
            self.socialSummaryView.attributedText = tmpAttrTxt;
            idx += srcTxtLen;
        } else {
            idx++;
        }
    }
}

- (void)pieceMovingBackToOriginalPosition {
    NSRange srcRange = NSMakeRange(0, self.socialSummaryView.text.length);
    NSMutableAttributedString *tmpAttrTxt = [[NSMutableAttributedString alloc] initWithAttributedString:self.socialSummaryView.attributedText];
    [tmpAttrTxt addAttribute:NSBackgroundColorAttributeName value:[UIColor clearColor] range:srcRange];
    self.socialSummaryView.attributedText = tmpAttrTxt;
    self.nameLabelSocial.text = @"";
    self.descriptionLabelSocial.text = @"";
}

-(UIColor*)color {
    
    UIColor *color = [UIColor new];
    
    if ([self.chartSocial.piePieceName  isEqual: @"Openness"]) {
        color = [UIColor colorWithRed:0.231 green:0.690 blue:0.561 alpha:1.0];
        
    }
    
    if ([self.chartSocial.piePieceName  isEqual: @"Conscientiousness"]) {
        color = [UIColor colorWithRed:0.635 green:0.635 blue:0.816 alpha:1.0];
        
    }
    
    if ([self.chartSocial.piePieceName  isEqual: @"Extraversion"]) {
        color = [UIColor colorWithRed:0.110 green:0.663 blue:0.788 alpha:1.0];
        
    }
    
    if ([self.chartSocial.piePieceName  isEqual: @"Agreeableness"]) {
        color = [UIColor colorWithRed:0.773 green:0.294 blue:0.549 alpha:1.0];
        
    }
    
    if ([self.chartSocial.piePieceName  isEqual: @"Emotional Range"]) {
        color = [UIColor colorWithRed:0.980 green:0.655 blue:0.424 alpha:1.0];
    }
    
    return color;
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"SocialToEmo"]) {
        
        EmotionViewController *evc = (EmotionViewController *)[segue destinationViewController];
        evc.data = self.data;
    }
    
    if ([[segue identifier] isEqualToString:@"SocialToLang"]) {
        
        LanguageViewController *lvc = (LanguageViewController *)[segue destinationViewController];
        lvc.data = self.data;
    }
    
}





@end
