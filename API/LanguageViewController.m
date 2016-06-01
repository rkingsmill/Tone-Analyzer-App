//
//  LanguageViewController.m
//  API
//
//  Created by Yasmin Ahmad on 2016-06-01.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//

#import "LanguageViewController.h"

@interface LanguageViewController ()

@property (strong, nonatomic) IBOutlet UIView *languageView;
@property (strong, nonatomic) IBOutlet UITextView *languageSummaryView;
@property (strong, nonatomic) IBOutlet UIView *languageGraphView;

@end

@implementation LanguageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIColor *borderColor = [UIColor colorWithRed:0.765 green:0.392 blue:0.773 alpha:1.0];
self.languageSummaryView.layer.borderColor = borderColor.CGColor;
self.languageSummaryView.layer.borderWidth = 4.0;
self.languageSummaryView.layer.cornerRadius = 5.0;
    
self.languageView.layer.borderColor = borderColor.CGColor;
self.languageView.layer.borderWidth = 4.0;
self.languageView.layer.cornerRadius = 5.0;

}


@end



