//
//  ViewController.m
//  Eptro News
//
//  Created by Richards Louis on 10/09/16.
//  Copyright © 2015 Richiesoft inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


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
    NSURL *homeIndexUrl = [mainBundle URLForResource:@"index" withExtension:@"html"];
    
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
    NSURL *regURL = [NSURL URLWithString:@"http://0bc.xyz"];
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

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    CGRect newBounds = webView.bounds;
    newBounds.size.height = webView.scrollView.contentSize.height;
    webView.bounds = newBounds;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

