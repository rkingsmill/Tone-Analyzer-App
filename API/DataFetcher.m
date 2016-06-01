//
//  Data.m
//  API
//
//  Created by Rosalyn Kingsmill on 2016-05-31.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//

#import "DataFetcher.h"
#import "AFNetworking.h"

@implementation DataFetcher

-(DataFetcher*)returnData:(NSString*)text {
    
    NSString* base64Login = [NSString stringWithFormat:@"0eac7dd8-2216-424c-8d67-7922fa5e8ce1:ih1C4sryNgCV"];
    
    NSData *plainDataLogin = [base64Login dataUsingEncoding:NSUTF8StringEncoding];
    
    NSString *base64StringLogin = [NSString stringWithFormat:@"Basic %@", [plainDataLogin base64EncodedStringWithOptions:kNilOptions]];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:base64StringLogin forHTTPHeaderField:@"Authorization"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSString *content = text;
    
    NSString *urlString = @"https://gateway.watsonplatform.net/tone-analyzer/api/v3/tone?version=2016-05-19";
    
    NSDictionary *myDictionary = [[NSDictionary alloc]initWithObjectsAndKeys:
                                  content, @"text",
                                  nil];
    
    [manager POST:urlString parameters:myDictionary progress:nil success:^(NSURLSessionDataTask * _Nonnull task,NSDictionary *responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        NSArray *array =responseObject[@"document_tone"][@"tone_categories"];
        NSDictionary *dict1 = array[0];
        NSDictionary *dict2 = array[1];
        NSDictionary *dict3 = array[2];
        
        NSArray *arrayOfTones = dict1[@"tones"];
        NSArray *arrayOfTones2 = dict2[@"tones"];
        NSArray *arrayofTones3 = dict3[@"tones"];
        
        self.emotions = [[NSMutableArray alloc] init];
        
        for (NSDictionary *toneDict in arrayOfTones) {
            Tone *tone = [Tone new];
            tone.name = toneDict[@"tone_name"];
            NSString *decimalString = toneDict[@"score"];
            
            tone.value = [DataFetcher convertToPercent:decimalString];
            
            NSDictionary *emotionDict = [NSDictionary dictionaryWithObjectsAndKeys:tone.name, @"name", tone.value, @"value", tone.color, @"color", nil];
            
            [self.emotions addObject:emotionDict];
          
            NSLog (@"%@, %d%%", tone.name, tone.value);
        }
        
        for (NSDictionary *toneDict2 in arrayOfTones2) {
            NSString *name = toneDict2[@"tone_name"];
            NSString *decimalString = toneDict2[@"score"];
            
            int percent = [DataFetcher convertToPercent:decimalString];
            
            //get data for cocoa pod
            
            NSLog (@"%@, %d%%", name, percent);
        }
        
        for (NSDictionary *toneDict3 in arrayofTones3) {
            Tone *tone = [Tone new];
            tone.name = toneDict3[@"tone_name"];
            NSString *decimalString = toneDict3[@"score"];
            
            tone.value = [DataFetcher convertToPercent:decimalString];
            
            NSDictionary *socialDict = [NSDictionary dictionaryWithObjectsAndKeys:tone.name, @"name", tone.value, @"value", tone.color, @"color", nil];
            
            [self.socialTendency addObject:socialDict];
            
            NSLog(@"%@ %d%%", tone.name, tone.value);
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
        });
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Error: %@", error);
    }];
    
    return self;
}

+(int)convertToPercent:(NSString*)decimalString {
    
    float decimal = [decimalString floatValue];
    int percent = decimal * 100;
    return percent;
}



@end
