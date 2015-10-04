//
//  TnTNamesViewController.h
//  Truth and Trivia
//
//  Created by Stephan Fedelay on 4/16/12.
//  Copyright (c) 2012 SteamyCo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TnTNamesViewController : UIViewController<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *playerName1;
@property (strong, nonatomic) IBOutlet UITextField *playerName2;
@property (strong, nonatomic) IBOutlet UITextField *player3Name;
@property (strong, nonatomic) IBOutlet UITextField *player4Name;
@property (strong, nonatomic) IBOutlet UITextField *player5Name;
@property (strong, nonatomic) IBOutlet UIButton *removePlayerButton;
@property (strong, nonatomic) IBOutlet UIButton *addPlayerButton;
@property (strong, nonatomic) IBOutlet UIImageView *bkgdImage;
@property (strong, nonatomic) IBOutlet UIButton *playButton;
@property (strong, nonatomic) IBOutlet UIButton *plusButton;
@property (strong, nonatomic) IBOutlet UIButton *minusButton;
@property (strong, nonatomic) IBOutlet UIImageView *openingTitleImage;
@property (strong, nonatomic) IBOutlet UIButton *settingsButton;

-(void)textFieldDidEndEditing:(UITextField *)textField;
-(void)keyboardWillShow;
-(void)keyboardWillHide;
-(void)setViewMovedUp:(BOOL)movedUp;

@end
