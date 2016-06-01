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

-(DataFetcher*)returnData:(NSString*)text;
+(int)convertToPercent:(NSString*)decimalString;


@end
