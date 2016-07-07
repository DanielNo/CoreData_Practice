//
//  CDSearchTableViewController.h
//  CoreData_Practice
//
//  Created by Daniel No on 7/7/16.
//  Copyright © 2016 Daniel No. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CDSearchTableViewController : UITableViewController

@property (strong,nonatomic) NSString *searchTerm;
@property (strong,nonatomic) NSMutableArray *tableData;



@end
