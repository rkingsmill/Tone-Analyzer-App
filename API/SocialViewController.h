//
//  SocialViewController.h
//  API
//
//  Created by Yasmin Ahmad on 2016-06-01.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Data.h"

@interface SocialViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIView *socialView;
@property (strong, nonatomic) IBOutlet UITextView *socialSummaryView;
@property (nonatomic, strong) Data* data;
@property (weak, nonatomic) NSString* text;
@property (weak, nonatomic) IBOutlet UIView *graphView;

@end
