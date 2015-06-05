//
//  RecordEditViewController.m
//  KidMonitorApp
//
//  Created by Reo Lee on 3/06/2015.
//  Copyright (c) 2015 reoim. All rights reserved.
//

#import "RecordEditViewController.h"

@interface RecordEditViewController ()

@end

@implementation RecordEditViewController
@synthesize nameLabel, timeLabel, timePicker, selectedActivityId, activityObject, editTime;

- (void)viewDidLoad {
    [super viewDidLoad];

    

    // Do any additional setup after loading the view.
}


- (void)viewWillAppear:(BOOL)animated {
    
    [self performSelector:@selector(retrieveFromParse)];
    
}



- (void)retrieveFromParse {
    
    selectedActivityId = [ActivityId getActivityId];
    PFQuery *query = [PFQuery queryWithClassName:@"Activity"];
    [query whereKey:@"objectId" equalTo:selectedActivityId];
    [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
        if (!error) {
            
            nameLabel.text = [NSString stringWithFormat:@"%@", object[@"activityDetail"]];
            timeLabel.text = [NSString stringWithFormat:@"%@", object[@"recordedTime"]];
        }
    }];

//    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
//        if (!error) {
//            activityObject = [[NSArray alloc] initWithArray:objects];
//            
//        }
//    }];
//    
    
}


-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    //delegate method for unique alert with tag number
    if (alertView.tag == 50) {
        
        //if first button clicked, go back to previous page.
        if (buttonIndex == 0) {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
    
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

- (IBAction)editButton:(id)sender {
    
    NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
    [timeFormat setDateFormat:@"MMM dd, yyyy, hh:mm a"];
    editTime = [timeFormat stringFromDate:timePicker.date];
    
    PFQuery *updateQuery = [PFQuery queryWithClassName:@"Activity"];
    [updateQuery getObjectInBackgroundWithId:selectedActivityId block:^(PFObject *upObject, NSError *err) {
        upObject[@"recordedTime"] = editTime;
        [upObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (succeeded) {
                UIAlertView *editAlert = [[UIAlertView alloc]
                                         initWithTitle:@"Success!"
                                         message:@"Your record is successfully edited."
                                         delegate:self
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"OK", nil];
                
                //set alert as unique alert by assigning tag number
                editAlert.tag = 50;
                [editAlert show];
            }
        }];
    }];
    
    
}
@end
