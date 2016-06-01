//
//  EmotionViewController.h
//  API
//
//  Created by Yasmin Ahmad on 2016-05-31.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TextViewController.h"

@interface EmotionViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *emotionView;
@property (strong, nonatomic) IBOutlet UITextView *emotionSummaryView;
@property (strong, nonatomic) NSObject *emotion;
@property (strong, nonatomic) IBOutlet UIView *emotionGraphView;

@end
