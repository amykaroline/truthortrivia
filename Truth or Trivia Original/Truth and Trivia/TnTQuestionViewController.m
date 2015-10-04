//
//  TnTTruthViewController.m
//  Truth and Trivia
//
//  Created by Stephan Fedelay on 4/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#include "stdlib.h"
#import "TnTQuestionViewController.h"
#import "TnTGameState.h"
#import <QuartzCore/QuartzCore.h>
#import "NSMutableArray+NSMAUtils.h"
#import "TnTQuestionObject.h"

@interface TnTQuestionViewController ()

@end

@implementation TnTQuestionViewController
@synthesize answerLabel;
@synthesize questionLabel;
@synthesize answerButton;
@synthesize currentVictimLabel;
@synthesize answerText;
@synthesize bkgdImage;
@synthesize navBar;
@synthesize bkgdImage2;
@synthesize navBar2;
@synthesize truthBkgdButton;
@synthesize triviaBkgdButton1;
@synthesize triviaBkgdButton2;

-(void)viewWillAppear:(BOOL)animated{
    if ([[TnTGameState globalInstance] funSkin] == YES){
        //set background to fun bkgd
        bkgdImage.image = [UIImage imageNamed:@"BkgdRed_fun.png"];
        [navBar setTintColor:[UIColor colorWithRed:(255/255.) green:(0/255.) blue:(0/255.) alpha:(1.0)]];        
        [currentVictimLabel setTextColor:[UIColor colorWithRed:(0/255.) green:(0/255.) blue:(0/255.) alpha:(1.0)]];
        [answerButton setImage:[UIImage imageNamed:@"SeeAnswer_fun.png"] forState:UIControlStateNormal];
        [questionLabel setTextColor:[UIColor colorWithRed:(0/255.) green:(0/255.) blue:(0/255.) alpha:(1.0)]];
        [answerLabel setTextColor:[UIColor colorWithRed:(0/255.) green:(0/255.) blue:(0/255.) alpha:(1.0)]];
        bkgdImage2.image = [UIImage imageNamed:@"BkgdOrange_fun.png"];
        [navBar2 setTintColor:[UIColor colorWithRed:(255/255.) green:(74/255.) blue:(0/255.) alpha:(1.0)]];
        [truthBkgdButton setImage:[UIImage imageNamed:@"bkgdBubble1_fun.png"] forState:UIControlStateNormal];
        [triviaBkgdButton1 setImage:[UIImage imageNamed:@"bkgdBubble2_fun.png"] forState:UIControlStateNormal];
        [triviaBkgdButton2 setImage:[UIImage imageNamed:@"bkgdBubble2_fun.png"] forState:UIControlStateNormal];

    }
    
}


// For shaking
- (BOOL) canBecomeFirstResponder { return YES; }

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self becomeFirstResponder]; // to catch shake events
}

-(void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (event.subtype == UIEventSubtypeMotionShake) {
        // it was shook - invoke the segue
        NSLog(@"I was shook?!");
        [TnTGameState globalInstance].comingFromShake = YES;
        [self performSegueWithIdentifier:@"NextTurn" sender:self];
    }
}
// end shaking

- (IBAction)nextScreenButton:(id)sender {
    [self performSegueWithIdentifier:@"NextTurn" sender:self];
}
- (IBAction)topButtonPressed:(id)sender {
    NSLog(@"top bottom pressed...");
    if (self.answerLabel.hidden == YES) {
        [self answerPressed:self];
    } else {
        [self performSegueWithIdentifier:@"NextTurn" sender:self];
    }
}
- (IBAction)bottomButtonPressed:(id)sender {
    [self performSegueWithIdentifier:@"NextTurn" sender:self];
}


- (IBAction)answerPressed:(id)sender {
    self.answerLabel.hidden = NO;
    self.answerButton.enabled = NO;
    self.triviaBkgdButton2.hidden = NO;
    self.answerButton.hidden = YES;
}

