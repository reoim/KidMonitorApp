//
//  PlayingViewController.h
//  KidMonitorApp
//
//  Created by Reo Lee on 7/05/2015.
//  Copyright (c) 2015 reoim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "CurrentChildClass.h"

@interface PlayingViewController : UIViewController <UIAlertViewDelegate> {
    
}
@property (strong, nonatomic) NSDate *currentTime;
@property (strong, nonatomic) NSString *currentChildId;
- (IBAction)ballingButton:(id)sender;
- (IBAction)tvButton:(id)sender;
- (IBAction)outDoorButton:(id)sender;
- (IBAction)bikeButton:(id)sender;
- (IBAction)runButton:(id)sender;
- (IBAction)jumpButton:(id)sender;

@end
