//
//  TnTShakeItViewController.m
//  Truth and Trivia
//
//  Created by Stephan Fedelay on 4/16/12.
//  Copyright (c) 2012 SteamyCo. All rights reserved.
//

#import "stdlib.h"
#import "TnTShakeItViewController.h"
#import "TnTGameState.h"

@interface TnTShakeItViewController ()
@property (nonatomic) BOOL isRandomizing;
@property (nonatomic) int flipsLeft;
@end

@implementation TnTShakeItViewController
@synthesize shakerText;
@synthesize bkgdImage;
@synthesize navBar;
@synthesize shakeItButton;
@synthesize shakeItLabel;
@synthesize isRandomizing;
@synthesize flipsLeft;

-(void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (event.subtype == UIEventSubtypeMotionShake) {
        // it was shook - invoke the segue
        NSLog(@"I was shook?!");
        [self startRandomization];
    }
}
- (IBAction)shakeItButtonPressed:(id)sender {
    [self startRandomization];
}

- (void) startRandomization {
    if (isRandomizing) return;
    isRandomizing = true;
    [[TnTGameState globalInstance] chooseRandomVictim];
    flipsLeft = 11 + arc4random_uniform(4);
    [self performSelector:@selector(doOneFlip) withObject:self afterDelay:0.1];
}

- (void) doOneFlip {
    NSLog(@"Do one flip %d", flipsLeft);
    flipsLeft -= 1;
    TnTGameState* gs = [TnTGameState globalInstance];
    if (flipsLeft == 0) {
        self.shakerText.text = gs.currentVictim;
        self.isRandomizing = false;
        self.flipsLeft = -1;
        // TODO: perform sigue to next screen now.
        [self performSelector:@selector(gotoNextScreen) withObject:self afterDelay:0.700];
        NSLog(@"ok waiting...");
    
    } else {
        int i = arc4random_uniform((int)gs.playerNames.count);
        self.shakerText.text = [gs.playerNames objectAtIndex:i];
        // Need to select some random time between 0.20 & 0.40
        float delay = 0.05 + 0.05 * arc4random_uniform(4);
        [self performSelector:@selector(doOneFlip) withObject:self afterDelay:delay];
    }
}
- (void) gotoNextScreen {
    NSLog(@"trying segue manually now.");
    [self performSegueWithIdentifier:@"ShakeIt" sender:self];
}
    

- (void)viewWillAppear:(BOOL)animated{
    if ([[TnTGameState globalInstance] funSkin] == YES){
        //set background to fun bkgd
        bkgdImage.image = [UIImage imageNamed:@"BkgdAqua_fun.png"];
        [shakeItButton setImage:[UIImage imageNamed:@"shakeButton_fun.png"] forState:UIControlStateNormal];
        [navBar setTintColor:[UIColor colorWithRed:(0/255.) green:(99/255.) blue:(99/255.) alpha:(1.0)]];        
        [shakeItLabel setTextColor:[UIColor colorWithRed:(0/255.) green:(0/255.) blue:(0/255.) alpha:(1.0)]];
        [shakerText setTextColor:[UIColor colorWithRed:(0/255.) green:(0/255.) blue:(0/255.) alpha:(1.0)]]; 
    }

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
    isRandomizing = NO;
    flipsLeft = -1;
    // If we're coming from a shake, disable the variable
    // and set ourselves a'shaking.
    if ([TnTGameState globalInstance].comingFromShake) {
        NSLog(@"coming from shake so doing the shake");
        [TnTGameState globalInstance].comingFromShake = NO;
        [self startRandomization];
    }
}


- (BOOL) canBecomeFirstResponder { return YES; }

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self becomeFirstResponder]; // to catch shake events
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"prepare for segue");
    
}


- (void)viewDidUnload
{
    [self setShakerText:nil];
    [self setBkgdImage:nil];
    [self setNavBar:nil];
    [self setShakeItButton:nil];
    [self setShakeItLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

@end
