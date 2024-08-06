//
//  ViewController.m
//  Purple Pro
//
//  Created by Richards Louis on 13/09/13.
//  Copyright (c) 2013 Richards Louis. All rights reserved.
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

- (IBAction) address1Entered:(UITextField *)sender1
{
    NSURL *url = [NSURL URLWithString:sender1.text];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.browser1 loadRequest:request];
    self.browser1.scalesPageToFit = YES;
    [sender1 resignFirstResponder];
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
