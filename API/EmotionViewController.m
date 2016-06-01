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

@interface EmotionViewController ()

//@property (strong, nonatomic) UITextView *borderColor;

@end

@implementation EmotionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.data) {
        
        self.text = self.data.content;
    }
    
    UIColor *borderColor = [UIColor colorWithRed:0.188 green:0.729 blue:0.561 alpha:1.0];
    self.emotionSummaryView.layer.borderColor = borderColor.CGColor;
    self.emotionSummaryView.layer.borderWidth = 4.0;
    self.emotionSummaryView.layer.cornerRadius = 5.0;

    self.emotionView.layer.borderColor = borderColor.CGColor;
    self.emotionView.layer.borderWidth = 4.0;
    self.emotionView.layer.cornerRadius = 5.0;
    
    DataFetcher *fetcher = [DataFetcher new];
    
    //Get data from server
    [fetcher fetchData:self.text onComplete:^(DataFetcher *fetcher) {
    
        VBPieChart *chartTop = [[VBPieChart alloc] initWithFrame:CGRectMake(10, 50, 300, 300)];
        [self.emotionGraphView addSubview:chartTop];
        chartTop.holeRadiusPrecent = 0.5;
        
        NSArray *emotionsArray = [fetcher.emotions copy];
        
        [chartTop setLabelsPosition:VBLabelsPositionCustom];
        [chartTop setLabelBlock:^CGPoint( CALayer *layer, NSInteger index) {
            CGPoint p = CGPointMake(sin(-index/10.0*M_PI)*50+50, index*30);
            return p;
            }];
        
        [chartTop setChartValues:emotionsArray animation:YES duration:0.4 options:VBPieChartAnimationFan];
  
    }];

}

@end
