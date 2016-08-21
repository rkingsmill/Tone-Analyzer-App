//
//  LanguageViewController.m
//  API
//
//  Created by Yasmin Ahmad on 2016-06-01.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//

#import "LanguageViewController.h"
#import "DataFetcher.h"
#import "DocumentTone.h"
#import "ToneCategory.h"
#import "Tone.h"
#import "SentenceTone.h"
#import "EmotionViewController.h"
#import "SocialViewController.h"

@interface LanguageViewController ()

@property (strong, nonatomic) IBOutlet UIView *languageView;
@property (strong, nonatomic) IBOutlet UITextView *languageSummaryView;
@property (strong, nonatomic) IBOutlet UIView *languageGraphView;

@property (nonatomic, strong) NSMutableArray *sentenceTones;
@property (nonatomic, strong) NSMutableArray *sentencesToHighlight;
@property (strong, nonatomic) IBOutlet UIButton *socialSwitchButton;
@property (strong, nonatomic) IBOutlet UIButton *emotionSwitchButton;

@end

@implementation LanguageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.data) {
        self.text = self.data.content;
    }

    UIColor *borderColor = [UIColor colorWithRed:0.808 green:0.784 blue:0.937 alpha:1.0];
    self.languageSummaryView.layer.borderColor = borderColor.CGColor;
    self.languageSummaryView.layer.borderWidth = 2.0;
    self.languageSummaryView.layer.cornerRadius = 5.0;
    self.languageSummaryView.text = self.languageUserText;
    self.languageSummaryView.editable = NO;
    self.languageSummaryView.backgroundColor = [UIColor colorWithRed:0.961 green:0.961 blue:0.961 alpha:1.0];
    self.languageSummaryView.textColor = [UIColor colorWithRed:0.404 green:0.404 blue:0.404 alpha:1.0]; 
    
//    self.languageView.layer.borderColor = borderColor.CGColor;
//    self.languageView.layer.borderWidth = 4.0;
    self.languageView.layer.cornerRadius = 5.0;
    self.languageView.backgroundColor = [UIColor colorWithRed:0.961 green:0.961 blue:0.961 alpha:1.0]; 
    
    
    self.valueAnalyticalLabel.layer.cornerRadius = self.valueAnalyticalLabel.frame.size.height / 2;
    self.valueAnalyticalLabel.clipsToBounds = YES;
    
    UIColor *borderColorAna = [UIColor colorWithRed:0.773 green:0.294 blue:0.549 alpha:1.0];
    self.valueAnalyticalLabel.layer.borderColor = borderColorAna.CGColor;
    self.valueAnalyticalLabel.layer.borderWidth = 4.0;
    self.valueAnalyticalLabel.textColor = [UIColor colorWithRed:0.773 green:0.294 blue:0.549 alpha:1.0];
    
    self.valueConfidenceLabel.layer.cornerRadius = self.valueConfidenceLabel.frame.size.height / 2;
    self.valueConfidenceLabel.clipsToBounds = YES;
    
    UIColor *borderColorCon = [UIColor colorWithRed:0.227 green:0.659 blue:0.757 alpha:1.0];
    self.valueConfidenceLabel.layer.borderColor = borderColorCon.CGColor;
    self.valueConfidenceLabel.layer.borderWidth = 4.0;
    self.valueConfidenceLabel.textColor = [UIColor colorWithRed:0.227 green:0.659 blue:0.757 alpha:1.0];
    
    self.valueTentativeLabel.layer.cornerRadius = self.valueTentativeLabel.frame.size.height / 2;
    self.valueTentativeLabel.clipsToBounds = YES;
    
    UIColor *borderColorTen = [UIColor colorWithRed:0.992 green:0.322 blue:0.251 alpha:1.0];
    self.valueTentativeLabel.layer.borderColor = borderColorTen.CGColor;
    self.valueTentativeLabel.layer.borderWidth = 4.0;
    self.valueTentativeLabel.textColor = [UIColor colorWithRed:0.992 green:0.322 blue:0.251 alpha:1.0];
    
    
    self.navigationController.navigationBar.topItem.title = @"HOME";
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    
    self.emotionSwitchButton.layer.cornerRadius = self.emotionSwitchButton.frame.size.height / 2;
    self.emotionSwitchButton.backgroundColor =[UIColor colorWithRed:0.671 green:0.573 blue:0.702 alpha:1.0];
    
    self.socialSwitchButton.layer.cornerRadius = self.socialSwitchButton.frame.size.height / 2;
    self.socialSwitchButton.backgroundColor =[UIColor colorWithRed:0.671 green:0.573 blue:0.702 alpha:1.0];
    
    
    
    DataFetcher *fetcher = [DataFetcher new];
    
    [fetcher fetchData:self.text completion:^(DataFetcher *fetcher) {
        
        self.sentenceTones = [fetcher.sentencesTones copy];
        
        NSMutableDictionary<NSString*, NSNumber*> *tones = [[NSMutableDictionary alloc] init];
        for (ToneCategory *category in fetcher.dt.toneCategories) {
            if ([category.name isEqualToString:@"Language Tone"]) {
                for (Tone *t in category.tones) {
                    tones[t.name] = t.score;
                }
                break;
            }
        }
        NSNumber *analyticalScore = tones[@"Analytical"];
        NSNumber *confidentScore = tones[@"Confident"];
        NSNumber *tentativeScore = tones[@"Tentative"];
        
        NSLog (@"%@, %@, %@", analyticalScore, confidentScore, tentativeScore);
        
        int int1 =  floorf(analyticalScore.floatValue * 100);
        NSString* value = [NSString stringWithFormat:@"%d%%", int1];
        
        self.valueAnalyticalLabel.text = value;
        
        int int2 = floorf(confidentScore.floatValue * 100);
        NSString* value2 = [NSString stringWithFormat:@"%d%%", int2];
        self.valueConfidenceLabel.text = value2;
        
        int int3 = floorf(tentativeScore.floatValue * 100);
        NSString* value3 = [NSString stringWithFormat:@"%d%%", int3];
        self.valueTentativeLabel.text = value3;
        
        //SET TEXT COLORS HERE
        
        self.descriptionAnalyticalLabel.text = @"ANALYTICAL: A person's reasoning.";
        self.descriptionAnalyticalLabel.textColor = [UIColor colorWithRed:0.773 green:0.294 blue:0.549 alpha:1.0];
        
        self.descriptionConfidenceLabel.text = @"CONFIDENCE: A person's degree of certainty.";
        self.descriptionConfidenceLabel.textColor = [UIColor colorWithRed:0.227 green:0.659 blue:0.757 alpha:1.0];
        
        self.descriptionTentativeLabel.text = @"TENTATIVE: A person's degree of inhibition.";
        self.descriptionTentativeLabel.textColor = [UIColor colorWithRed:0.992 green:0.322 blue:0.251 alpha:1.0];
        
        //SET TEXT COLORS DESCRIPTION
    }];
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"LangToSocial"]) {
        
        SocialViewController *svc = (SocialViewController *)[segue destinationViewController];
        svc.data = self.data;
    }
    
    if ([[segue identifier] isEqualToString:@"LangToEmo"]) {
        
        EmotionViewController *evc = (EmotionViewController *)[segue destinationViewController];
        evc.data = self.data;
    }
    
}




@end



