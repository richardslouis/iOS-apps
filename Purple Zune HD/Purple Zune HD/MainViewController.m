//
//  MainViewController.m
//  Purple Zune HD
//
//  Created by Richards Louis on 03/01/13.
//  Copyright (c) 2013 Richards Louis. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

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

- (IBAction) richiesoft:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://itunes.apple.com/in/app/purple-pro-hd-web-browser/id771071619?mt=8"]];
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Flipside View Controller

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    [self.flipsidePopoverController dismissPopoverAnimated:YES];
    self.flipsidePopoverController = nil;
}

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    self.flipsidePopoverController = nil;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
        UIPopoverController *popoverController = [(UIStoryboardPopoverSegue *)segue popoverController];
        self.flipsidePopoverController = popoverController;
        popoverController.delegate = self;
    }
}

- (IBAction)togglePopover:(id)sender
{
    if (self.flipsidePopoverController) {
        [self.flipsidePopoverController dismissPopoverAnimated:YES];
        self.flipsidePopoverController = nil;
    } else {
        [self performSegueWithIdentifier:@"showAlternate" sender:sender];
    }
}

@end
