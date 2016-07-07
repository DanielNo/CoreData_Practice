//
//  CDSearchTableViewController.m
//  CoreData_Practice
//
//  Created by Daniel No on 7/7/16.
//  Copyright © 2016 Daniel No. All rights reserved.
//

#import "CDSearchTableViewController.h"
#import "PersonCell.h"
#import "AppDelegate.h"
#import "Manager.h"

@interface CDSearchTableViewController ()

@end

@implementation CDSearchTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"term : %@",_searchTerm);
    [self setupTableviewData];
    
}

-(void)setupTableviewData{
    self.navigationItem.title = [NSString stringWithFormat:@"Results for : %@",_searchTerm];
    [self.tableView registerNib:[UINib nibWithNibName:@"PersonCell" bundle:nil] forCellReuseIdentifier:@"personCell"];
    [self searchCoreData];
    [self.tableView reloadData];
}

-(void)searchCoreData{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSArray *searchProperties =  [NSArray arrayWithObjects:@"first_name", @"last_name",@"address",@"salary",@"phone_num",@"boss",@"dept_name", nil];
    NSMutableArray *predicateArray = [NSMutableArray new];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"Manager" inManagedObjectContext:[appDelegate managedObjectContext]];
    [fetchRequest setEntity:entity];
    [fetchRequest setPropertiesToFetch:
     searchProperties];
    for (NSString *searchProperty in searchProperties) {
        [predicateArray addObject:[NSPredicate predicateWithFormat:@"%K contains[cd] %@", searchProperty,_searchTerm]];
    }
    NSPredicate *compoundPredicate = [NSCompoundPredicate orPredicateWithSubpredicates:predicateArray];
    [fetchRequest setPredicate:compoundPredicate];
    NSError *error;
    
    _tableData = [[[appDelegate managedObjectContext] executeFetchRequest:fetchRequest error:&error]mutableCopy];
    
    if (error) {
        NSLog(@"error : %@",[error localizedDescription]);
    }
    NSLog(@"search results : %@",_tableData);
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
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PersonCell *cell = [tableView dequeueReusableCellWithIdentifier:@"personCell" forIndexPath:indexPath];
    Manager *manager = [_tableData objectAtIndex:indexPath.row];
    cell.infoLabel.text = [NSString stringWithFormat:@"First name : %@\nLast name : %@\nAddress : %@\nPhone number : %@\nSalary : %@\nBoss : %@\nDepartment : %@\n",manager.first_name,manager.last_name,manager.address,manager.phone_num,manager.salary,manager.boss,manager.dept_name];
    
    // Configure the cell...
    
    return cell;
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

@end
