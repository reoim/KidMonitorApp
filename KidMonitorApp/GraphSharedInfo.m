//
//  GraphSharedInfo.m
//  KidMonitorApp
//
//  Created by Reo Lee on 28/05/2015.
//  Copyright (c) 2015 reoim. All rights reserved.
//

#import "GraphSharedInfo.h"

@interface GraphSharedInfo()
@end

@implementation GraphSharedInfo

#pragma mark - Class methods

+ (GraphSharedInfo *)sharedInstance {
    static GraphSharedInfo *sharedInstance;
    
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

#pragma mark - API methods

- (NSArray *)datesInWeek
{
    static NSArray *dates = nil;
    if (!dates)
    {
        dates = [NSArray arrayWithObjects:
                 @"4/23",
                 @"4/24",
                 @"4/25",
                 @"4/26",
                 @"4/27",
                 nil];
    }
    return dates;
}


- (NSArray *)datesInMonth
{
    static NSArray *dates = nil;
    if (!dates)
    {
        dates = [NSArray arrayWithObjects:
                 @"2",
                 @"3",
                 @"4",
                 @"5",
                 @"9",
                 @"10",
                 @"11",
                 @"12",
                 @"13",
                 @"16",
                 @"17",
                 @"18",
                 @"19",
                 @"20",
                 @"23",
                 @"24",
                 @"25",
                 @"26",
                 @"27",
                 @"30",
                 nil];
    }
    return dates;
}


@end

