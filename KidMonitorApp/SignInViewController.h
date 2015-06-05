//
//  SignInViewController.h
//  KidMonitorApp
//
//  Created by Reo Lee on 5/05/2015.
//  Copyright (c) 2015 reoim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "KidListTableViewController.h"


@interface SignInViewController : UIViewController <UITextFieldDelegate> {

    UITextField *userNameTextField;
    UITextField *passwordTextField;
    
}

@property (strong, nonatomic) IBOutlet UITextField *userNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;


- (IBAction)signInButton:(id)sender;

@end
