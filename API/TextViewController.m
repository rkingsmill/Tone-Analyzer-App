//
//  TextViewController.m
//  API
//
//  Created by Rosalyn Kingsmill on 2016-05-31.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//

#import "TextViewController.h"
#import "Data.h"
#import "EmotionViewController.h"
#import "LanguageViewController.h"
#import "SocialViewController.h"

@interface TextViewController ()<UITextViewDelegate>

@property (nonatomic, weak) UIView *framingView;
@property (nonatomic, weak) NSLayoutConstraint *framingViewHeight;
@property (nonatomic, weak) NSLayoutConstraint *framingViewWidth;
@property (strong, nonatomic) NSString *placeholder;

@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet UIButton *clearButton;

@property (strong, nonatomic) IBOutlet UIView *bottomView;

@property (strong, nonatomic) IBOutlet UILabel *headerLabel;
@property (strong, nonatomic) IBOutlet UIButton *analyzeButton;

@property (strong, nonatomic) IBOutlet UIButton *languageButton;
@property (strong, nonatomic) IBOutlet UIButton *emotionButton;
@property (strong, nonatomic) IBOutlet UIButton *socialButton;

@property (nonatomic, weak) UIToolbar *toolbar;
@property (nonatomic, strong) Data *data;
@property (weak, nonatomic) NSString *placeholderText;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;

@end

@implementation TextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.headerLabel.textColor = [UIColor colorWithRed:0.961 green:0.961 blue:0.961 alpha:1.0];
    self.headerLabel.font = [UIFont fontWithName:@"Fabrica.otf" size:80.0f];
    
    self.analyzeButton.layer.cornerRadius = self.analyzeButton.frame.size.height / 2;
    self.analyzeButton.backgroundColor = [UIColor colorWithRed:0.671 green:0.573 blue:0.702 alpha:1.0];
    
    self.clearButton.layer.cornerRadius = self.clearButton.frame.size.height / 2;
    self.clearButton.backgroundColor = [UIColor colorWithRed:0.671 green:0.573 blue:0.702 alpha:1.0];
    
    
    self.emotionButton.layer.cornerRadius = self.emotionButton.frame.size.height / 2;
    self.emotionButton.backgroundColor =[UIColor colorWithRed:0.671 green:0.573 blue:0.702 alpha:1.0];
    
    
    self.languageButton.layer.cornerRadius = self.languageButton.frame.size.height / 2;
    self.languageButton.backgroundColor =[UIColor colorWithRed:0.671 green:0.573 blue:0.702 alpha:1.0];
    
    //soap
    self.socialButton.layer.cornerRadius = self.socialButton.frame.size.height / 2;
    self.socialButton.backgroundColor =[UIColor colorWithRed:0.671 green:0.573 blue:0.702 alpha:1.0];
    
    UIColor *borderColor = [UIColor colorWithRed:0.808 green:0.784 blue:0.937 alpha:1.0];
//    self.textView.layer.borderColor = borderColor.CGColor;
//    self.textView.layer.borderWidth = 4.0;
    self.textView.layer.cornerRadius = 5.0;
    self.textView.backgroundColor = [UIColor colorWithRed:0.961 green:0.961 blue:0.961 alpha:1.0];
    self.textView.textColor = [UIColor colorWithRed:0.404 green:0.404 blue:0.404 alpha:1.0];
    
    self.framingView.layer.borderColor = borderColor.CGColor;
    self.framingView.layer.borderWidth = .0;
    self.framingView.layer.cornerRadius = 5.0;
    self.framingView.backgroundColor = [UIColor colorWithRed:0.961 green:0.961 blue:0.961 alpha:1.0];
    
    [self moveBottomViewUp:NO];

    self.textView.text = @"";
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
        
 }

-(void)viewWillAppear:(BOOL)animated {
  
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.topItem.title = @"";

}
- (IBAction)clearText:(id)sender {
    
    self.textView.text = @"";
     
     }

-(void)moveBottomViewUp:(BOOL)up{
    
    CGFloat bottomConstant = up ? 0 : -90;
    self.bottomConstraint.constant = bottomConstant;
   
    
    [UIView animateWithDuration:1.5 delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [self.view layoutIfNeeded];
    } completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation

- (IBAction)analyze:(id)sender {
    self.data = [[Data alloc] init];
    self.data.content = self.textView.text;
    [self.textView resignFirstResponder];
    
    [self moveBottomViewUp:YES];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"ShowEmotion"]) {
        
        EmotionViewController *evc = (EmotionViewController *)[segue destinationViewController];
        evc.data = self.data;
    }
    
    if ([[segue identifier] isEqualToString:@"ShowSocial"]) {
        
        SocialViewController *svc = (SocialViewController *)[segue destinationViewController];
        svc.data = self.data;
    }
    
    if ([[segue identifier] isEqualToString:@"ShowLanguage"]) {
        
        LanguageViewController *lvc = (LanguageViewController *)[segue destinationViewController];
        lvc.data = self.data;
    }
    
    if ([[segue identifier] isEqualToString:@"ShowEmotion"]) {
        
        EmotionViewController *evc = [segue destinationViewController];
        evc.self.emotionUserText = self.textView.text;
        
        }
    
    if ([[segue identifier] isEqualToString:@"ShowLanguage"]) {
        
        LanguageViewController *lvc = [segue destinationViewController];
        lvc.self.languageUserText = self.textView.text;
        
    }
    
    if ([[segue identifier] isEqualToString:@"ShowSocial"]) {
        
        SocialViewController *svc = [segue destinationViewController];
        svc.self.socialUserText = self.textView.text;
        
    }

    
    }


@end
