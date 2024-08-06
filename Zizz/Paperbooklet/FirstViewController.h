//
//  FirstViewController.h
//  Paperbooklet
//
//  Created by Richards Louis on 15/02/15.
//  Copyright (c) 2015 Richiesoft inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController

{
    IBOutlet UIActivityIndicatorView *activity;
    
    NSTimer *timer;
    
    IBOutlet UIWebView *myWebView;
    
}

- (void)timerLoad;

@end

