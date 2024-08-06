//
//  ViewController.h
//  Adpotbox
//
//  Created by Richards Louis on 17/04/16.
//  Copyright © 2016 Richiesoft inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

{
    IBOutlet UIActivityIndicatorView *activity;
    
    NSTimer *timer;
    
    IBOutlet UIWebView *myWebView;
    
}

- (void)timerLoad;

@end

