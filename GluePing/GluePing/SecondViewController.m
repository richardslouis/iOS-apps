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
    NSURL *regURL = [NSURL URLWithString:@"http://m.glueping.com/site/webs_111378063/home?url=http%3A%2F%2Fwww.glueping.com%2Fapps%2Fblog%2F&&&#3022"];
    NSURLRequest *regRequest = [NSURLRequest requestWithURL:regURL];
    
    [myWebView loadRequest:regRequest];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
