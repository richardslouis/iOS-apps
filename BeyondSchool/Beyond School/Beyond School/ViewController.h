//
//  ViewController.h
//  Beyond School
//
//  Created by Richards Louis on 18/04/2016.
//  Copyright © 2016 Tao Capital. All rights reserved.
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
