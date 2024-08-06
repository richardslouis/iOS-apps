//
//  DrillDownWebController.m
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


#import "DrillDownWebController.h"

@implementation DrillDownWebController

@synthesize webRoot;
@synthesize webViewContainer;
@synthesize splashImage;

- (id)initWithWebRoot:(NSString*)url andTitle: (NSString*)t andSplashImage: (UIImage*)img
{
	if (self = [super init]) {
        self.title = t;
        self.webRoot = url;
        self.splashImage = img;
        
        pageStack = [[NSMutableArray alloc] init];
        navigationDirection = 0;
    }
	return self;
}

- (void)loadView
{
    // the base view for this view controller
	UIView      * contentView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, 320, 480)];
    contentView.autoresizesSubviews = NO;
    contentView.clipsToBounds = NO;
    contentView.userInteractionEnabled = YES;
    contentView.backgroundColor = [UIColor whiteColor];
    contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
	self.view = contentView;
	[contentView release];
    
    // create our own navigation bar that we can control as we move from page to page
    // we need to attach the custom back button to both the actual navbar we'll use, and also to the navbar on the
    // app's root navigation controller. That way, it "fades across" correctly as the root navigation controller slides,
    // and then flips to the "fake" one we control ourselves.
    
    UINavigationItem * item = [[UINavigationItem alloc] initWithTitle: self.title];
    UIBarButtonItem * leave = [[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed: @"leave_arrow.png"] style:UIBarButtonItemStyleBordered target:self action:@selector(leave)] autorelease];
    
    [item setLeftBarButtonItem: leave];
    [self.navigationItem setLeftBarButtonItem: leave];
    
    navigationBar = [[UINavigationBar alloc] initWithFrame: CGRectMake(0, 0, 320, 44)];
    [navigationBar setBarStyle:UIBarStyleDefault];
    [navigationBar setDelegate: self];
    [navigationBar setItems: [NSArray arrayWithObject:item]];
    [item release];

    navigationActivity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle: UIActivityIndicatorViewStyleWhite];
    [navigationActivity setFrame: CGRectMake(290, 12, 20, 20)];
    [navigationBar addSubview: navigationActivity];

    webViewContainer = [[UIView alloc] initWithFrame: CGRectMake(0, 44, 320, 416)];
    [self.view addSubview: webViewContainer];
    [webViewContainer setAlpha: 0.0];
    
    pendingPage = [DrillDownPage pageWithRequest:[NSURLRequest requestWithURL: [NSURL URLWithString: self.webRoot]] andContainer: self];
    [pendingPage retain];

    // display an image over the loading web page so the user doesn't see
    // a white screen as the page loads for the first time.
    CGSize s = [splashImage size];
    CGRect splashRect = CGRectMake((320 - s.width) / 2, (416 - s.height) / 2, s.width, s.height);

    splashView = [[UIImageView alloc] initWithFrame: splashRect];
    [splashView setImage: splashImage];
    [splashView setAlpha: 1.0];
    [contentView addSubview: splashView];
}

- (void)viewDidAppear:(BOOL)animated
{
    [self swapToCustomNavBar];
}

- (void)viewDidDisappear:(BOOL)animated
{
    if (leaving) [pageStack makeObjectsPerformSelector: @selector(unlink)];
}

- (void)leave
{
    // This will break all the circular references to this controller so it will 
    // get deallocated properly when it is popped from the navigationController.
    if (pendingPage) [pendingPage unlink];
    
    [self swapToParentNavBar];
    leaving = YES;
    [self.navigationController popToRootViewControllerAnimated: YES];
}

- (void)swapToCustomNavBar
{
    CGRect r = splashView.frame;
    r.origin.y += 44;
    
    [webViewContainer setFrame: CGRectMake(0,44,320, 416)];
    [splashView setFrame: r];
    [self.navigationController setNavigationBarHidden: YES];
    [self.view addSubview: navigationBar];
}

