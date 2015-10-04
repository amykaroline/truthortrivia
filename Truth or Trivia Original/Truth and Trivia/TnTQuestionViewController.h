//
//  TnTTruthViewController.h
//  Truth and Trivia
//
//  Created by Stephan Fedelay on 4/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TnTQuestionViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *currentVictimLabel;
@property (strong, nonatomic) IBOutlet UILabel *answerLabel;
@property (strong, nonatomic) IBOutlet UILabel *questionLabel;
@property (strong, nonatomic) IBOutlet UIButton *answerButton;
@property NSString* answerText;
@property (strong, nonatomic) IBOutlet UIImageView *bkgdImage;
@property (strong, nonatomic) IBOutlet UINavigationBar *navBar;
@property (strong, nonatomic) IBOutlet UIImageView *bkgdImage2;
@property (strong, nonatomic) IBOutlet UINavigationBar *navBar2;
@property (strong, nonatomic) IBOutlet UIButton *truthBkgdButton;
@property (strong, nonatomic) IBOutlet UIButton *triviaBkgdButton1;
@property (strong, nonatomic) IBOutlet UIButton *triviaBkgdButton2;


@end
