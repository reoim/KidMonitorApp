//
//  GraphSharedInfo.h
//  KidMonitorApp
//
//  Created by Reo Lee on 28/05/2015.
//  Copyright (c) 2015 reoim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GraphSharedInfo : NSObject

+ (GraphSharedInfo *)sharedInstance;

- (NSArray *)datesInWeek;
- (NSArray *)datesInMonth;

@end
