//
//  Data.m
//  API
//
//  Created by Rosalyn Kingsmill on 2016-05-31.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//

#import "DataFetcher.h"
#import "AFNetworking.h"
#import "SentenceTone.h"
#import "ToneCategory.h"
#import "DocumentTone.h"
#import "Tone.h"

@implementation DataFetcher

-(void)fetchData:(NSString *)text completion:(void (^)(DataFetcher *))completion {
    
    NSString* base64Login = [NSString stringWithFormat:@"99dd474c-ef96-4b79-8cc2-4e8c03a903f3:t8uzCZIb17U6"];
    
    NSData *plainDataLogin = [base64Login dataUsingEncoding:NSUTF8StringEncoding];
    
    NSString *base64StringLogin = [NSString stringWithFormat:@"Basic %@", [plainDataLogin base64EncodedStringWithOptions:kNilOptions]];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:base64StringLogin forHTTPHeaderField:@"Authorization"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSString *content = text;
    
    NSString *urlString = @"https://gateway.watsonplatform.net/tone-analyzer/api/v3/tone?version=2016-08-18"; // must append ->  /v3/tone?version=2016-05-19
    
    NSDictionary *myDictionary = @{@"text": content};
    
    [manager POST:urlString parameters:myDictionary progress:nil success:^(NSURLSessionDataTask * _Nonnull task,NSDictionary *responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        // PARSE AND TURN DATA TO MODELS FOR DOCUMENT TONES
        NSMutableArray *documentToneCategories = [[NSMutableArray alloc] init];
        NSDictionary *documentTone = responseObject[@"document_tone"];
        for (NSDictionary *toneCategory in documentTone[@"tone_categories"]) {
            ToneCategory *category = [[ToneCategory alloc] init];
            category.name = toneCategory[@"category_name"];
            for (NSDictionary *tone in toneCategory[@"tones"]) {
                Tone *t = [[Tone alloc] initWithName:tone[@"tone_name"] score:tone[@"score"]];
                [category.tones addObject:t];
            }
            [documentToneCategories addObject:category];
        }
        _dt = [[DocumentTone alloc] initWithToneCategories:documentToneCategories];
        
        // PARSE AND TURN DATA TO MODELS FOR DOCUMENT TONES
        _sentencesTones = [[NSMutableArray alloc] init];
        NSArray *sentencesTone = responseObject[@"sentences_tone"];
        for (NSDictionary *sentenceTone in sentencesTone) {
            NSString *sentence = sentenceTone[@"text"];
            NSArray *toneCategories = sentenceTone[@"tone_categories"];
            NSMutableArray *sentencesToneCategories = [[NSMutableArray alloc] init];
            for (NSDictionary *toneCategory in toneCategories) {
                ToneCategory *category = [[ToneCategory alloc] init];
                category.name = toneCategory[@"category_name"];
                NSArray *tones = toneCategory[@"tones"];
                for (NSDictionary *tone in tones) {
                    Tone *t = [[Tone alloc] initWithName:tone[@"tone_name"] score:tone[@"score"]];
                    [category.tones addObject:t];
                }
                [sentencesToneCategories addObject:category];
            }
            
            SentenceTone *s = [[SentenceTone alloc] initWithSentence:sentence
                                                      toneCategories:sentencesToneCategories];
            [_sentencesTones addObject:s];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(self);
        });
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSError *underError = error.userInfo[@"NSUnderlyingError"];
        NSData *responseData = underError.userInfo[@"com.alamofire.serialization.response.error.data"];
        NSLog(@"Error: %@", error);
    }];
}
        
//        NSArray *array =responseObject[@"document_tone"][@"tone_categories"];
//        NSDictionary *dict1 = array[0];
//        NSDictionary *dict2 = array[1];
//        NSDictionary *dict3 = array[2];
//        
//        NSArray *arrayOfTones = dict1[@"tones"];
//        NSArray *arrayOfTones2 = dict2[@"tones"];
//        NSArray *arrayofTones3 = dict3[@"tones"];
//        
//        self.emotions = [[NSMutableArray alloc] init];
//        self.socialTendency = [[NSMutableArray alloc]init];
//        self.languageStyle = [[NSMutableArray alloc]init];
//        
//        for (NSDictionary *toneDict in arrayOfTones) {
//            Tone *tone = [Tone new];
//            tone.name = toneDict[@"tone_name"];
//            NSString *decimalString = toneDict[@"score"];
//            
//            tone.value = [DataFetcher convertToPercent:decimalString];
//            
//            NSLog (@"%@, %@ %d%%", tone.name, tone.color, tone.value);
//            
//            NSDictionary *emotionDict = @{@"name": tone.name,
//                                          @"value": @(tone.value),
//                                          @"color": tone.color};
//            
//            [self.emotions addObject:emotionDict];
//        }
//        
//        for (NSDictionary *toneDict2 in arrayOfTones2) {
//            Tone *tone = [Tone new];
//            tone.name = toneDict2[@"tone_name"];
//            NSString *decimalString = toneDict2[@"score"];
//            
//            tone.value = [DataFetcher convertToPercent:decimalString];
//            
//            NSDictionary *languageDict = @{@"name": tone.name,
//                                           @"value": @(tone.value)};
//            
//            NSLog (@"%@, %d%%", tone.name, tone.value);
//            
//            [self.languageStyle addObject:languageDict];
//        }
//        
//        for (NSDictionary *toneDict3 in arrayofTones3) {
//            Tone *tone = [Tone new];
//            tone.name = toneDict3[@"tone_name"];
//            NSString *decimalString = toneDict3[@"score"];
//            
//            tone.value = [DataFetcher convertToPercent:decimalString];
//            
//            NSLog (@"%@, %@ %d%%", tone.name, tone.color, tone.value);
//            
//            NSDictionary *socialDict = @{@"name": tone.name,
//                                         @"value": @(tone.value),
//                                         @"color": tone.color};
//            
//            [self.socialTendency addObject:socialDict];
//        }
//        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            complete(self);
//        });
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"Error: %@", error);
//    }];
//    
//}


@end
