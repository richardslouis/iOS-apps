//
//  ViewController.m
//  AppLabs
//
//  Created by Richards Louis on 12/05/13.
//  Copyright (c) 2013 Richards Louis. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSURL *regURL = [NSURL URLWithString:@"https://docs.google.com/forms/d/1gEZPbLN-rZ1L8sDkP8gKmrQJ4etmPfknA7ZBgNWsl_Y/viewform"];
    NSURLRequest *regRequest = [NSURLRequest requestWithURL:regURL];
    
    [myWebView loadRequest:regRequest];
    
    
    NSURL *richURL = [NSURL URLWithString:@"http://www.richiesoft.com"];
    NSURLRequest *richRequest = [NSURLRequest requestWithURL:richURL];
    
    [myrichView loadRequest:richRequest];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
