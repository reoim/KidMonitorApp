//
//  KidListTableViewController.m
//  KidMonitorApp
//
//  Created by Reo Lee on 6/05/2015.
//  Copyright (c) 2015 reoim. All rights reserved.
//

#import "KidListTableViewController.h"


@interface KidListTableViewController ()

@end

@implementation KidListTableViewController
@synthesize childTable;

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    [self performSelector:@selector(retrieveFromParse)];
    
}




- (void)retrieveFromParse {
    
    PFUser *currentUser = [PFUser currentUser];
    PFQuery *query = [PFQuery queryWithClassName:@"Child"];
    [query whereKey:@"userId" equalTo:currentUser.objectId];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            //The find succeeded.
            
            kidList = [[NSArray alloc] initWithArray:objects];
            
            [childTable reloadData];
            
            
        }
    }];
    

    
    
    
}

//pass currentchild id to next view
//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    
//    
//    
//    NSLog(@"prepareForSegue: %@", segue.identifier);
//    if ([segue.identifier isEqualToString:@"tabSegue"]) {
//        NSIndexPath *indexPath = [self.tableView indexPathsForSelectedRows];
//        PFObject *currentKid = [kidList objectAtIndex:indexPath.row];
////        childId = [currentKid objectId];
//        
//        
//        
//        CategoryViewController *transferViewController = segue.destinationViewController;
//        transferViewController.currentChild = currentKid;
//    }
//    
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return kidList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    KidListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    
    PFObject *kidObject = [kidList objectAtIndex:indexPath.row];
    PFFile *kidFile = [kidObject objectForKey:@"childImage"];
    [kidFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
        if (!error) {
            cell.ThumbImage.image = [UIImage imageWithData:data];
        }
    }];
    
    
    cell.nameLabel.text = [kidObject objectForKey:@"childName"];
    cell.genderLabel.text = [kidObject objectForKey:@"childGender"];
    cell.ageLabel.text = [kidObject objectForKey:@"childAge"];
    
    
    
    
    
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Save child name from selected row to object
    PFObject *currentKid = [kidList objectAtIndex:indexPath.row];
    childId = [currentKid objectId];
    NSLog(@"%@", childId);
    [CurrentChildClass setChildId:childId];
    
    
    [self performSegueWithIdentifier:@"tabSegue" sender:self];

    
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    
    
    return cell;
}
*/



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
@end
