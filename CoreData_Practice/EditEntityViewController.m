//
//  EditEntityViewController.m
//  CoreData_Practice
//
//  Created by Daniel No on 7/7/16.
//  Copyright © 2016 Daniel No. All rights reserved.
//

#import "EditEntityViewController.h"
#import "Manager.h"
#import "AppDelegate.h"

@interface EditEntityViewController ()

@end

@implementation EditEntityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Edit";
    [self showEditableData];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)showEditableData{
    _firstTextField.text = self.editedManager.first_name;
    _lastTextField.text = self.editedManager.last_name ;
    _addressTextField.text = self.editedManager.address;
    _phoneTextField.text = self.editedManager.phone_num;
    _salaryTextField.text = self.editedManager.salary;
    _bossTextField.text = self.editedManager.boss;
    _deptTextField.text = self.editedManager.dept_name;
}

- (IBAction)saveEntity:(id)sender {
    
    self.editedManager.first_name = _firstTextField.text;
    self.editedManager.last_name = _lastTextField.text;
    self.editedManager.address = _addressTextField.text;
    self.editedManager.phone_num = _phoneTextField.text;
    self.editedManager.salary = _salaryTextField.text;
    self.editedManager.boss = _bossTextField.text;
    self.editedManager.dept_name = _deptTextField.text;
    
    [appDelegate saveContext];
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
