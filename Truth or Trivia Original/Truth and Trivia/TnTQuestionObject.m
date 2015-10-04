//
//  TnTQuestionObject.m
//  Truth or Trivia
//
//  Created by Amy Karoline Haeuser on 6/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TnTQuestionObject.h"

@implementation TnTQuestionObject

@synthesize question = _question;
@synthesize answer = _answer;

+ (TnTQuestionObject *)createObjectWithQuestion: (NSString *)question answer:(NSString *)answer{
    TnTQuestionObject *obj = [[TnTQuestionObject alloc] init];
    obj.question = question;
    obj.answer = answer;
    return obj;
}


@end
