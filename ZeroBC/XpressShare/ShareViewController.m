//
//  ShareViewController.m
//  XpressShare
//
//  Created by Richards Louis on 04/09/16.
//  Copyright © 2016 Richiesoft inc. All rights reserved.
//

#import "ShareViewController.h"

@interface ShareViewController ()

@end


@implementation ShareViewController


/*
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
    NSURL *homeIndexUrl = [mainBundle URLForResource:@"shorten" withExtension:@"html"];
    
    // The magic is loading a request, *not* using loadHTMLString:baseURL:
    NSURLRequest *urlReq = [NSURLRequest requestWithURL:homeIndexUrl];
    [self->myWebView loadRequest:urlReq];
 
} */



/* LOADING WEBAPP FROM SERVER */
 
 - (void)viewDidLoad
 {
 [super viewDidLoad];
 
 // Do any additional setup after loading the view, typically from a nib.
 NSURL *regURL = [NSURL URLWithString:@"http://0bc.xyz/app/app.php"];
 NSURLRequest *regRequest = [NSURLRequest requestWithURL:regURL];
 
 [myWebView loadRequest:regRequest];

 
 }




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

- (BOOL)isContentValid {
    // Do validation of contentText and/or NSExtensionContext attachments here
    return YES;
}

- (void)didSelectPost {
    // This is called after the user selects Post. Do the upload of contentText and/or NSExtensionContext attachments.
    
    // Inform the host that we're done, so it un-blocks its UI. Note: Alternatively you could call super's -didSelectPost, which will similarly complete the extension context.
    [self.extensionContext completeRequestReturningItems:@[] completionHandler:nil];
}

- (NSArray *)configurationItems {
    // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
    return @[];
}


@end
