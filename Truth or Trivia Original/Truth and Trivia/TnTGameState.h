//
//  TnTGameState.h
//  Truth and Trivia
//
//  Created by Stephan Fedelay on 4/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TnTGameState : NSObject
+(TnTGameState *) globalInstance;
@property (nonatomic) NSString *currentVictim; // Who's turn it is
@property (nonatomic) NSString *questionType; 
@property (nonatomic) NSArray *playerNames;
@property (nonatomic) BOOL funSkin;
@property (nonatomic) BOOL comingFromShake;
-(void) chooseRandomVictim;
@end
