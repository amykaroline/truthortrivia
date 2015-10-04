//
//  TnTViewController.h
//  Truth and Trivia
//
//  Created by Stephan Fedelay on 4/15/12.
//  Copyright (c) 2012 SteamyCo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TnTViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *victimLabel;
@property (strong, nonatomic) IBOutlet UIButton *triviaButton;
@property (strong, nonatomic) IBOutlet UIButton *truthButton;
@property (strong, nonatomic) IBOutlet UIImageView *bkgdImage;
@property (strong, nonatomic) IBOutlet UINavigationBar *navBar;


@end
