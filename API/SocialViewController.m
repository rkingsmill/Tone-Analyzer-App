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

@implementation SocialViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.data) {
        
        self.text = self.data.content;
    }
    
    UIColor *borderColor = [UIColor colorWithRed:1.000 green:0.478 blue:0.000 alpha:1.0];
    self.socialView.layer.borderColor = borderColor.CGColor;
    self.socialView.layer.borderWidth = 4.0;
    self.socialView.layer.cornerRadius = 5.0;
    
    self.socialSummaryView.layer.borderColor = borderColor.CGColor;
    self.socialSummaryView.layer.borderWidth = 4.0;
    self.socialSummaryView.layer.cornerRadius = 5.0;
    
    DataFetcher *fetcher = [DataFetcher new];
    
    //Get data from server
    [fetcher fetchData:self.text onComplete:^(DataFetcher *fetcher) {
        
        VBPieChart *chartSocial = [[VBPieChart alloc] initWithFrame:CGRectMake(10, 50, 300, 300)];
        [self.graphView addSubview:chartSocial];
        chartSocial.holeRadiusPrecent = 0.5;
        
        NSArray *socialArray = [fetcher.socialTendency copy];
        
        [chartSocial setLabelsPosition:VBLabelsPositionCustom];
        [chartSocial setLabelBlock:^CGPoint( CALayer *layer, NSInteger index) {
            CGPoint p = CGPointMake(sin(-index/10.0*M_PI)*50+50, index*30);
            return p;
        }];
        
        [chartSocial setChartValues:socialArray animation:YES duration:0.4 options:VBPieChartAnimationFan];
        
    }];

}





@end
