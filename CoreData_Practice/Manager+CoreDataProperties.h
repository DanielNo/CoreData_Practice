//
//  Manager+CoreDataProperties.h
//  CoreData_Practice
//
//  Created by Daniel No on 7/6/16.
//  Copyright © 2016 Daniel No. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Manager.h"

NS_ASSUME_NONNULL_BEGIN

@interface Manager (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *boss;
@property (nullable, nonatomic, retain) NSString *dept_name;
@property (nullable, nonatomic, retain) Person *relationship;

@end

NS_ASSUME_NONNULL_END
