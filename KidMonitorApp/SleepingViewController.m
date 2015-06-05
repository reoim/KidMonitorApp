//
//  SleepingViewController.m
//  KidMonitorApp
//
//  Created by Reo Lee on 7/05/2015.
//  Copyright (c) 2015 reoim. All rights reserved.
//

#import "SleepingViewController.h"

@interface SleepingViewController ()

@end

@implementation SleepingViewController
@synthesize currentChildId, startTime, endTime, startButton, stopButton, startTimeValue, endTimeValue, currentTime;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //update timelabel
    [self updateTimeLabel];
    
    
    
    
    //Retrieve current child id and store it in NSString currentChildId
    currentChildId = [CurrentChildClass getChildId];
    
    NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
    [timeFormat setDateFormat:@"MMM dd, yyyy, hh:mm a"];
    currentTime = [timeFormat stringFromDate:[NSDate date]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    //delegate method for unique alert with tag number
    if (alertView.tag == 100) {
        
        //if first button clicked, go back to previous page.
        if (buttonIndex == 0) {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
    
}


- (IBAction)startRecord:(id)sender {
    
//    startTimeValue = [NSDate date];
//    //disable startbutton
//    self.startButton.enabled = NO;
//    //enable stopbutton
//    self.stopButton.enabled = YES;
    [SleepTimeClass setStartTime:[NSDate date]];
    
    
    
    
    //save sleep activity in Activity class
    PFObject *activity = [PFObject objectWithClassName:@"Activity"];
    activity[@"childId"] = currentChildId;
    activity[@"recordedTime"] = currentTime;
    activity[@"activityType"] = @"Sleep";
    activity[@"activityDetail"] = @"Pass out";
    [activity saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            //If sleep activity is saved in activity class, save sleep start time in sleep class
            PFObject *start = [PFObject objectWithClassName:@"Sleep"];
            start[@"childId"] = currentChildId;
            start[@"startTime"] = currentTime;
            
            [start saveInBackgroundWithBlock:^(BOOL succeeded, NSError *er) {
                if (succeeded) {
                    
                    UIAlertView *recorded = [[UIAlertView alloc]
                                             initWithTitle:@"Sleep Time recording started!"
                                             message:@"Tap stop button when your child wakes up."
                                             delegate:self
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil, nil];
                    recorded.tag = 100;
                    [recorded show];
                    
                }
            }];
        } else {
            UIAlertView *fail = [[UIAlertView alloc]
                                     initWithTitle:@"Recording Failed!"
                                     message:@"Please Try Again."
                                     delegate:self
                                     cancelButtonTitle:@"OK"
                                     otherButtonTitles:nil, nil];
            //fail.tag = 100;
            [fail show];
            
            
        }
    }];
    
    
    

    
    
    
    
}

- (IBAction)stopRecord:(id)sender {
    
    startTimeValue = [SleepTimeClass getStartTime];
    endTimeValue = [NSDate date];
   
    //calculate time difference and save as integer
    NSTimeInterval totalTime = [endTimeValue timeIntervalSinceDate:startTimeValue];
    NSInteger sleepTime = round(totalTime);
    //NSLog(@"%li", (long)sleepTime);
    
    //convert nsinteger to nsstring (to save it in Parse)
    NSString *sleepTimeString = [NSString stringWithFormat:@"%ld", (long)sleepTime/60 ];
    
    NSString *sleepType;
    
    if (sleepTime < 60*30) {
        sleepType = @"Power nap";
    } else if (sleepTime < 60*60) {
        sleepType = @"Regular nap";
    } else if (sleepTime < 60*60*2) {
        sleepType = @"Afternoon sleep";
    } else {
        sleepType = @"Deep sleep";
    }
    

    //update activity detail based on sleeptype
    PFQuery *activityQuery = [PFQuery queryWithClassName:@"Activity"];
    [activityQuery whereKey:@"childId" equalTo:currentChildId];
    [activityQuery whereKey:@"activityType" equalTo:@"Sleep"];
    [activityQuery orderByDescending:@"createdAt"];
    [activityQuery getFirstObjectInBackgroundWithBlock:^(PFObject *activityObject, NSError *error) {
        activityObject[@"activityDetail"] = sleepType;
        [activityObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            
            //if updating is successful
            if (succeeded) {
                
                //update endTime in Sleep class
                PFQuery *query = [PFQuery queryWithClassName:@"Sleep"];
                [query whereKey:@"childId" equalTo:currentChildId];
                [query orderByDescending:@"createdAt"];
                [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
                    object[@"endTime"] = currentTime;
                    object[@"sleepTime"] = sleepTimeString;
                    object[@"sleepType"] = sleepType;
                    
                    [object saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                        if (succeeded) {
                            self.startButton.enabled = YES;
                            UIAlertView *recorded = [[UIAlertView alloc]
                                                     initWithTitle:@"Sleep Time recording ended!"
                                                     message:@"Your record is successfully saved."
                                                     delegate:self
                                                     cancelButtonTitle:@"OK"
                                                     otherButtonTitles:nil, nil];
                            recorded.tag = 100;
                            [recorded show];
                            
                        }
                    }];
                }];
            }
        }];
    }];
    
    
//    PFQuery *query = [PFQuery queryWithClassName:@"Sleep"];
//    [query whereKey:@"childId" equalTo:currentChildId];
//    [query orderByDescending:@"createdAt"];
//    [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
//        object[@"endTime"] = currentTime;
//        [object saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//            if (succeeded) {
//                self.startButton.enabled = YES;
//                UIAlertView *recorded = [[UIAlertView alloc]
//                                         initWithTitle:@"Sleep Time recording ended!"
//                                         message:@"Your record is successfully saved."
//                                         delegate:self
//                                         cancelButtonTitle:@"OK"
//                                         otherButtonTitles:nil, nil];
//                recorded.tag = 100;
//                [recorded show];
//                
//            }
//        }];
//    }];
//    
    

}
- (IBAction)passOutButton:(id)sender {
    
    PFObject *activity = [PFObject objectWithClassName:@"Activity"];
    activity[@"childId"] = currentChildId;
    activity[@"recordedTime"] = currentTime;
    activity[@"activityType"] = @"Sleep";
    activity[@"activityDetail"] = @"Pass out";
    [activity saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            UIAlertView *passoutAlert = [[UIAlertView alloc]
                                         initWithTitle:@"Sleep Time Recorded!"
                                         message:@"Your record is successfully saved."
                                         delegate:self
                                         cancelButtonTitle:@"OK"
                                         otherButtonTitles:nil, nil];
            passoutAlert.tag = 100;
            [passoutAlert show];
        }
    }];
    
}

- (void)updateTimeLabel {
    
    NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
    [timeFormat setDateFormat:@"hh:mm a"];
    
    self.timeLabel.text = [timeFormat stringFromDate:[NSDate date]];
    [self performSelector:@selector(updateTimeLabel) withObject:self afterDelay:60.0];
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/




@end
