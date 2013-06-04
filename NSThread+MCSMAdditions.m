//
//  NSThread+MCSMAdditions.m
//  MCSMFoundation
//
//  Created by Spencer MacDonald on 06/07/2011.
//  Copyright 2011 Square Bracket Software. All rights reserved.
//

#import "NSThread+MCSMAdditions.h"

@implementation NSThread (MCSMAdditions)
+ (void)performBlockOnMainThread:(void (^)())block{
	[[NSThread mainThread] performBlock:block];
}

+ (void)performBlockInBackground:(void (^)())block{
	[NSThread performSelectorInBackground:@selector(runBlock:)
                               withObject:[[block copy] autorelease]];
}

+ (void)runBlock:(void (^)())block{
	block();
}


- (void)performBlock:(void (^)())block{
    
	if ([[NSThread currentThread] isEqual:self])
        block();
	else
        [self performBlock:block waitUntilDone:NO];
}
- (void)performBlock:(void (^)())block waitUntilDone:(BOOL)wait{
    
	[NSThread performSelector:@selector(runBlock:)
					 onThread:self
				   withObject:[[block copy] autorelease]
				waitUntilDone:wait];
}

- (void)performBlock:(void (^)())block afterDelay:(NSTimeInterval)delay{
    
	[self performSelector:@selector(performBlock:) 
			   withObject:[[block copy] autorelease] 
               afterDelay:delay];
}

@end
