//
//  PWMeasureText.m
//  PWMeasureText
//
//  Created by Nick on 2018/5/7.
//  Copyright © 2018年 hisense. All rights reserved.
//
#if __has_include(<React/RCTConvert.h>)
#import <React/RCTConvert.h>
#elif __has_include("RCTConvert.h")
#import "RCTConvert.h"
#else
#import "React/RCTConvert.h"   // Required when used as a Pod in a Swift project
#endif

#import "PWMeasureText.h"

@implementation PWMeasureText

RCT_EXPORT_MODULE();

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_METHOD(measure:(NSArray *)array
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
    NSMutableArray* results = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < array.count; i++) {
        UIFont * font = [UIFont systemFontOfSize: [[array objectAtIndex:i] floatValue]];
        CGRect rect = [@" " boundingRectWithSize:CGSizeMake(MAXFLOAT,MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font} context:nil];
        [results addObject:@(ceil(rect.size.height))];
    }
    resolve(results);
}

@end
