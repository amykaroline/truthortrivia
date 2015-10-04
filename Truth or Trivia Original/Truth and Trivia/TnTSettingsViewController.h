//
//  TnTSettingsViewController.h
//  Truth and Trivia
//
//  Created by Amy Karoline Haeuser on 5/30/12.
//  Copyright (c) 2012 SteamyCo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TnTGameState.h"

@interface TnTSettingsViewController : UIViewController
@property (strong, nonatomic) IBOutlet UISwitch *funSkinSwitch;
@property (strong, nonatomic) IBOutlet UIImageView *bkgdImage;
@property (strong, nonatomic) IBOutlet UIButton *backButton;
@property (strong, nonatomic) IBOutlet UILabel *funSkinSwitchLabel;
@property (strong, nonatomic) IBOutlet UILabel *supportLabel;
@property (strong, nonatomic) IBOutlet UILabel *builtByLabel;

@end
