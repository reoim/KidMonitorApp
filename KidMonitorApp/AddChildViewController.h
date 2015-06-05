//
//  AddChildViewController.h
//  KidMonitorApp
//
//  Created by Reo Lee on 6/05/2015.
//  Copyright (c) 2015 reoim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "KidListTableViewController.h"

@interface AddChildViewController : UIViewController <UIImagePickerControllerDelegate, UITextFieldDelegate> {
    UITextField *childNameTextField;
    UITextField *childAgeTextField;

}

@property (strong, nonatomic) IBOutlet UITextField *childNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *childAgeTextField;
@property (strong, nonatomic) IBOutlet UIImageView *childImageView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) NSString *childGender;

- (IBAction)changeGender:(UISegmentedControl *)sender;

- (IBAction)addPhoto:(id)sender;

- (IBAction)addChild:(id)sender;

@end
