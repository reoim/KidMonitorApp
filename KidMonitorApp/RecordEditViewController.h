//
//  RecordEditViewController.h
//  KidMonitorApp
//
//  Created by Reo Lee on 3/06/2015.
//  Copyright (c) 2015 reoim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "ActivityId.h"
#import "RecordTableViewCell.h"

@interface RecordEditViewController : UIViewController <UIAlertViewDelegate> {
    
}


@property (strong, nonatomic) NSString *editTime;
@property (strong, nonatomic) NSArray *activityObject;
@property (strong, nonatomic) NSString *selectedActivityId;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
@property (strong, nonatomic) IBOutlet UIDatePicker *timePicker;
- (IBAction)editButton:(id)sender;


@end
