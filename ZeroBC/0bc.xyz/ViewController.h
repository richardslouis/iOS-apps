//
//  ViewController.h
//  0bc.xyz
//
//  Created by Richards Louis on 18/11/15.
//  Copyright © 2015 Richiesoft inc. All rights reserved.
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
