//
//  Tone.m
//  API
//
//  Created by Rosalyn Kingsmill on 2016-05-31.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//

#import "Tone.h"

@implementation Tone

- (instancetype)initWithName:(NSString *)name
                       score:(NSNumber *)score {
    self = [super init];
    if (self) {
        _name = name;
        _score = score;
    }
    return self;
}

-(UIColor*)color {
    
    if ([self.name  isEqual: @"Anger"]) {
        return [UIColor colorWithRed:0.231 green:0.690 blue:0.561 alpha:1.0];
    }
    
    if ([self.name  isEqual: @"Disgust"]) {
        return [UIColor colorWithRed:0.635 green:0.635 blue:0.816 alpha:1.0];
    }
    
    if ([self.name  isEqual: @"Fear"]) {
        return [UIColor colorWithRed:0.110 green:0.663 blue:0.788 alpha:1.0];
    }
    
    if ([self.name  isEqual: @"Joy"]) {
        return [UIColor colorWithRed:0.773 green:0.294 blue:0.549 alpha:1.0];
    }
    
    if ([self.name  isEqual: @"Sadness"]) {
        return [UIColor colorWithRed:0.980 green:0.655 blue:0.424 alpha:1.0];
    }
    
    
    
    if ([self.name  isEqual: @"Openness"]) {
        return [UIColor colorWithRed:0.231 green:0.690 blue:0.561 alpha:1.0];
    }
    
    if ([self.name  isEqual: @"Conscientiousness"]) {
        return [UIColor colorWithRed:0.635 green:0.635 blue:0.816 alpha:1.0];
    }
    
    if ([self.name  isEqual: @"Extraversion"]) {
        return [UIColor colorWithRed:0.110 green:0.663 blue:0.788 alpha:1.0];
    }
    
    if ([self.name  isEqual: @"Agreeableness"]) {
        return [UIColor colorWithRed:0.773 green:0.294 blue:0.549 alpha:1.0];
    }
    
    if ([self.name  isEqual: @"Emotional Range"]) {
        return [UIColor colorWithRed:0.980 green:0.655 blue:0.424 alpha:1.0];
    }
    
    return nil;
}

@end



//[UIColor colorWithRed:0.871 green:0.365 blue:0.514 alpha:1.0] - Blush