- (void)swapToParentNavBar
{
    CGRect r = splashView.frame;
    r.origin.y -= 44;
    
    // Switch back to the navigationBar that our parent navController
    // was providing. This involves changing our frame a bit.
    [webViewContainer setFrame: CGRectMake(0,0,320, 480)];
    [splashView setFrame: r];
    
    [navigationBar removeFromSuperview];
    [self.navigationController setNavigationBarHidden: NO];
}

- (void)dealloc 
{
    [pendingPage release];
    pendingPage = nil;
    
    [splashView release];
    [navigationBar release];
    [pageStack release];
    [navigationActivity release];
    
    [webViewContainer release];
    [webRoot release];
	[super dealloc];
}

- (void)didReceiveMemoryWarning 
{
	[super didReceiveMemoryWarning];
}

#pragma mark Page Delegate Functions

- (void)createNewPageForRequest:(NSURLRequest*)request
{
    if (pendingPage){
        [pendingPage unlink];
        [pendingPage release];
    }
    pendingPage = [DrillDownPage pageWithRequest:request andContainer: self];
    [pendingPage retain];
    
    // modify the interface to show some activity
    [[[navigationBar items] lastObject] setRightBarButtonItem:nil animated:NO];
    [navigationActivity startAnimating];
    navigationDirection = 1;
}

- (void)handleNonHTTPRequest:(NSURLRequest*)request
{
    // You can use custom url handlers to execute code when the user clicks
    // links on the page. For example, NetSketch subclasses DrillDownWebController and
    // overrides this function to add netsketch:// links in the community pages that are
    // handled on the client side. Clicking one of those links allows you to view a 
    // replay of the drawing.
}

- (void)pageLoadStarted
{
    // modify the interface to show some activity
    [[[navigationBar items] lastObject] setRightBarButtonItem:nil animated:NO];
    [navigationActivity startAnimating];
}

- (void)pageLoadSucceeded
{
    [navigationActivity stopAnimating];
    
    // tell all the pages in the stack that their depth in the stack has changed.
    // depth information is used for caching!
    [pageStack makeObjectsPerformSelector:@selector(depthChanged:) withObject:[NSNumber numberWithInteger: navigationDirection]];
    
    // if the background image is being displayed, animate it fading away
    if ([splashView alpha] > 0){
        [UIView beginAnimations: nil context:nil];
        [UIView setAnimationDuration: 0.4];
        [splashView setAlpha: 0.0];
        [webViewContainer setAlpha: 1.0];
        [UIView commitAnimations];
    }
    
    if (pendingPage){
        // Add the page that was just loaded onto the page stack
        [pageStack addObject: pendingPage];
        [pendingPage release];
        pendingPage = nil;
    } else {
        // if pendingPage is nil, it just means that we're loading a page that is already part of
        // the pageStack. This could be caused by moving up the stack to a page that has been removed
        // from the cache.
    }
    
    DrillDownPage * p = [pageStack lastObject];
    
    // if we moved forward, add the item to the top bar
    if (navigationDirection == 0)
    {
        [[[navigationBar items] lastObject] setTitle: [p title]];
    }
    else 
    {
        if (navigationDirection == kNavigationForward){
            UINavigationItem * item = [[UINavigationItem alloc] initWithTitle: [p title]];
            [navigationBar pushNavigationItem:item animated:YES];
            [item release];
        }

        // animate a slide to the page
        [UIView beginAnimations: nil context: nil];
        [UIView setAnimationDuration: 0.4];
        [p slideIn: navigationDirection];
        [[pageStack objectAtIndex: [pageStack count] - 2] slideOut: navigationDirection];
        [UIView commitAnimations];
        
        navigationDirection = 0;
    }
    
    // fix the button in the top corner
    NSString * actionTitle = [p actionText];
    UINavigationItem * item = [[navigationBar items] lastObject];
    
    if ((actionTitle != nil) && (![actionTitle isEqualToString: @""])){
        UIBarButtonItem * actionButton = [[UIBarButtonItem alloc] initWithTitle:actionTitle style:UIBarButtonItemStyleBordered target:self action:@selector(navigationCustomAction)];
        [item setRightBarButtonItem: actionButton animated:YES];
        [actionButton release];
    }
}

