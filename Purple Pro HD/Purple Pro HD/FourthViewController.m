//
//  FirstViewController.m
//  Purple Pro HD
//
//  Created by Richards Louis on 13/06/13.
//  Copyright (c) 2013 Richards Louis. All rights reserved.
//

#import "FourthViewController.h"

@interface FourthViewController ()

@end

@implementation FourthViewController


@synthesize address;
@synthesize browser;


- (IBAction) addressEntered:(UITextField *)sender
{
    NSURL *url = [NSURL URLWithString:sender.text];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.browser loadRequest:request];
    self.browser.scalesPageToFit = YES;
    [sender resignFirstResponder];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:(1.0/2.0) target:self selector:@selector(timerLoad) userInfo:nil repeats:YES];
    
}

- (void)timerLoad {
    if (browser.loading) {
        [activity startAnimating];
    }
    else
    {
        [activity stopAnimating];
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
}
@end
