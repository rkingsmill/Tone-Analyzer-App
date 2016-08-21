//
//  SentenceTone.h
//  API
//
//  Created by Rosalyn Kingsmill on 2016-06-02.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SentenceTone : NSObject

@property (nonatomic, strong) NSString *sentence;
@property (nonatomic, strong) NSMutableArray *toneCategories;

- (instancetype)initWithSentence:(NSString *)sentence
                  toneCategories:(NSMutableArray *)toneCategories;

@end
