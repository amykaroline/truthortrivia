//
//  TnTNamesViewController.m
//  Truth and Trivia
//
//  Created by Stephan Fedelay on 4/16/12.
//  Copyright (c) 2012 SteamyCo. All rights reserved.
//

#import "TnTNamesViewController.h"
#import "TnTGameState.h"

#define MAX_PLAYERS 5
#define kOFFSET_FOR_KEYBOARD 80.0

@interface TnTNamesViewController () {
    UITextField* curTextField;
}
@property (nonatomic) int numPlayers;
@end

@implementation TnTNamesViewController
@synthesize numPlayers = _numPlayers;
@synthesize playerName1;
@synthesize playerName2;
@synthesize player3Name;
@synthesize player4Name;
@synthesize player5Name;
@synthesize removePlayerButton;
@synthesize addPlayerButton;
@synthesize bkgdImage;
@synthesize playButton;
@synthesize plusButton;
@synthesize minusButton;
@synthesize openingTitleImage;
@synthesize settingsButton;

- (IBAction)player1NameDidEndOnExit:(id)sender {
    [self.playerName1 resignFirstResponder];
}
- (IBAction)player2NameDidEndOnExit:(id)sender {
    [self.playerName2 resignFirstResponder];
}
- (IBAction)player3NameDidEndOnExit:(id)sender {
    [self.player3Name resignFirstResponder];
}
- (IBAction)player4NameDidEndOnExit:(id)sender {
    [self.player4Name resignFirstResponder];
}
- (IBAction)player5NameDidEndOnExit:(id)sender {
    [self.player5Name resignFirstResponder];
}


-(void)keyboardWillShow {
    // Animate the current view out of the way
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}

-(void)keyboardWillHide {
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}

-(void)textFieldDidBeginEditing:(UITextField *)sender
{    
    // Make it easier to change the name:
    [sender selectAll:self];
    curTextField = sender;
}

//method to move the view up/down whenever the keyboard is shown/dismissed
-(void)setViewMovedUp:(BOOL)movedUp
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3]; // if you want to slide up the view
    
    CGRect rect = self.view.frame;
    if (movedUp)
    {
        // 1. move the view's origin up so that the text field that will be hidden come above the keyboard 
        // 2. increase the size of the view so that the area behind the keyboard is covered up.
        rect.origin.y -= kOFFSET_FOR_KEYBOARD;
        rect.size.height += kOFFSET_FOR_KEYBOARD;
    }
    else
    {
        // revert back to the normal state.
        rect.origin.y += kOFFSET_FOR_KEYBOARD;
        rect.size.height -= kOFFSET_FOR_KEYBOARD;
    }
    self.view.frame = rect;
    
    [UIView commitAnimations];
}



- (void)viewWillAppear:(BOOL)animated {
    if ([[TnTGameState globalInstance] funSkin] == YES){
        //set background to fun bkgd
        bkgdImage.image = [UIImage imageNamed:@"BkgdOrange_fun.png"];
        openingTitleImage.image = [UIImage imageNamed:@"Main_fun 6 OpeningScreen.png"];
        [settingsButton setImage:[UIImage imageNamed:@"Settings_fun.png"] forState:UIControlStateNormal];
        [playButton setImage:[UIImage imageNamed:@"playButton_fun.png"] forState:UIControlStateNormal];
        [minusButton setImage:[UIImage imageNamed:@"minusButton_fun.png"] forState:UIControlStateNormal];
        [plusButton setImage:[UIImage imageNamed:@"plusButton_fun.png"] forState:UIControlStateNormal];
        [playerName1 setBackgroundColor:[UIColor colorWithRed:(255./255.) green:(0/255.) blue:(0/255.) alpha:(1.0)]];
        [playerName2 setBackgroundColor:[UIColor colorWithRed:(0/255.) green:(200/255.) blue:(0/255.) alpha:(1.0)]];
        [player3Name setBackgroundColor:[UIColor colorWithRed:(0/255.) green:(99/255.) blue:(99/255.) alpha:(1.0)]];
        [player4Name setBackgroundColor:[UIColor colorWithRed:(255./255.) green:(74/255.) blue:(0/255.) alpha:(1.0)]];
        [player5Name setBackgroundColor:[UIColor colorWithRed:(255./255.) green:(0/255.) blue:(0/255.) alpha:(1.0)]];
    }
    
    // register for keyboard notifications
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];

}

