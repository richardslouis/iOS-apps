//
//  FirstViewController.h
//  GluePing
//
//  Created by Richards Louis on 13/06/13.
//  Copyright (c) 2013 Richards Louis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FourthViewController : UIViewController

{
    IBOutlet UIActivityIndicatorView *activity;
    
    NSTimer *timer;
    
}

@property (nonatomic, strong) IBOutlet UITextField *address;
@property (nonatomic, strong) IBOutlet UIWebView *browser;

- (IBAction)addressEntered:(UITextField *)sender;

- (void)timerLoad;

@end
