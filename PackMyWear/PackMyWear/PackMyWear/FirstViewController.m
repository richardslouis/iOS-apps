//
//  FirstViewController.m
//  PackMyWear
//
//  Created by Richards Louis on 16/04/14.
//  Copyright (c) 2014 Richards Louis. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSURL *regURL = [NSURL URLWithString:@"http://zovi.com/zs/packmywear?ccode=zspackmywear"];
    NSURLRequest *regRequest = [NSURLRequest requestWithURL:regURL];
    
    [myWebView loadRequest:regRequest];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:(1.0/2.0) target:self selector:@selector(timerLoad) userInfo:nil repeats:YES];
    
}

- (void)timerLoad {
    if (myWebView.loading) {
        [activity startAnimating];
    }
    else
    {
        [activity stopAnimating];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