- (void)viewWillDisappear:(BOOL)animated
{
    // unregister for keyboard notifications while not visible.
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    TnTGameState* gs = [TnTGameState globalInstance];
    self.numPlayers = (int)gs.playerNames.count;
    // Set the text of the labels accordingly.
    for (int i = 0; i < 5; i++) {
        UITextField* textfield = [self getPlayerName:i];
        if (i < self.numPlayers) {
            textfield.text = [gs.playerNames objectAtIndex:i];
        }
        textfield.delegate = self;
    }
    
    
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    NSLog(@"touches!");
    if ([curTextField isFirstResponder] && [touch view] != curTextField) {
        NSLog(@"outside touches!");
        [curTextField resignFirstResponder];
    }
    [super touchesBegan:touches withEvent:event];
}

- (void) textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"textField did end editing");
    curTextField = nil;
}

- (void)setNumPlayers:(int)numPlayers {
    static int baseHeight = -1, maxHeight = -1;
    if (baseHeight == -1) {
        baseHeight = [self getPlayerName:0].frame.origin.y;
        UITextField* tf5 = [self getPlayerName:4];
        maxHeight = tf5.frame.origin.y + tf5.frame.size.height;
    }
    if (numPlayers > 5) numPlayers = 5;
    if (numPlayers < 2) numPlayers = 2;
    _numPlayers = numPlayers;
    int sizePer = (maxHeight - baseHeight) / numPlayers;
    int i = 0;
    if (numPlayers == 2) {
        UITextField* tf1 = [self getPlayerName:0];
        UITextField* tf2 = [self getPlayerName:1];
        int y1 = (maxHeight + baseHeight) / 2.0 - 25;
        int y2 = (maxHeight + baseHeight) / 2.0 + 25;
        tf1.frame = CGRectMake(tf1.frame.origin.x, y1, tf1.frame.size.width, tf1.frame.size.height);
        tf2.frame = CGRectMake(tf2.frame.origin.x, y2, tf2.frame.size.width, tf2.frame.size.height);
        
    } else {
        for (i = 0; i < numPlayers; i++) {
            UITextField* textfield = [self getPlayerName:i];
            textfield.hidden = NO;
            int y = baseHeight + sizePer * (i + 0.32);
            textfield.frame = CGRectMake(textfield.frame.origin.x, y, textfield.frame.size.width, textfield.frame.size.height);
        }
    }
    for (int i = numPlayers; i < MAX_PLAYERS; i++) {
        UITextField* textfield = [self getPlayerName:i];
        textfield.hidden = YES;
        if (textfield == curTextField) {
            [curTextField resignFirstResponder];
            curTextField = nil;
        }
    }
    if (numPlayers == 2) {
        self.removePlayerButton.enabled = NO;
    } else {
        self.removePlayerButton.enabled = YES;
    }
    if (numPlayers == MAX_PLAYERS) {
        self.addPlayerButton.enabled = NO;
    } else {
        self.addPlayerButton.enabled = YES;
    }
    
}


- (IBAction)addPlayerButtonPressed:(id)sender {
    NSLog(@"adding player...");
    self.numPlayers = self.numPlayers + 1;
}
- (IBAction)removePlayerButtonPressed:(id)sender {
    self.numPlayers = self.numPlayers - 1;
}

- (UITextField*) getPlayerName:(int)n {
    switch (n) {
        case 0: return self.playerName1; break;
        case 1: return self.playerName2; break;
        case 2: return self.player3Name; break;
        case 3: return self.player4Name; break;
        case 4: return self.player5Name; break;
        default: return nil; break;
    }
}

- (void)viewDidUnload
{
    [self setPlayerName1:nil];
    [self setPlayerName2:nil];
    [self setPlayer3Name:nil];
    [self setPlayer4Name:nil];
    [self setPlayer5Name:nil];
    [self setRemovePlayerButton:nil];
    [self setAddPlayerButton:nil];
    [self setBkgdImage:nil];
    [self setPlayButton:nil];
    [self setPlusButton:nil];
    [self setMinusButton:nil];
    [self setOpeningTitleImage:nil];
    [self setSettingsButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSMutableArray *arr = [[NSMutableArray alloc] initWithCapacity:self.numPlayers];
    for (int i = 0; i < self.numPlayers; i++) {
        [arr insertObject:[self getPlayerName:i].text atIndex:i];
    }
    [TnTGameState globalInstance].playerNames = [NSArray arrayWithArray:arr];
    NSLog(@"Hello monkey");
}

@end
