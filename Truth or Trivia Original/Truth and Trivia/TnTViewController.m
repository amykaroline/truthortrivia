//
//  TnTViewController.m
//  Truth and Trivia
//
//  Created by Stephan Fedelay on 4/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TnTViewController.h"
#import "TnTGameState.h"

@interface TnTViewController ()

@end

@implementation TnTViewController
@synthesize victimLabel;
@synthesize triviaButton;
@synthesize truthButton;
@synthesize bkgdImage;
@synthesize navBar;

-(void)viewWillAppear:(BOOL)animated{
    if ([[TnTGameState globalInstance] funSkin] == YES){
        //set background to fun bkgd
        bkgdImage.image = [UIImage imageNamed:@"BkgdLime_fun.png"];
        [navBar setTintColor:[UIColor colorWithRed:(0/255.) green:(200/255.) blue:(0/255.) alpha:(1.0)]];        
        [victimLabel setTextColor:[UIColor colorWithRed:(0/255.) green:(0/255.) blue:(0/255.) alpha:(1.0)]];
        [truthButton setImage:[UIImage imageNamed:@"truthButton_fun.png"] forState:UIControlStateNormal];
        [triviaButton setImage:[UIImage imageNamed:@"triviaButton_fun.png"] forState:UIControlStateNormal];
    }

}

- (void)viewDidLoad
{
    [super viewDidLoad];
        
    NSString *cv = [TnTGameState globalInstance].currentVictim;
    [self.victimLabel setText:cv];
}

- (void)viewDidUnload
{
    [self setVictimLabel:nil];
    [self setTriviaButton:nil];
    [self setTruthButton:nil];
    [self setBkgdImage:nil];
    [self setNavBar:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

@end
