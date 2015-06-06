//
//  RecordTableViewController.m
//  KidMonitorApp
//
//  Created by Reo Lee on 7/05/2015.
//  Copyright (c) 2015 reoim. All rights reserved.
//

#import "RecordTableViewController.h"

@interface RecordTableViewController ()

@end

@implementation RecordTableViewController
@synthesize activityLogTable, currentChildId;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}


//reload tableview when view load
- (void)viewWillAppear:(BOOL)animated {
    
    [self performSelector:@selector(retrieveFromParse)];
    
}



- (void)retrieveFromParse {
    
    currentChildId = [CurrentChildClass getChildId];
    PFQuery *query = [PFQuery queryWithClassName:@"Activity"];
    [query whereKey:@"childId" equalTo:currentChildId];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            activityLog = [[NSArray alloc] initWithArray:objects];
            [activityLogTable reloadData];
        }
    }];
    
    
}

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
    return activityLog.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RecordTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"recordCell" forIndexPath:indexPath];
    
    PFObject *logObject = [activityLog objectAtIndex:indexPath.row];
    
    cell.activityLabel.text = [logObject objectForKey:@"activityDetail"];
    cell.timeLabel.text = [logObject objectForKey:@"recordedTime"];
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    PFObject *selectedActivity = [activityLog objectAtIndex:indexPath.row];
    activityId = [selectedActivity objectId];
    NSLog(@"%@", activityId);
    [ActivityId setActivityId:activityId];
    
    
    [self performSegueWithIdentifier:@"editSegue" sender:self];
    
    
}

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

- (IBAction)changeKidButton:(id)sender {
    
    KidListTableViewController *kidListTableVC = [self.storyboard instantiateViewControllerWithIdentifier:@"KidListTableViewController"];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:kidListTableVC];
    [self presentViewController:nav animated:YES completion:nil];
    
}

- (IBAction)signOutButton:(id)sender {
    
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
