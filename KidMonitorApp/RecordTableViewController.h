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
#import "SignInViewController.h"
#import "KidListTableViewController.h"

@interface RecordTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource> {
    NSArray *activityLog;
    NSString *activityId;
}
@property (weak, nonatomic) IBOutlet UITableView *activityLogTable;
@property (strong, nonatomic) NSString *currentChildId;

- (IBAction)changeKidButton:(id)sender;
- (IBAction)signOutButton:(id)sender;

@end