- (void)pageLoadCancelled
{
    [navigationActivity stopAnimating];
    [[pageStack lastObject] depthChanged: [NSNumber numberWithInt: 0]];
}

- (void)pageLoadFailed
{
    // update the interface
    [self pageLoadCancelled];
    
    // display an error
    UIAlertView * v = [[UIAlertView alloc] initWithTitle:@"Network Error" message:@"NetSketch could not connect to the community server!" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Try Again", nil];
    [v show];
    [v release];
    
    // when the user clicks a button in the alert, we will either release
    // the pendingPage or try loading it again.
}

#pragma mark Navigation Bar Delegate Functions

- (void)navigationCustomAction
{
    navigationDirection = 0;
    
    // this callthrough is necessary. We can't link the button directly to the page,
    // beause in some cases it may be targeted to the wrong page object.
    DrillDownPage * p = [pageStack lastObject];
    [p setRequest: [NSURLRequest requestWithURL: [NSURL URLWithString: [p actionURL]]]];
    [p loadWebView];
}

- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item
{
    // if the user presses the back button while the interface is preparing to move forward to a new
    // page, we want to cancel the new page immediately.
    if (pendingPage){
        [pendingPage unlink];
        [pendingPage release];
        pendingPage = nil;
    }
    // the user wants to go backwards. Let them do it. Display the screenshot of the
    // page they want and begin loading the real thing. This allows for "rapid" movement
    // through the page stack.
    if ([pageStack count] > 1){
    
        // if we are already animating backward, trigger the completion function ahead of schedule
        // so the pageStack keeps up with the animation. The user must be hammering the back button.
        if (animatingBakward)
            [self navigationBackwardsComplete];
        
        animatingBakward = YES;
        navigationDirection = kNavigationBackward;
        
        // Animate the transition to the previous page.
        [UIView beginAnimations: nil context:nil];
        [UIView setAnimationDuration: 0.4];
        [UIView setAnimationDelegate: self];
        [UIView setAnimationDidStopSelector: @selector(navigationBackwardsComplete)];
        [[pageStack lastObject] slideOut: navigationDirection];
        [[pageStack objectAtIndex: [pageStack count] - 2] slideIn: navigationDirection];
        [UIView commitAnimations];
    }
    return YES;
}

- (void)navigationBackwardsComplete
{
    // This function is called when the animation to the previous page completes. We need to 
    // deallocate the view that just went offscreen to the right and tell the newly visible view
    // that it has come into focus.
    animatingBakward = NO;
    
    DrillDownPage * p = [pageStack lastObject];    
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(navigationBackwardsCleanup:) userInfo:p repeats:NO];
    [p unlink];
    [pageStack removeLastObject];
 
    // tell the views that their "depth" in the stack has decreased by one. The top one should
    // have depth of zero and will become active. (This might involve it reloading)
    [pageStack makeObjectsPerformSelector:@selector(depthChanged:) withObject:[NSNumber numberWithInteger: kNavigationBackward]];
    navigationDirection = 0;
}

- (void)navigationBackwardsCleanup:(NSTimer*)t
{
    // we don't actually do anything. We just needed this timer to hold on to the Page object
    // so it wasn't deallocated immediately. This was causing a crash when a keyboard was visible.
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        // clear the loading page
        [pendingPage unlink];
        [pendingPage release];
        pendingPage = nil;
    } else {
        NSURLRequest * newRequest = [NSURLRequest requestWithURL: [[pendingPage request] URL]];
        [pendingPage setRequest: newRequest];
        [pendingPage loadWebView];
    }
}

@end

