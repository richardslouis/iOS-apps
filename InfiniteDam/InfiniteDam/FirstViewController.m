//
//  FirstViewController.m
//  InfiniteDam
//
//  Created by Richards Louis on 23/10/14.
//  Copyright (c) 2014 Richards Louis. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadWebView];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:(1.0/2.0) target:self selector:@selector(timerLoad) userInfo:nil repeats:YES];
    
}


// Assumes you have an IBOutlet for the UIWebView defined:  @property (strong, nonatomic) UIWebView *wv;
- (void)loadWebView {
    // Remember that bundle resources do *not* have directories so all filenames must be unique.
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSURL *homeIndexUrl = [mainBundle URLForResource:@"proceed" withExtension:@"html"];
    
    // The magic is loading a request, *not* using loadHTMLString:baseURL:
    NSURLRequest *urlReq = [NSURLRequest requestWithURL:homeIndexUrl];
    [self->myWebView loadRequest:urlReq];
    
}

//No Internet Connection error code
-(void)webView:(UIWebView *)myWebView didFailLoadWithError:(NSError *)error {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"You have no internet connection!" delegate:self cancelButtonTitle:@"Close" otherButtonTitles:nil, nil];
    [alert show];
    
}

//Close app from AlertView
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    exit(0);
}


/* LOADING WEBAPP FROM SERVER
 
 - (void)viewDidLoad
 {
 [super viewDidLoad];
 
 // Do any additional setup after loading the view, typically from a nib.
 NSURL *regURL = [NSURL URLWithString:@"https://m.securepaynet.net?prog_id=infinitedam"];
 NSURLRequest *regRequest = [NSURLRequest requestWithURL:regURL];
 
 [myWebView loadRequest:regRequest];
 
 }*/



- (void)timerLoad {
    if (myWebView.loading) {
        [activity startAnimating];
    }
    else
    {
        [activity stopAnimating];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
