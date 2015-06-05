//
//  AddChildViewController.m
//  KidMonitorApp
//
//  Created by Reo Lee on 6/05/2015.
//  Copyright (c) 2015 reoim. All rights reserved.
//

#import "AddChildViewController.h"

@interface AddChildViewController ()

@end

@implementation AddChildViewController
@synthesize childNameTextField;
@synthesize childAgeTextField;
@synthesize childImageView;
@synthesize segmentedControl;
@synthesize childGender;


//Dismiss keyboard when tab anywhere outside of keyboard
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [childNameTextField resignFirstResponder];
    [childAgeTextField resignFirstResponder];
}


//Dismiss keyboard when click return button
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [childNameTextField resignFirstResponder];
    return YES;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    childNameTextField.delegate = self;
    childAgeTextField.delegate = self;
    
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


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    [picker dismissViewControllerAnimated:YES completion:^{
        childImageView.image = [info objectForKey:UIImagePickerControllerOriginalImage];
    }];
    
}

- (IBAction)changeGender:(UISegmentedControl *)sender {
    
    
    
    switch (self.segmentedControl.selectedSegmentIndex) {
        
        case 0:
            childGender = @"boy";
            break;
            
        case 1:
            childGender = @"girl";
            
        default:
            break;
    }
    
}

- (IBAction)addPhoto:(id)sender {
    
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    [self presentViewController:imagePickerController animated:YES completion:nil];
    
}

- (IBAction)addChild:(id)sender {
    
                                                                                                                                                                                                                                                                                                                
    //Convert UIimage to NSData
    NSData *imageData = UIImagePNGRepresentation(childImageView.image);
    //Save NSData to PFFile
    PFFile *imageFile = [PFFile fileWithName:@"image.png" data:imageData];
    
    
    PFUser *currentUser = [PFUser currentUser];
    
    PFObject *child = [PFObject objectWithClassName:@"Child"];
    child[@"userId"] = currentUser.objectId;
    child[@"childName"] = childNameTextField.text;
    child[@"childAge"] = childAgeTextField.text;
    child[@"childGender"] = childGender;
    child[@"childImage"] = imageFile;
    
    [child saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            KidListTableViewController *kidListVC = [self.storyboard instantiateViewControllerWithIdentifier:@"KidListTableViewController"];
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:kidListVC];
            [self presentViewController:nav animated:YES completion:nil];
        } else {
            NSLog(@"%@", error);
        }
        
    }];
    
    
    
    
    
}
@end
