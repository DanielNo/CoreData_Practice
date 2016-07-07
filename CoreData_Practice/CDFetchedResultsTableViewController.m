//
//  TableViewController.m
//  CoreDataPractice
//
//  Created by Daniel No on 6/23/16.
//  Copyright © 2016 Daniel No. All rights reserved.
//

#import "CDFetchedResultsTableViewController.h"
#import "Manager.h"
#import "PersonCell.h"
#import "AppDelegate.h"
#import "EditEntityViewController.h"


@interface CDFetchedResultsTableViewController ()

@end

@implementation CDFetchedResultsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"All Entries";
    [self setupTableviewData];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


-(void)viewDidAppear:(BOOL)animated{
    [self.tableView reloadData];
}

-(void)fetchEntitys{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Manager" inManagedObjectContext:[appDelegate managedObjectContext]];
    [fetchRequest setEntity:entity];
    
    NSError *error = nil;
    NSArray *result = [[appDelegate managedObjectContext] executeFetchRequest:fetchRequest error:&error];
    
    if (error) {
        NSLog(@"Unable to execute fetch request.");
        NSLog(@"%@, %@", error, error.localizedDescription);
        
    } else {
        _tableData = [result mutableCopy];
        NSLog(@"%@", result);
    }
}


-(void)setupTableviewData{
    [self.tableView registerNib:[UINib nibWithNibName:@"PersonCell" bundle:nil] forCellReuseIdentifier:@"personCell"];
    [self fetchEntitys];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"rows %lu",(unsigned long)[_tableData count]);
    return [_tableData count];
    //    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PersonCell *cell = [tableView dequeueReusableCellWithIdentifier:@"personCell" forIndexPath:indexPath];
    Manager *manager = [_tableData objectAtIndex:indexPath.row];
    cell.infoLabel.text = [NSString stringWithFormat:@"First name : %@\nLast name : %@\nAddress : %@\nPhone number : %@\nSalary : %@\nBoss : %@\nDepartment : %@\n",manager.first_name,manager.last_name,manager.address,manager.phone_num,manager.salary,manager.boss,manager.dept_name];
    
    // Configure the cell...
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"editVC" sender:nil];
    [self.tableView reloadData];
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    //     Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        //        [_tableData removeObjectAtIndex:indexPath.row];
        NSError *error;
        [[appDelegate managedObjectContext] deleteObject:[_tableData objectAtIndex:indexPath.row]];
        [[appDelegate managedObjectContext] save:&error];
        if (error) {
            NSLog(@"delete error : %@",[error localizedDescription]);
        }else{
            NSLog(@"delete success");
        }
        
        [self.tableView reloadData];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}


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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    EditEntityViewController *editVC = [segue destinationViewController];
    NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
    Manager *manager = [_tableData objectAtIndex:selectedIndexPath.row];
    editVC.editedManager = manager;
    NSLog(@"%@", [manager description]);
}


@end
