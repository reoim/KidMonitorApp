//
//  RecordTableViewCell.h
//  KidMonitorApp
//
//  Created by Reo Lee on 20/05/2015.
//  Copyright (c) 2015 reoim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface RecordTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *activityLabel;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;

@end
