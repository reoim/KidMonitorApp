//
//  CurrentChildClass.m
//  KidMonitorApp
//
//  Created by Reo Lee on 20/05/2015.
//  Copyright (c) 2015 reoim. All rights reserved.
//

#import "CurrentChildClass.h"

@implementation CurrentChildClass

static NSString *childId;

+(void)setChildId:(NSString *)str {
    childId = str;
}

+(NSString *)getChildId {
    return childId;
}

@end
