//
//  EatingViewController.m
//  KidMonitorApp
//
//  Created by Reo Lee on 7/05/2015.
//  Copyright (c) 2015 reoim. All rights reserved.
//

#import "EatingViewController.h"

@interface EatingViewController ()

@end

@implementation EatingViewController
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

- (IBAction)juiceButton:(id)sender {
    
    PFObject *activity = [PFObject objectWithClassName:@"Activity"];
    activity[@"childId"] = currentChildId;
    activity[@"recordedTime"] = currentTime;
    activity[@"activityType"] = @"Eating";
    activity[@"activityDetail"] = @"Juice";
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

- (IBAction)fruitButton:(id)sender {
    
    PFObject *activity = [PFObject objectWithClassName:@"Activity"];
    activity[@"childId"] = currentChildId;
    activity[@"recordedTime"] = currentTime;
    activity[@"activityType"] = @"Eating";
    activity[@"activityDetail"] = @"Fruit";
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

- (IBAction)regularButton:(id)sender {
    
    PFObject *activity = [PFObject objectWithClassName:@"Activity"];
    activity[@"childId"] = currentChildId;
    activity[@"recordedTime"] = currentTime;
    activity[@"activityType"] = @"Eating";
    activity[@"activityDetail"] = @"Regular meal";
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

- (IBAction)snackButton:(id)sender {
    
    PFObject *activity = [PFObject objectWithClassName:@"Activity"];
    activity[@"childId"] = currentChildId;
    activity[@"recordedTime"] = currentTime;
    activity[@"activityType"] = @"Eating";
    activity[@"activityDetail"] = @"Snack";
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

- (IBAction)milkButton:(id)sender {
    
    PFObject *activity = [PFObject objectWithClassName:@"Activity"];
    activity[@"childId"] = currentChildId;
    activity[@"recordedTime"] = currentTime;
    activity[@"activityType"] = @"Eating";
    activity[@"activityDetail"] = @"Milk";
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

- (IBAction)softDrinkButton:(id)sender {
    
    PFObject *activity = [PFObject objectWithClassName:@"Activity"];
    activity[@"childId"] = currentChildId;
    activity[@"recordedTime"] = currentTime;
    activity[@"activityType"] = @"Eating";
    activity[@"activityDetail"] = @"Soft drink";
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
