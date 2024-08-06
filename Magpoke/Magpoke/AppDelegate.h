//
//  AppDelegate.h
//  Magpoke
//
//  Created by Richards Louis on 07/07/16.
//  Copyright © 2016 Richiesoft inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <OneSignal/OneSignal.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) OneSignal *oneSignal;

@end
