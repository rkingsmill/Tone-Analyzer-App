//
//  EmotionViewController.m
//  API
//
//  Created by Yasmin Ahmad on 2016-05-31.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//

#import "EmotionViewController.h"

@interface EmotionViewController ()

//@property (strong, nonatomic) UITextView *borderColor;

@end

@implementation EmotionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIColor *borderColor = [UIColor colorWithRed:0.188 green:0.729 blue:0.561 alpha:1.0];
    self.emotionSummaryView.layer.borderColor = borderColor.CGColor;
    self.emotionSummaryView.layer.borderWidth = 4.0;
    self.emotionSummaryView.layer.cornerRadius = 5.0;

    self.emotionView.layer.borderColor = borderColor.CGColor;
    self.emotionView.layer.borderWidth = 4.0;
    self.emotionView.layer.cornerRadius = 5.0;

}



@end
