//
//  EmotionViewController.h
//  KidMonitorApp
//
//  Created by Reo Lee on 7/05/2015.
//  Copyright (c) 2015 reoim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "CurrentChildClass.h"


@interface EmotionViewController : UIViewController <UIAlertViewDelegate> {
    
}
@property (strong, nonatomic) NSString *currentTime;
@property (strong, nonatomic) NSString *currentChildId;

- (IBAction)happyButton:(id)sender;
- (IBAction)excitedButton:(id)sender;
- (IBAction)angryButton:(id)sender;
- (IBAction)sadButton:(id)sender;
- (IBAction)shyButton:(id)sender;
- (IBAction)panicButton:(id)sender;

@end
