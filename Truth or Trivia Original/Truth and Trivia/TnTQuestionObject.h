//
//  TnTQuestionObject.h
//  Truth or Trivia
//
//  Created by Amy Karoline Haeuser on 6/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TnTQuestionObject : NSObject

@property (nonatomic) NSString *question;
@property (nonatomic) NSString *answer;

+ (TnTQuestionObject *)createObjectWithQuestion: (NSString *)question answer:(NSString *)answer;
@end
