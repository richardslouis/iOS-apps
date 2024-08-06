//
//  ViewController.h
//  iFavcall
//
//  Created by Richards Louis on 07/11/12.
//  Copyright (c) 2012 Richards Louis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) IBOutlet UITextField *address;
@property (nonatomic, strong) IBOutlet UIWebView *browser;
- (IBAction)addressEntered:(UITextField *)sender;

@end
