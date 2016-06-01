//
//  Tone.m
//  API
//
//  Created by Rosalyn Kingsmill on 2016-05-31.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//

#import "Tone.h"

@implementation Tone

-(UIColor*)color {
    
    if ([self.name  isEqual: @"Anger"]) {
        return [UIColor redColor];
    }
    
    if ([self.name  isEqual: @"Disgust"]) {
        return [UIColor greenColor];
    }
    
    if ([self.name  isEqual: @"Fear"]) {
        return [UIColor blueColor];
    }
    
    if ([self.name  isEqual: @"Joy"]) {
        return [UIColor yellowColor];
    }
    
    if ([self.name  isEqual: @"Sadness"]) {
        return [UIColor orangeColor];
    }
    
    if ([self.name  isEqual: @"Openness"]) {
        return [UIColor redColor];
    }
    
    if ([self.name  isEqual: @"Conscientiousness"]) {
        return [UIColor greenColor];
    }
    
    if ([self.name  isEqual: @"Extraversion"]) {
        return [UIColor blueColor];
    }
    
    if ([self.name  isEqual: @"Agreeableness"]) {
        return [UIColor yellowColor];
    }
    
    if ([self.name  isEqual: @"Emotional Range"]) {
        return [UIColor orangeColor];
    }
    
    return nil;
}

@end
