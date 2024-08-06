//
//  FirstViewController.h
//  Archive
//
//  Created by Richards Louis on 15/01/16.
//  Copyright (c) 2016 Richards Louis. All rights reserved.
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