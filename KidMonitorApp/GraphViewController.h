//
//  GraphViewController.h
//  KidMonitorApp
//
//  Created by Reo Lee on 28/05/2015.
//  Copyright (c) 2015 reoim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ShinobiCharts/ShinobiCharts.h>
#import "GraphSharedInfo.h"
#import <Parse/Parse.h>
#import "CurrentChildClass.h"

@interface GraphViewController : UIViewController <SChartDatasource, SChartDelegate> {
    NSArray *graphData;
    
}

@property (strong, nonatomic) NSString *currentChildId;
@property (strong, nonatomic) NSString *todayDate;
@property (strong, nonatomic) NSString *thisMonth;
@end
