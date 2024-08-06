//
//  SecondViewController.h
//  Purple Pro HD
//
//  Created by Richards Louis on 02/12/13.
//  Copyright (c) 2013 Richards Louis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController


{
    IBOutlet UIActivityIndicatorView *activity;
    
    NSTimer *timer;
    
}

@property (nonatomic, strong) IBOutlet UITextField *address;
@property (nonatomic, strong) IBOutlet UIWebView *browser;

- (IBAction)addressEntered:(UITextField *)sender;

- (void)timerLoad;

@end