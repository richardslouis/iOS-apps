//
//  ViewController.h
//  Purple Pro
//
//  Created by Richards Louis on 13/09/13.
//  Copyright (c) 2013 Richards Louis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) IBOutlet UITextField *address;
@property (nonatomic, strong) IBOutlet UIWebView *browser;
- (IBAction)addressEntered:(UITextField *)sender;

@property (nonatomic, strong) IBOutlet UITextField *address1;
@property (nonatomic, strong) IBOutlet UIWebView *browser1;
- (IBAction)address1Entered:(UITextField *)sender1;

@end
