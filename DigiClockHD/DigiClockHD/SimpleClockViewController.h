//
//  ViewController.h
//  DigiClock
//
//  Created by Richards Louis on 22/09/12.
//  Copyright (c) 2012 Richards Louis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleClockViewController : UIViewController {
    IBOutlet UILabel *label;
    NSTimer *timer;
}
-(void)updateTimer;



@end
