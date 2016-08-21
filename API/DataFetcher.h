//
//  Data.h
//  API
//
//  Created by Rosalyn Kingsmill on 2016-05-31.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DocumentTone;

@interface DataFetcher : NSObject

@property (nonatomic, strong) NSMutableArray *sentencesTones;
@property (nonatomic, strong) DocumentTone *dt;

-(void)fetchData:(NSString *)text
      completion:(void(^)(DataFetcher *fetcher))completion;

@end
