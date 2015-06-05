//
//  RecordTableViewController.h
//  KidMonitorApp
//
//  Created by Reo Lee on 7/05/2015.
//  Copyright (c) 2015 reoim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "CurrentChildClass.h"
#import "RecordTableViewCell.h"
#import "ActivityId.h"

@interface RecordTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource> {
    NSArray *activityLog;
    NSString *activityId;
}
@property (weak, nonatomic) IBOutlet UITableView *activityLogTable;
@property (strong, nonatomic) NSString *currentChildId;

@end
