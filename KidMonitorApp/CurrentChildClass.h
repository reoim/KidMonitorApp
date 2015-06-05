//
//  CurrentChildClass.h
//  KidMonitorApp
//
//  Created by Reo Lee on 20/05/2015.
//  Copyright (c) 2015 reoim. All rights reserved.
//

#import <Foundation/Foundation.h>



//custom class to store current child id
@interface CurrentChildClass : NSString

//class method to set child id
+(void)setChildId:(NSString *)str;
//class method to get child id
+(NSString *)getChildId;

@end
