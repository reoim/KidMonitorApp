//
//  LearningViewController.h
//  KidMonitorApp
//
//  Created by Reo Lee on 7/05/2015.
//  Copyright (c) 2015 reoim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "CurrentChildClass.h"

@interface LearningViewController : UIViewController <UIAlertViewDelegate> {
    
}
@property (strong, nonatomic) NSString *currentTime;
@property (strong, nonatomic) NSString *currentChildId;
- (IBAction)readButton:(id)sender;
- (IBAction)musicButton:(id)sender;
- (IBAction)puzzleButton:(id)sender;
- (IBAction)drawingButton:(id)sender;

@end
