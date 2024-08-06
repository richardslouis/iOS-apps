//
//  FirstViewController.m
//  GluePing
//
//  Created by Richards Louis on 03/11/13.
//  Copyright (c) 2013 Richards Louis. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSURL *regURL = [NSURL URLWithString:@"http://m.codingcopypaste.com/site/mobile#0332"];
    NSURLRequest *regRequest = [NSURLRequest requestWithURL:regURL];
    
    [myWebView loadRequest:regRequest];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
