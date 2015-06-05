//
//  SleepingViewController.h
//  KidMonitorApp
//
//  Created by Reo Lee on 7/05/2015.
//  Copyright (c) 2015 reoim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "CurrentChildClass.h"
#import "SleepTimeClass.h"




@interface SleepingViewController : UIViewController  <UIAlertViewDelegate> {
    
}

@property (strong, nonatomic) NSString *currentTime;
@property (strong, nonatomic) NSString *currentChildId;
@property (strong, nonatomic) NSString *startTime;
@property (strong, nonatomic) NSString *endTime;

@property (strong, nonatomic) NSDate *startTimeValue;
@property (strong, nonatomic) NSDate *endTimeValue;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIButton *stopButton;

- (IBAction)startRecord:(id)sender;

- (IBAction)stopRecord:(id)sender;

- (IBAction)passOutButton:(id)sender;

- (void)updateTimeLabel;


@end
