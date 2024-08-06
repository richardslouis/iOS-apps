//
//  MainViewController.h
//  Foster HD
//
//  Created by Richards Louis on 13/08/12.
//  Copyright (c) 2012 Richards Louis. All rights reserved.
//

#import "FlipsideViewController.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, UIPopoverControllerDelegate>

@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;

@end
