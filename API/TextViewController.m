//
//  TextViewController.m
//  API
//
//  Created by Rosalyn Kingsmill on 2016-05-31.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//

#import "TextViewController.h"
#import "Data.h"
#import "GraphViewController.h"

@interface TextViewController ()

@property (nonatomic, weak) UIView *framingView;
@property (nonatomic, weak) NSLayoutConstraint *framingViewHeight;
@property (nonatomic, weak) NSLayoutConstraint *framingViewWidth;
@property (strong, nonatomic) NSString *placeholder;

@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet UILabel *headerLabel;
@property (strong, nonatomic) IBOutlet UIButton *analyzeButton;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *emotionButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *languageButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *socialButton;

@property (nonatomic, weak) UIToolbar *toolbar;
//@property (nonatomic, weak) UIBarButtonItem *barButton;
@property (nonatomic, strong) Data *data;


@end

@implementation TextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.headerLabel.textColor = [UIColor colorWithRed:0.373 green:0.745 blue:0.843 alpha:1.0];
    
    self.analyzeButton.layer.cornerRadius = self.analyzeButton.frame.size.height / 2;
    self.analyzeButton.backgroundColor = [UIColor colorWithRed:0.373 green:0.745 blue:0.843 alpha:1.0];
    
    self.emotionButton.tintColor = [UIColor colorWithRed:0.188 green:0.729 blue:0.561 alpha:1.0];
    self.languageButton.tintColor = [UIColor colorWithRed:0.765 green:0.392 blue:0.773 alpha:1.0];
    self.socialButton.tintColor = [UIColor colorWithRed:1.000 green:0.478 blue:0.000 alpha:1.0];
    
    
    UIColor *borderColor = [UIColor colorWithRed:0.373 green:0.745 blue:0.843 alpha:1.0];
    self.textView.layer.borderColor = borderColor.CGColor;
    self.textView.layer.borderWidth = 4.0;
    self.textView.layer.cornerRadius = 5.0;
    self.textView.backgroundColor = [UIColor colorWithRed:0.961 green:0.961 blue:0.961 alpha:1.0];
    
    self.framingView.layer.borderColor = borderColor.CGColor;
    self.framingView.layer.borderWidth = .0;
    self.framingView.layer.cornerRadius = 5.0;
    self.framingView.backgroundColor = [UIColor colorWithRed:0.961 green:0.961 blue:0.961 alpha:1.0];
    

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation

- (IBAction)analyzeText:(id)sender {
    self.data = [[Data alloc] init];
    self.data.content = self.textView.text;
//    self.data.content = localData.content;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"showGraph"]) {
        
         GraphViewController *gvc = (GraphViewController *)[segue destinationViewController];
         gvc.data = self.data;
    }
}


@end
