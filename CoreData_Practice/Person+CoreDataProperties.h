//
//  Person+CoreDataProperties.h
//  CoreData_Practice
//
//  Created by Daniel No on 7/6/16.
//  Copyright © 2016 Daniel No. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Person.h"

NS_ASSUME_NONNULL_BEGIN

@interface Person (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *address;
@property (nullable, nonatomic, retain) NSString *first_name;
@property (nullable, nonatomic, retain) NSString *last_name;
@property (nullable, nonatomic, retain) NSString *phone_num;
@property (nullable, nonatomic, retain) NSString *salary;

@end

NS_ASSUME_NONNULL_END
