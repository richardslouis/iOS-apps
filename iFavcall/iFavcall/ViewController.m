//
//  ViewController.m
//  iFavcall
//
//  Created by Richards Louis on 07/11/12.
//  Copyright (c) 2012 Richards Louis. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize address;
@synthesize browser;

- (IBAction) addressEntered:(UITextField *)sender
{
    NSURL *url = [NSURL URLWithString:sender.text];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.browser loadRequest:request];
    self.browser.scalesPageToFit = YES;
    [sender resignFirstResponder];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
