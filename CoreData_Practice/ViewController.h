//
//  ViewController.h
//  CoreDataPractice
//
//  Created by Daniel No on 6/18/16.
//  Copyright © 2016 Daniel No. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *firstTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *salaryTextField;
@property (weak, nonatomic) IBOutlet UITextField *bossTextField;
@property (weak, nonatomic) IBOutlet UITextField *deptTextField;
@property (weak, nonatomic) IBOutlet UITextField *addressTextField;

@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (strong,nonatomic) NSArray *textFieldsArray;

@property (weak, nonatomic) IBOutlet UILabel *status;

@end

