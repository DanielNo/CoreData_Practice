//
//  ViewController.m
//  CoreDataPractice
//
//  Created by Daniel No on 6/18/16.
//  Copyright © 2016 Daniel No. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Manager.h"
#import "SearchTableViewController.h"

@interface ViewController ()


@end

@implementation ViewController


- (IBAction)findAll:(id)sender {
//    NSArray *people = [Manager MR_findAll];
//    NSLog(@"found %ul entries : ",[people count]);
////    NSLog(@"saved data : \n%@",obj2);
//    
//    if (people) {
//        for (Manager *manager in people) {
//            NSLog(@"%@",manager);
////            NSString *first = manager.first_name;
//            
//        }
//        
//    }

    
}

- (IBAction)search:(id)sender {
    
    
    
    
}

- (IBAction)save:(id)sender {
    // Create a new managed object
    NSManagedObject *aManager = [NSEntityDescription insertNewObjectForEntityForName:@"Manager" inManagedObjectContext:[appDelegate managedObjectContext]];
    [aManager setValue:self.firstTextField.text forKey:@"first_name"];
    [aManager setValue:self.lastTextField.text forKey:@"last_name"];
    [aManager setValue:self.addressTextField.text forKey:@"address"];
    [aManager setValue:self.phoneTextField.text forKey:@"phone_num"];
    [aManager setValue:self.salaryTextField.text forKey:@"salary"];
    [aManager setValue:self.bossTextField.text forKey:@"boss"];
    [aManager setValue:self.deptTextField.text forKey:@"dept_name"];
    
    NSError *error = nil;
    // Save the object to persistent store
    if (![[appDelegate managedObjectContext] save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    [appDelegate saveContext];
    [self clearTextFields];


}

-(void)clearTextFields{
    for (UITextField *textfield in _textFieldsArray) {
        textfield.text = @"";
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    _textFieldsArray = [NSArray arrayWithObjects:_firstTextField,_lastTextField,_phoneTextField,_salaryTextField,_bossTextField,_deptTextField,_addressTextField,_searchTextField,nil];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier  isEqual: @"findall"]) {
        NSLog(@"find");
        
    }
    if ([segue.identifier isEqual:@"searchRecord"]) {
        SearchTableViewController *searchVC = [segue destinationViewController];
        searchVC.searchTerm = _searchTextField.text;
        _searchTextField.text = @"";
        NSLog(@"search record");
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
