//
//  ViewController.m
//  Purple Zune
//
//  Created by Richards Louis on 08/11/12.
//  Copyright (c) 2012 Richards Louis. All rights reserved.
//

#import "WebController.h"

@interface WebController ()

@end

@implementation WebController

@synthesize address;
@synthesize browser;


- (IBAction) addressEntered:(UITextField *)sender
{
    //NSURL *url = [NSURL URLWithString:sender.text];
    NSString *myURLString = sender.text;
    NSURL *myURL;
    if ([myURLString.lowercaseString hasPrefix:@"http://"]) {
        myURL = [NSURL URLWithString:myURLString];
    } else if
        ([myURLString.lowercaseString hasPrefix:@"https://"]) {
            myURL = [NSURL URLWithString:myURLString];
        }
    else {
        myURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@",myURLString]];
    }
    
    NSURLRequest *request = [NSURLRequest requestWithURL:myURL];
    
    [self.browser loadRequest:request];
    self.browser.scalesPageToFit = YES;
    //[sender resignFirstResponder];
    
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


/*- (void)webViewDidStartLoad:(UIWebView *)browser{
 
 myProgressView.progress = 0;
 theBool = false;
 //0.01667 is roughly 1/60, so it will update at 60 FPS
 timer = [NSTimer scheduledTimerWithTimeInterval:0.01667 target:self selector:@selector(timerCallback) userInfo:nil repeats:YES];
 }

- (void)webViewDidFinishLoad:(UIWebView *)browser{
    theBool = true;
}

-(void)timerCallback {
 if (browser.loading) {
 if (myProgressView.progress >= 1) {
 myProgressView.hidden = true;
 [timer invalidate];
 }
 else {
 myProgressView.progress += 0.1;
 }
 }
 else {
 myProgressView.progress += 0.05;
 if (myProgressView.progress >= 0.95) {
 myProgressView.progress = 0.95;
 }
 }
 }*/



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
