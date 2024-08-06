//
//  MainViewController.h
//  Bunk
//
//  Created by Richards Louis on 03/01/13.
//  Copyright (c) 2013 Richards Louis. All rights reserved.
//

#import "FlipsideViewController.h"

#import <CoreData/CoreData.h>

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
