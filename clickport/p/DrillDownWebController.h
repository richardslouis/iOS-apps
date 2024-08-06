//
//  DrillDownWebController.h
//  Drill Down Web Controller - a view controller for presenting hierarchical
//  web content using a series of nested UIWebViews. The original source for
//  Drill Down Web Controller and a high-level explanation of it's design is
//  available online here:  http://www.gotow.net/creative/wordpress/?p=16
//
//  Licensed under the Creative Commons Attribution license 3.0. You are welcome
//  to copy, tweak, remix and incorporate this code into commercial or free 
//  applications. http://creativecommons.org/licenses/by/3.0/

//  Version History:
//  11/12/08 - Initial release
//
//  Created by J. Benjamin Gotow on 11/12/08. 
//  Copyright Gotow.net 2008. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrillDownPage.h"

#define kNavigationForward      1
#define kNavigationBackward     -1

@interface DrillDownWebController : UIViewController <UINavigationBarDelegate, UIWebViewDelegate, DrillDownPageContainer>{

    UIImageView *               splashView;
    UIImage *                   splashImage;
    
    UIView *                    webViewContainer;
    CGRect                      webViewFrame;
    NSString *                  webRoot;
    
    UIActivityIndicatorView *   navigationActivity;
    UINavigationBar *           navigationBar;
    int                         navigationDirection;
    
    BOOL                        animatingBakward;
    BOOL                        leaving;
    
    NSMutableArray *            pageStack;
    DrillDownPage *             pendingPage;
}

@property (nonatomic, retain) UIView * webViewContainer;
@property (nonatomic, retain) NSString * webRoot;
@property (nonatomic, retain) UIImage * splashImage;

- (id)initWithWebRoot:(NSString*)url andTitle: (NSString*)t andSplashImage: (UIImage*)img;
- (void)loadView;
- (void)viewDidAppear:(BOOL)animated;
- (void)leave;
- (void)swapToCustomNavBar;
- (void)swapToParentNavBar;
- (void)dealloc;
- (void)didReceiveMemoryWarning;

#pragma mark DrillDownPage Delegate Functions

- (void)createNewPageForRequest:(NSURLRequest*)request;
- (void)handleNonHTTPRequest:(NSURLRequest*)request;
- (void)pageLoadStarted;
- (void)pageLoadSucceeded;
- (void)pageLoadCancelled;
- (void)pageLoadFailed;

#pragma mark Navigation Bar Delegate Functions

- (void)navigationCustomAction;
- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item;
- (void)navigationBackwardsComplete;
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;

@end
