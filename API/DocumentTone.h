//
//  DocumentTone.h
//  API
//
//  Created by Rosalyn Kingsmill on 2016-06-02.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DocumentTone : NSObject

@property (nonatomic, strong) NSMutableArray *toneCategories;

- (instancetype)initWithToneCategories:(NSMutableArray *)toneCategories;

@end
