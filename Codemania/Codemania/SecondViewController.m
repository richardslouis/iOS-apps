//
//  SecondViewController.m
//  GluePing
//
//  Created by Richards Louis on 03/11/13.
//  Copyright (c) 2013 Richards Louis. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSURL *regURL = [NSURL URLWithString:@"http://m.codingcopypaste.com/site/webs_111610920/home?url=http%3A%2F%2Fwww.codingcopypaste.com%2Fapps%2Fblog%2F#0310"];
    NSURLRequest *regRequest = [NSURLRequest requestWithURL:regURL];
    
    [myWebView loadRequest:regRequest];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
