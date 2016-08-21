//
//  ToneCategory.m
//  API
//
//  Created by Rosalyn Kingsmill on 2016-06-02.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//

#import "ToneCategory.h"

@implementation ToneCategory

- (instancetype)init {
    self = [super init];
    if (self) {
        _tones = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
