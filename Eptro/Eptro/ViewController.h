//
//  ViewController.h
//  Eptro News
//
//  Created by Richards Louis on 10/09/16.
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
