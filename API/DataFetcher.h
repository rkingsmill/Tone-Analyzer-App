//
//  Data.h
//  API
//
//  Created by Rosalyn Kingsmill on 2016-05-31.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tone.h"

@interface DataFetcher : NSObject

@property (nonatomic, strong) NSMutableArray *emotions;
@property (nonatomic, strong) NSMutableArray *languageStyle;
@property (nonatomic, strong) NSMutableArray *socialTendency;

-(void)fetchData:(NSString*)text onComplete:(void(^)(DataFetcher *fetcher))complete;
+(int)convertToPercent:(NSString*)decimalString;


@end
