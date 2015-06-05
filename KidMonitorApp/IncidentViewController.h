//
//  IncidentViewController.h
//  KidMonitorApp
//
//  Created by Reo Lee on 7/05/2015.
//  Copyright (c) 2015 reoim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "CurrentChildClass.h"

@interface IncidentViewController : UIViewController <UIAlertViewDelegate> {
    
}
@property (strong, nonatomic) NSString *currentTime;
@property (strong, nonatomic) NSString *currentChildId;
- (IBAction)sickButton:(id)sender;
- (IBAction)fightButton:(id)sender;
- (IBAction)scoldButton:(id)sender;
- (IBAction)beAlone:(id)sender;
- (IBAction)injuryButton:(id)sender;

@end
