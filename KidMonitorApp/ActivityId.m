//
//  ActivityId.m
//  KidMonitorApp
//
//  Created by Reo Lee on 3/06/2015.
//  Copyright (c) 2015 reoim. All rights reserved.
//

#import "ActivityId.h"

@implementation ActivityId

static NSString *activityId;

+(void)setActivityId:(NSString *)str {
    activityId = str;
}

+(NSString *)getActivityId {
    return activityId;
}

@end
