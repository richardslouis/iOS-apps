//
//  ViewController.m
//  DigiClock
//
//  Created by Richards Louis on 22/09/12.
//  Copyright (c) 2012 Richards Louis. All rights reserved.
//

#import "SimpleClockViewController.h"

@implementation SimpleClockViewController

-(void)updateTimer {
    NSDateFormatter *Formatter = [[NSDateFormatter alloc] init];
    [Formatter setDateFormat:@"hh:mm:ss"];
    label.text = [Formatter stringFromDate:[NSDate date]];
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - View Lifestyle

- (void)viewDidLoad
{
    [super viewDidLoad];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
	// Do any additional setup after loading the view, typically from a nib.
}


@end