- (TnTQuestionObject *)getRandomTriviaQuestion {
    static NSMutableArray* triviaDeck;
    if (triviaDeck == nil || [triviaDeck count] == 0) {
        // Read question/answers from file and stuff into triviaDeck and shuffle!
        NSString* filePath = @"trivia-questions";//file path...
        NSString* fileRoot = [[NSBundle mainBundle] 
                              pathForResource:filePath ofType:@"txt"];
        // read everything from text
        NSString* fileContents = 
        [NSString stringWithContentsOfFile:fileRoot 
                                  encoding:NSUTF8StringEncoding error:nil];
        
        // first, separate by new line
        NSArray* allLinedStrings = 
        [fileContents componentsSeparatedByCharactersInSet:
         [NSCharacterSet newlineCharacterSet]];

        triviaDeck = [[NSMutableArray alloc] init];
        int numLines = (int)[allLinedStrings count];
        for (int x=0; x<numLines; x++){
            NSArray *thisLineComponents = [[allLinedStrings objectAtIndex:x] componentsSeparatedByString:@" ### "];
            if ([thisLineComponents count] != 2) {
                continue;
            }
            TnTQuestionObject *thisObject = [TnTQuestionObject createObjectWithQuestion:[thisLineComponents objectAtIndex:0] answer:[thisLineComponents objectAtIndex:1]];
            [triviaDeck addObject:thisObject];
            
        }

        [triviaDeck shuffle];
    }
    
    TnTQuestionObject *thisQ = [triviaDeck objectAtIndex:0];
    [triviaDeck removeObjectAtIndex:0];
    return thisQ;

}

- (TnTQuestionObject *) getRandomTruthQuestion {
    static NSMutableArray *truthDeck;
    if (truthDeck == nil || [truthDeck count] == 0) {
        // Read question/answers from file and stuff into triviaDeck and shuffle!
        NSString* filePath = @"truth-questions";//file path...
        NSString* fileRoot = [[NSBundle mainBundle] 
                              pathForResource:filePath ofType:@"txt"];
        // read everything from text
        NSString* fileContents = 
        [NSString stringWithContentsOfFile:fileRoot 
                                  encoding:NSUTF8StringEncoding error:nil];
        
        // first, separate by new line
        NSArray* allLinedStrings = 
        [fileContents componentsSeparatedByCharactersInSet:
         [NSCharacterSet newlineCharacterSet]];
        
        truthDeck = [[NSMutableArray alloc] init];
        unsigned long numLines = [allLinedStrings count];
        for (int x=0; x<numLines; x++){
            if ([[allLinedStrings objectAtIndex:x] length] == 0) {
                continue;
            }
            TnTQuestionObject *thisObject = [TnTQuestionObject createObjectWithQuestion:[allLinedStrings objectAtIndex:x] answer:nil];
            [truthDeck addObject:thisObject];
            
        }
        
        [truthDeck shuffle];
    }
    
    TnTQuestionObject *thisQ = [truthDeck objectAtIndex:0];
    [truthDeck removeObjectAtIndex:0];
    return thisQ;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    if (answerLabel) {
        // its a trivia question
        TnTQuestionObject *thisObject = [self getRandomTriviaQuestion];
        self.questionLabel.text = thisObject.question;
        self.answerLabel.hidden = YES;
        self.answerLabel.text = thisObject.answer;
    } else {
        // Truth question
        self.questionLabel.text = [self getRandomTruthQuestion].question;
    }
    self.questionLabel.layer.cornerRadius = 10;
    self.currentVictimLabel.text = [TnTGameState globalInstance].currentVictim;
    self.triviaBkgdButton2.hidden = YES;
    
}

- (void)viewDidUnload
{
    [self setCurrentVictimLabel:nil];
    [self setAnswerLabel:nil];
    [self setQuestionLabel:nil];
    [self setAnswerButton:nil];
    [self setBkgdImage:nil];
    [self setNavBar:nil];
    [self setBkgdImage2:nil];
    [self setNavBar2:nil];
    [self setTruthBkgdButton:nil];
    [self setTriviaBkgdButton1:nil];
    [self setTriviaBkgdButton2:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

@end
