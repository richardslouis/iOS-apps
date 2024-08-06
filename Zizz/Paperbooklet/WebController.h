//
//  ViewController.h
//  Purple Zune
//
//  Created by Richards Louis on 08/11/12.
//  Copyright (c) 2012 Richards Louis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebController : UIViewController

{
    BOOL theBool;
    
    IBOutlet UIActivityIndicatorView *activity;
    IBOutlet UIProgressView *myProgressView;
    NSTimer *timer;
    
}

@property (nonatomic, strong) IBOutlet UITextField *address;
@property (nonatomic, strong) IBOutlet UIWebView *browser;

- (IBAction)addressEntered:(UITextField *)sender;

- (IBAction) richiesoft:(id)sender;



- (void)timerLoad;

@end
