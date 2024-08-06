//
//  FirstViewController.m
//  GluePing
//
//  Created by Richards Louis on 13/06/13.
//  Copyright (c) 2013 Richards Louis. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSURL *regURL = [NSURL URLWithString:@"http://m.codingcopypaste.com/site/webs_111610920/home?url=http%3A%2F%2Fwww.codingcopypaste.com%2Fconfidence-port#0201"];
    NSURLRequest *regRequest = [NSURLRequest requestWithURL:regURL];
    
    [myWebView loadRequest:regRequest];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
