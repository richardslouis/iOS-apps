//
//  FirstViewController.h
//  InfiniteDam
//
//  Created by Richards Louis on 23/10/14.
//  Copyright (c) 2014 Richards Louis. All rights reserved.
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