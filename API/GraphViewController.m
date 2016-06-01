//
//  GraphViewController.m
//  API
//
//  Created by Rosalyn Kingsmill on 2016-05-31.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//

#import "GraphViewController.h"
#import "DataFetcher.h"
#import "VBPieChart.h"


@interface GraphViewController ()

@end

@implementation GraphViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.data) {
        
        self.text = self.data.content;
    }
    
    DataFetcher *fetcher = [DataFetcher new];
    
    //Get data from server
    
    [fetcher returnData:self.text];
    //Make graphs in storyboard
    VBPieChart *chartTop = [[VBPieChart alloc] initWithFrame:CGRectMake(10, 50, 200, 200)];
    [self.imageViewOne addSubview:chartTop];
    chartTop.holeRadiusPrecent = 0.7;
    
    NSArray *emotionsArray = [fetcher.emotions copy];
    [chartTop setChartValues:emotionsArray animation:YES duration:0.4 options:VBPieChartAnimationFan];
    
    VBPieChart *chartBottom = [[VBPieChart alloc] initWithFrame:CGRectMake(100, 50, 200, 200)];
    
    [self.imageViewThree addSubview:chartBottom];
    chartBottom.holeRadiusPrecent = 0.7;
    
    NSArray *socialTendencyArray = [fetcher.socialTendency copy];
    [chartBottom setChartValues:socialTendencyArray animation:YES duration:0.4 options:VBPieChartAnimationFan];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
