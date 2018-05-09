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
- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(measure:(NSDictionary *)options
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
    if ([options objectForKey:@"fontSize"] == nil) {
        reject(@"invalid_fontSize", @"missing required fontSize property", nil);
        return;
    }
    
    CGSize size = CGSizeMake(MAXFLOAT,MAXFLOAT);
    
    UIFont * font = [UIFont systemFontOfSize: [RCTConvert CGFloat:options[@"fontSize"]]];
    
    CGRect rect = [@" " boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font} context:nil];
    
    resolve(@(ceil(rect.size.height)));
}

@end
