//
//  EditEntityViewController.h
//  CoreData_Practice
//
//  Created by Daniel No on 7/7/16.
//  Copyright © 2016 Daniel No. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Manager;

@interface EditEntityViewController : UIViewController
@property(strong,nonatomic) Manager *editedManager;

@property (weak, nonatomic) IBOutlet UITextField *firstTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastTextField;
@property (weak, nonatomic) IBOutlet UITextField *addressTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *salaryTextField;
@property (weak, nonatomic) IBOutlet UITextField *bossTextField;
@property (weak, nonatomic) IBOutlet UITextField *deptTextField;

@end
