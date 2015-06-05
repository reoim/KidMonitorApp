//
//  KidListTableViewController.h
//  KidMonitorApp
//
//  Created by Reo Lee on 6/05/2015.
//  Copyright (c) 2015 reoim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "SignInViewController.h"
#import "KidListTableViewCell.h"
#import "CategoryViewController.h"
#import "CurrentChildClass.h"

@interface KidListTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>{
 
    NSArray *kidList;
    NSString *childId;
}



@property (weak, nonatomic) IBOutlet UITableView *childTable;

- (IBAction)SignOutButton:(id)sender;

@end
