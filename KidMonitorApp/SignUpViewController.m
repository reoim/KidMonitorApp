//
//  SignUpViewController.m
//  KidMonitorApp
//
//  Created by Reo Lee on 6/05/2015.
//  Copyright (c) 2015 reoim. All rights reserved.
//

#import "SignUpViewController.h"


@interface SignUpViewController ()

@end

@implementation SignUpViewController
@synthesize userName;
@synthesize password;
@synthesize emailAddress;

//Dismiss keyboard when tab anywhere outside of keyboard
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [userName resignFirstResponder];
    [password resignFirstResponder];
    [emailAddress resignFirstResponder];
}

//Dismiss keyboard when click return key
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [userName resignFirstResponder];
    [password resignFirstResponder];
    [emailAddress resignFirstResponder];
    return YES;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    userName.delegate=self;
    password.delegate=self;
    emailAddress.delegate=self;
    
    
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


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == [alertView cancelButtonIndex]) {
        
        SignInViewController *signInVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SignInViewController"];
        [self presentViewController:signInVC animated:YES completion:nil];
        
    }
}

- (IBAction)signUpButton:(id)sender {
    
    PFUser *user = [PFUser user];
    user.username = userName.text.lowercaseString;
    user.password = password.text;
    user.email = emailAddress.text.lowercaseString;
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            UIAlertView *signUpAlert = [[UIAlertView alloc]
                                        initWithTitle:@"Welcome"
                                        message:@"You are successfully signed up!"
                                        delegate:self
                                        cancelButtonTitle:@"OK"
                                        otherButtonTitles:nil, nil];
            [signUpAlert show];
            
            
            
            
            //[self performSegueWithIdentifier:@"signUpSegue" sender:self];
           
        } else {
            
            NSString *errorString = [error userInfo][@"error"];
            UIAlertView *failAlert = [[UIAlertView alloc]
                                      initWithTitle:@"Sign up fail!"
                                      message:errorString
                                      delegate:self
                                      cancelButtonTitle:nil
                                      otherButtonTitles:@"OK", nil];
            [failAlert show];
            
        }
    }];
    
    
    
}
@end
