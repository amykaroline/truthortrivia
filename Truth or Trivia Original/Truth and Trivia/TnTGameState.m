//
//  TnTGameState.m
//  Truth and Trivia
//
//  Created by Stephan Fedelay on 4/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TnTGameState.h"

@implementation TnTGameState
@synthesize currentVictim;
@synthesize questionType;
@synthesize playerNames;
@synthesize funSkin;
@synthesize comingFromShake;
+(TnTGameState *) globalInstance {
    static TnTGameState* theInstance = nil;
    if (theInstance == nil) {
        theInstance = [[[self class] alloc] init];
        theInstance.playerNames = [NSArray arrayWithObjects:@"Player 1", @"Player 2", nil];
        theInstance.funSkin = NO;
    }
    return theInstance;
}
-(void) chooseRandomVictim {
    NSLog(@"Current number of players: %@", self.playerNames);
    int i = arc4random_uniform((int)self.playerNames.count);
    self.currentVictim = [self.playerNames objectAtIndex:i];
    NSLog(@"random number was %d", i);
}
@end
