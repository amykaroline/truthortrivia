//
//  TnTSettingsViewController.m
//  Truth and Trivia
//
//  Created by Amy Karoline Haeuser on 5/30/12.
//  Copyright (c) 2012 SteamyCo. All rights reserved.
//

#import "TnTSettingsViewController.h"

@interface TnTSettingsViewController ()

@end

@implementation TnTSettingsViewController
@synthesize funSkinSwitch;
@synthesize bkgdImage;
@synthesize backButton;
@synthesize funSkinSwitchLabel;
@synthesize supportLabel;
@synthesize builtByLabel;


- (IBAction)funSkinSwitchChanged:(id)sender {
    [[TnTGameState globalInstance] setFunSkin:funSkinSwitch.on];
    if (funSkinSwitch.on == YES){
        //set background to fun bkgd
        bkgdImage.image = [UIImage imageNamed:@"BkgdRed_fun.png"];
        [backButton setImage:[UIImage imageNamed:@"Back_fun.png"] forState:UIControlStateNormal];
        UIColor* textColor = [UIColor colorWithRed:(0.0/255.) green:(0/255.) blue:(0/255.) alpha:(1.0)];
        funSkinSwitchLabel.textColor = textColor;
        builtByLabel.textColor = textColor;
        supportLabel.textColor = textColor;
        [funSkinSwitch setOnTintColor:[UIColor colorWithRed:(255/255.) green:(74/255.) blue:(0/255.) alpha:(1.0)]];
    } else {
        bkgdImage.image = [UIImage imageNamed:@"bkgd_simple.png"];
        [backButton setImage:[UIImage imageNamed:@"Back_simple.png"] forState:UIControlStateNormal];
        UIColor* textColor = [UIColor colorWithRed:(255/255.) green:(222/255.) blue:(200/255.) alpha:(1.0)];
        funSkinSwitchLabel.textColor = textColor;
        builtByLabel.textColor = textColor;
        supportLabel.textColor = textColor;
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewWillAppear:(BOOL)animated{
    funSkinSwitch.on = [[TnTGameState globalInstance] funSkin];
    
    if (funSkinSwitch.on == YES){
        //set background to fun bkgd
        bkgdImage.image = [UIImage imageNamed:@"BkgdRed_fun.png"];
        [backButton setImage:[UIImage imageNamed:@"Back_fun.png"] forState:UIControlStateNormal];
        funSkinSwitchLabel.textColor = [UIColor colorWithRed:(0.0/255.) green:(99/255.) blue:(99/255.) alpha:(1.0)];
    }


}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [self setFunSkinSwitch:nil];
    [self setBkgdImage:nil];
    [self setBackButton:nil];
    [self setFunSkinSwitchLabel:nil];
    [self setSupportLabel:nil];
    [self setBuiltByLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
