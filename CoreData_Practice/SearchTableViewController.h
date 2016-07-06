//
//  SearchTableViewController.h
//  CoreData_Practice
//
//  Created by Daniel No on 7/6/16.
//  Copyright © 2016 Daniel No. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchTableViewController : UITableViewController

@property (nonatomic,strong) NSString *searchTerm;
@property (strong,nonatomic) NSMutableArray *tableData;


@end
