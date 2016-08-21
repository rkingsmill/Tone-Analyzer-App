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
@property (nonatomic) NSNumber *score;
//@property UIColor *color;

- (instancetype)initWithName:(NSString *)name
                       score:(NSNumber *)score;
- (UIColor*)color;

@end
