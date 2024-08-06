//
//  ViewController.m
//  Purple Zune
//
//  Created by Richards Louis on 08/11/12.
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

- (IBAction) richiesoft:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://itunes.apple.com/in/app/purple-pro-web-browser/id764171170?mt=8"]];
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
