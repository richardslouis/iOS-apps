//
//  ViewController.h
//  iSOS
//
//  Created by Richards Louis on 07/11/12.
//  Copyright (c) 2012 Richards Louis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

{
    IBOutlet UIWebView *myWebView;
    
    IBOutlet UIActivityIndicatorView *activity;
    
    NSTimer *timer;
    
}

- (void)timerLoad;


-(IBAction) callPhone;

-(IBAction) callone;

-(IBAction) callnine;

-(IBAction) one;

-(IBAction) two;

//Asia

-(IBAction) cambodia;

-(IBAction) hongkong;

-(IBAction) china;

-(IBAction) Japan;

-(IBAction) Indonesia;

-(IBAction) Mongolia;

-(IBAction) Malaysia;

-(IBAction) India;

-(IBAction) Myanmar;

-(IBAction) NewCaledonia;

-(IBAction) NewZealand;

-(IBAction) PapuaNewGuinea;

-(IBAction) Phillipines;

-(IBAction) Singapore;

-(IBAction) SouthKorea;

-(IBAction) Taiwan;

-(IBAction) Thailand;

-(IBAction) Vietnam;


//Africa

-(IBAction) Ethiopia;

-(IBAction) Madagascar;

-(IBAction) Kenya;

-(IBAction) Mauritius;

-(IBAction) Eqypt;

-(IBAction) Libya;

-(IBAction) Ghana;

-(IBAction) Mali;

-(IBAction) Burundi;

-(IBAction) Nigeria;

-(IBAction) Naimbia;

-(IBAction) Tunisia;

-(IBAction) Zambia;

-(IBAction) Zimbabwe;

-(IBAction) SouthAfrica;

-(IBAction) Somalia;

-(IBAction) Togo;

-(IBAction) SierraLeone;

//Europe

-(IBAction) Albania;

-(IBAction) Austria;

-(IBAction) Belarus;

-(IBAction) Belgium;

-(IBAction) Denmark;

-(IBAction) Finland;

-(IBAction) Germany;

-(IBAction) Ireland;

-(IBAction) Italy;

-(IBAction) Luxembourg;

-(IBAction) Poland;

-(IBAction) Portugal;

-(IBAction) Spain;

-(IBAction) Sweden;

-(IBAction) Switzerland;

-(IBAction) Turkey;

-(IBAction) UnitedKingdom;

-(IBAction) VaticanCity;


//Australia

-(IBAction) Australia;


//North America

-(IBAction) Bermuda;

-(IBAction) Canada;

-(IBAction) UnitedStates;

-(IBAction) Greenland;

-(IBAction) Mexico;

-(IBAction) Cuba;

-(IBAction) Dominica;

-(IBAction) Jamaica;

-(IBAction) Panama;

//South America

-(IBAction) Brazil;

-(IBAction) Chile;

-(IBAction) Peru;

-(IBAction) Argentina;

-(IBAction) Columbia;

-(IBAction) Bolivia;

-(IBAction) Educator;

-(IBAction) Venezuela;

-(IBAction) Paraguay;

@end
