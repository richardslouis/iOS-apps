//
//  AppDelegate.h
//  Beyond School
//
//  Created by Richards Louis on 18/04/16.
//  Copyright © 2016 Tao Capital. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <OneSignal/OneSignal.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) OneSignal *oneSignal;

@end


