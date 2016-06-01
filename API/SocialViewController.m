//
//  SocialViewController.m
//  API
//
//  Created by Yasmin Ahmad on 2016-06-01.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//

#import "SocialViewController.h"

@implementation SocialViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIColor *borderColor = [UIColor colorWithRed:1.000 green:0.478 blue:0.000 alpha:1.0];
    self.socialView.layer.borderColor = borderColor.CGColor;
    self.socialView.layer.borderWidth = 4.0;
    self.socialView.layer.cornerRadius = 5.0;
    
    self.socialSummaryView.layer.borderColor = borderColor.CGColor;
    self.socialSummaryView.layer.borderWidth = 4.0;
    self.socialSummaryView.layer.cornerRadius = 5.0;
    
}





@end
