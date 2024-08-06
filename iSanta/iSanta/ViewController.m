//
//  ViewController.m
//  iSanta
//
//  Created by Richards Louis on 02/12/13.
//  Copyright (c) 2013 Richards Louis. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction) India:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://buy.itunes.apple.com/WebObjects/MZFinance.woa/wa/buyLandingPage?uo=10&at=10lndS"]];
}

- (IBAction) USA:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://buy.itunes.apple.com/WebObjects/MZFinance.woa/wa/buyLandingPage?uo=10&at=10lndS"]];
    
}

- (IBAction) UK:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://buy.itunes.apple.com/WebObjects/MZFinance.woa/wa/buyLandingPage?uo=10&at=10lndS"]];
}

- (IBAction) France:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://buy.itunes.apple.com/WebObjects/MZFinance.woa/wa/buyLandingPage?uo=10&at=10lndS"]];
}

- (IBAction) Canada:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://buy.itunes.apple.com/WebObjects/MZFinance.woa/wa/buyLandingPage?uo=10&at=10lndS"]];
}

- (IBAction) Austraila:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://buy.itunes.apple.com/WebObjects/MZFinance.woa/wa/buyLandingPage?uo=10&at=10lndS"]];
    
}

- (IBAction) Germany:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://buy.itunes.apple.com/WebObjects/MZFinance.woa/wa/buyLandingPage?uo=10&at=10lndS"]];
}


- (IBAction) mail:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto:isanta@richiesoft.com"]];
}

- (IBAction) richiesoft:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.richiesoft.com"]];
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
