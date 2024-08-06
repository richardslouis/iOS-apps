//
//  MainViewController.h
//  p
//
//  Created by Richards Louis on 23/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FlipsideViewController.h"

@interface Twitter : UIViewController <FlipsideViewControllerDelegate, UIPopoverControllerDelegate>
{
    
}
- (IBAction)invokesafari:(id)sender;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;

@end