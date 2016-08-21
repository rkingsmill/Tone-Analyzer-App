//
//  SentenceTone.m
//  API
//
//  Created by Rosalyn Kingsmill on 2016-06-02.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//

#import "SentenceTone.h"

@implementation SentenceTone

- (instancetype)initWithSentence:(NSString *)sentence
                  toneCategories:(NSMutableArray *)toneCategories {
    self = [super init];
    if (self) {
        _sentence = sentence;
        _toneCategories = toneCategories;
    }
    return self;
}

@end
