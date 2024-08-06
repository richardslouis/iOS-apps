//
//  FirstViewController.m
//  GluePing
//
//  Created by Richards Louis on 13/06/13.
//  Copyright (c) 2013 Richards Louis. All rights reserved.
//

#import "FifthViewController.h"

@interface FifthViewController ()

@end

@implementation FifthViewController

-(IBAction)callurl {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://m.facebook.com/richiesoftinc?_rdr"]];
}

-(IBAction)callurl1 {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.twitter.com/richiesoftinc"]];
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
