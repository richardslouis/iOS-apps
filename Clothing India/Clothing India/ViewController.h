//
//  ViewController.h
//  Clothing India
//
//  Created by Richards Louis on 06/02/16.
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


