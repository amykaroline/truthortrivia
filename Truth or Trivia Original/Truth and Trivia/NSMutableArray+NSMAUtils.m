//
//  NSMutableArray+NSMAUtils.m
//  Truth and Trivia
//
//  Created by Amy Karoline Haeuser on 5/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSMutableArray+NSMAUtils.h"

@implementation NSMutableArray (NSMAUtils)

- (void)shuffle
{
    
    static BOOL seeded = NO;
    if(!seeded)
    {
        seeded = YES;
        srandom((int)time(NULL));
    }
    
    NSUInteger count = [self count];
    for (NSUInteger i = 0; i < count; ++i) {
        // Select a random element between i and end of array to swap with.
        int nElements = (int)count - (int)i;
        int n = (arc4random() % nElements) + (int)i;
        [self exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
}


@end
