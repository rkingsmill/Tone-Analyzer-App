//
//  LanguageViewController.h
//  API
//
//  Created by Yasmin Ahmad on 2016-06-01.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Data.h"
#import "VBPieChart.h"

@interface LanguageViewController : UIViewController

@property (nonatomic, strong) Data* data;
@property (weak, nonatomic) NSString* text;
@property (strong, nonatomic) NSString *languageUserText; 
@property (weak, nonatomic) IBOutlet UILabel *valueAnalyticalLabel;
@property (weak, nonatomic) IBOutlet UILabel *valueConfidenceLabel;
@property (weak, nonatomic) IBOutlet UILabel *valueTentativeLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionAnalyticalLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionConfidenceLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionTentativeLabel;


@end
