//
//  AppDelegate.h
//  Eptro News
//
//  Created by Richards Louis on 10/09/16.
//  Copyright © 2015 Richiesoft inc. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <OneSignal/OneSignal.h>


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) OneSignal *oneSignal;

@end

