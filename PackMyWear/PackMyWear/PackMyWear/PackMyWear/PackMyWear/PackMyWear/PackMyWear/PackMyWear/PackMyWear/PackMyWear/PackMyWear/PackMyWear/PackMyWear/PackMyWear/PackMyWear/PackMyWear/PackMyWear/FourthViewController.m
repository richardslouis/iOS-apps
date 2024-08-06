//
//  FirstViewController.m
//  GluePing
//
//  Created by Richards Louis on 13/06/13.
//  Copyright (c) 2013 Richards Louis. All rights reserved.
//

#import "FourthViewController.h"

@interface FourthViewController ()

@end

@implementation FourthViewController

-(IBAction)callurl {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.richiesoft.com"]];
}

-(IBAction)callurl1 {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.eptro.com"]];
}

-(IBAction)callurl2 {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.glueping.com"]];
}

-(IBAction)callurl3 {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.ilrlabs.com"]];
}

-(IBAction)callurl4 {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.codingcopypaste.com"]];
}



-(IBAction)callapp {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://itunes.apple.com/in/artist/infant-louis-richards-c/id502600382"]];
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
