//
//  SignInViewController.m
//  KidMonitorApp
//
//  Created by Reo Lee on 5/05/2015.
//  Copyright (c) 2015 reoim. All rights reserved.
//

#import "SignInViewController.h"


@interface SignInViewController ()
@end

@implementation SignInViewController
@synthesize userNameTextField;
@synthesize passwordTextField;

// Dismiss keyboard when tab anywhere outside of keyboard
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [userNameTextField resignFirstResponder];
    [passwordTextField resignFirstResponder];
}


// Dismiss Keyboard when click return key
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [userNameTextField resignFirstResponder];
    [passwordTextField resignFirstResponder];
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        
        // do stuff with the user
        KidListTableViewController *kidListTableVC = [self.storyboard instantiateViewControllerWithIdentifier:@"KidListTableViewController"];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:kidListTableVC];
        [self presentViewController:nav animated:YES completion:nil];
        
    }
    
    
    userNameTextField.delegate=self;
    passwordTextField.delegate=self;
    
    
    
    // Do any additional setup after loading the view.
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



- (IBAction)signInButton:(id)sender {
    
    NSString *userName = userNameTextField.text;
    NSString *password = passwordTextField.text;
    
    [PFUser logInWithUsernameInBackground:userName password:password block:^(PFUser *user, NSError *error) {
        if (user) {
            
            KidListTableViewController *kidListTableVC = [self.storyboard instantiateViewControllerWithIdentifier:@"KidListTableViewController"];
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:kidListTableVC];
            [self presentViewController:nav animated:YES completion:nil];
            
//            KidListTableViewController *kidListTabeVC = [[KidListTableViewController alloc] init];
//            [self presentViewController:kidListTabeVC animated:YES completion:nil];
//            
            
        } else {
            UIAlertView *loginAert = [[UIAlertView alloc]
                                      initWithTitle:@"Login Fail"
                                      message:@"Invalid username or password"
                                      delegate:self
                                      cancelButtonTitle:@"OK"
                                      otherButtonTitles:nil, nil];
            [loginAert show];
            
        }
    }];
    
    
}
@end
