//
//  Tone.h
//  API
//
//  Created by Rosalyn Kingsmill on 2016-05-31.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Tone : NSObject

@property (weak, nonatomic) NSString* name;
@property (nonatomic) int value;
//@property (weak, nonatomic) UIColor* color;

-(UIColor*)color;

@end
