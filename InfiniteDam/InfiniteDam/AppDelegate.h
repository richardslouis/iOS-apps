//
//  AppDelegate.h
//  InfiniteDam
//
//  Created by Richards Louis on 23/10/14.
//  Copyright (c) 2014 Richards Louis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <OneSignal/OneSignal.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) OneSignal *oneSignal;

@end
