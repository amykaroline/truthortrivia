//
//  TnTShakeItViewController.h
//  Truth and Trivia
//
//  Created by Stephan Fedelay on 4/16/12.
//  Copyright (c) 2012 SteamyCo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TnTShakeItViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *shakerText;
@property (strong, nonatomic) IBOutlet UIImageView *bkgdImage;
@property (strong, nonatomic) IBOutlet UINavigationBar *navBar;
@property (strong, nonatomic) IBOutlet UIButton *shakeItButton;
@property (strong, nonatomic) IBOutlet UILabel *shakeItLabel;

@end
