//
//  MainViewController.h
//  Purple Zune HD
//
//  Created by Richards Louis on 03/01/13.
//  Copyright (c) 2013 Richards Louis. All rights reserved.
//

#import "FlipsideViewController.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, UIPopoverControllerDelegate>

{
    IBOutlet UIActivityIndicatorView *activity;
    
    NSTimer *timer;
    
}

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;

- (IBAction) richiesoft:(id)sender;


@property (nonatomic, strong) IBOutlet UITextField *address;
@property (nonatomic, strong) IBOutlet UIWebView *browser;
- (IBAction)addressEntered:(UITextField *)sender;

- (void)timerLoad;

@end
