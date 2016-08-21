//
//  EmotionViewController.h
//  API
//
//  Created by Yasmin Ahmad on 2016-05-31.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TextViewController.h"
#import "Data.h"
#import "VBPieChart.h"

@interface EmotionViewController : UIViewController <PieChartDelegate>

@property (strong, nonatomic) IBOutlet UIView *emotionView;
@property (strong, nonatomic) IBOutlet UITextView *emotionSummaryView;
@property (strong, nonatomic) NSObject *emotion;
@property (strong, nonatomic) IBOutlet UIView *emotionGraphView;
@property (strong, nonatomic) IBOutlet UILabel *emotionDescriptionLabel;
@property (nonatomic, strong) Data* data;
@property (weak, nonatomic) NSString* text;
@property (weak, nonatomic) IBOutlet UILabel *nameLabelEmotion;
@property (strong, nonatomic) UITextView *emotionText;
@property (strong, nonatomic) NSString *emotionUserText;

-(void)getPieceName;

@end
