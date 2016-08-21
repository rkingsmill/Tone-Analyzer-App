//
//  DocumentTone.m
//  API
//
//  Created by Rosalyn Kingsmill on 2016-06-02.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//

#import "DocumentTone.h"

@implementation DocumentTone

- (instancetype)initWithToneCategories:(NSMutableArray *)toneCategories {
    self = [super init];
    if (self) {
        _toneCategories = toneCategories;
    }
    return self;
}

@end
