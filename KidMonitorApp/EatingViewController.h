//
//  EatingViewController.h
//  KidMonitorApp
//
//  Created by Reo Lee on 7/05/2015.
//  Copyright (c) 2015 reoim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "CurrentChildClass.h"

@interface EatingViewController : UIViewController <UIAlertViewDelegate> {
    
}
@property (strong, nonatomic) NSString *currentTime;
@property (strong, nonatomic) NSString *currentChildId;
- (IBAction)juiceButton:(id)sender;
- (IBAction)fruitButton:(id)sender;
- (IBAction)regularButton:(id)sender;
- (IBAction)snackButton:(id)sender;
- (IBAction)milkButton:(id)sender;
- (IBAction)softDrinkButton:(id)sender;

@end
