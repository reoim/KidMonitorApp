//
//  SleepTimeClass.m
//  KidMonitorApp
//
//  Created by Reo Lee on 20/05/2015.
//  Copyright (c) 2015 reoim. All rights reserved.
//

#import "SleepTimeClass.h"

@implementation SleepTimeClass

static NSDate *start;
//static NSDate *end;

+(void)setStartTime:(NSDate *)startTime {
    start = startTime;
}

//+(void)setEndTime:(NSDate *)endTime {
//    end = endTime;
//}

+(NSDate *)getStartTime {
    return start;
}

//+(NSDate *)getEndTime {
//    return end;
//}
@end
