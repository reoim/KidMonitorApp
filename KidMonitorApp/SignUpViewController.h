//
//  SignUpViewController.h
//  KidMonitorApp
//
//  Created by Reo Lee on 6/05/2015.
//  Copyright (c) 2015 reoim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "SignInViewController.h"

@interface SignUpViewController : UIViewController <UITextFieldDelegate, UIAlertViewDelegate> {
    UITextField *userName;
    UITextField *password;
    UITextField *emailAddress;
}


@property (strong, nonatomic) IBOutlet UITextField *userName;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet UITextField *emailAddress;


- (IBAction)signUpButton:(id)sender;


@end
