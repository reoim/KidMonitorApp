//
//  PlayingViewController.m
//  KidMonitorApp
//
//  Created by Reo Lee on 7/05/2015.
//  Copyright (c) 2015 reoim. All rights reserved.
//

#import "PlayingViewController.h"

@interface PlayingViewController ()

@end

@implementation PlayingViewController
@synthesize currentChildId, currentTime;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Retrieve current child id and store it in NSString currentChildId
    currentChildId = [CurrentChildClass getChildId];
    
    //save string format of current time to currentTime
    NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
    [timeFormat setDateFormat:@"MMM dd, yyyy, hh:mm a"];
    currentTime = [timeFormat stringFromDate:[NSDate date]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    //delegate method for unique alert with tag number
    if (alertView.tag == 100) {
        
        //if first button clicked, go back to previous page.
        if (buttonIndex == 0) {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
    
}


- (IBAction)ballingButton:(id)sender {
    
    PFObject *activity = [PFObject objectWithClassName:@"Activity"];
    activity[@"childId"] = currentChildId;
    activity[@"recordedTime"] = currentTime;
    activity[@"activityType"] = @"Playing";
    activity[@"activityDetail"] = @"Playing with ball";
    [activity saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            UIAlertView *recorded = [[UIAlertView alloc]
                                     initWithTitle:@"Success!"
                                     message:@"Your record is successfully saved."
                                     delegate:self
                                     cancelButtonTitle:nil
                                     otherButtonTitles:@"OK", nil];
            
            //set alert as unique alert by assigning tag number
            recorded.tag = 100;
            [recorded show];
        }
    }];
}

- (IBAction)tvButton:(id)sender {
    
    PFObject *activity = [PFObject objectWithClassName:@"Activity"];
    activity[@"childId"] = currentChildId;
    activity[@"recordedTime"] = currentTime;
    activity[@"activityType"] = @"Playing";
    activity[@"activityDetail"] = @"Watching TV";
    [activity saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            UIAlertView *recorded = [[UIAlertView alloc]
                                     initWithTitle:@"Success!"
                                     message:@"Your record is successfully saved."
                                     delegate:self
                                     cancelButtonTitle:nil
                                     otherButtonTitles:@"OK", nil];
            
            //set alert as unique alert by assigning tag number
            recorded.tag = 100;
            [recorded show];
        }
    }];
}

- (IBAction)outDoorButton:(id)sender {
    
    PFObject *activity = [PFObject objectWithClassName:@"Activity"];
    activity[@"childId"] = currentChildId;
    activity[@"recordedTime"] = currentTime;
    activity[@"activityType"] = @"Playing";
    activity[@"activityDetail"] = @"Playing outside";
    [activity saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            UIAlertView *recorded = [[UIAlertView alloc]
                                     initWithTitle:@"Success!"
                                     message:@"Your record is successfully saved."
                                     delegate:self
                                     cancelButtonTitle:nil
                                     otherButtonTitles:@"OK", nil];
            
            //set alert as unique alert by assigning tag number
            recorded.tag = 100;
            [recorded show];
        }
    }];
}

- (IBAction)bikeButton:(id)sender {
    
    PFObject *activity = [PFObject objectWithClassName:@"Activity"];
    activity[@"childId"] = currentChildId;
    activity[@"recordedTime"] = currentTime;
    activity[@"activityType"] = @"Playing";
    activity[@"activityDetail"] = @"Riding bicycle";
    [activity saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            UIAlertView *recorded = [[UIAlertView alloc]
                                     initWithTitle:@"Success!"
                                     message:@"Your record is successfully saved."
                                     delegate:self
                                     cancelButtonTitle:nil
                                     otherButtonTitles:@"OK", nil];
            
            //set alert as unique alert by assigning tag number
            recorded.tag = 100;
            [recorded show];
        }
    }];
}

- (IBAction)runButton:(id)sender {
    
    PFObject *activity = [PFObject objectWithClassName:@"Activity"];
    activity[@"childId"] = currentChildId;
    activity[@"recordedTime"] = currentTime;
    activity[@"activityType"] = @"Playing";
    activity[@"activityDetail"] = @"Running";
    [activity saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            UIAlertView *recorded = [[UIAlertView alloc]
                                     initWithTitle:@"Success!"
                                     message:@"Your record is successfully saved."
                                     delegate:self
                                     cancelButtonTitle:nil
                                     otherButtonTitles:@"OK", nil];
            //set alert as unique alert by assigning tag number
            recorded.tag = 100;
            [recorded show];
        }
    }];
}

- (IBAction)jumpButton:(id)sender {
    
    PFObject *activity = [PFObject objectWithClassName:@"Activity"];
    activity[@"childId"] = currentChildId;
    activity[@"recordedTime"] = currentTime;
    activity[@"activityType"] = @"Playing";
    activity[@"activityDetail"] = @"Jumping";
    [activity saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            UIAlertView *recorded = [[UIAlertView alloc]
                                     initWithTitle:@"Success!"
                                     message:@"Your record is successfully saved."
                                     delegate:self
                                     cancelButtonTitle:nil
                                     otherButtonTitles:@"OK", nil];
            //set alert as unique alert by assigning tag number
            recorded.tag = 100;
            [recorded show];
        }
    }];
}
@end
