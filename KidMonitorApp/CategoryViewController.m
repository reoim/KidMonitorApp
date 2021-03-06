//
//  CategoryViewController.m
//  KidMonitorApp
//
//  Created by Reo Lee on 7/05/2015.
//  Copyright (c) 2015 reoim. All rights reserved.
//

#import "CategoryViewController.h"

@interface CategoryViewController ()

@end

@implementation CategoryViewController


- (void)viewDidLoad {
    [super viewDidLoad];
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
- (IBAction)SignOutButton:(id)sender {
    
    [PFUser logOut];
    PFUser *currentUser = [PFUser currentUser];
    
    if (!currentUser) {
        SignInViewController *signInVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SignInViewController"];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:signInVC];
        [self presentViewController:nav animated:YES completion:nil];
        
    } else {
        NSLog(@"%@", currentUser.username);
    }
    
    
    
}

- (IBAction)changeKidButton:(id)sender {
    KidListTableViewController *kidListTableVC = [self.storyboard instantiateViewControllerWithIdentifier:@"KidListTableViewController"];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:kidListTableVC];
    [self presentViewController:nav animated:YES completion:nil];
}

@end
