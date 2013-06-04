//
//  NSThread+MCSMAdditions.h
//  MCSMFoundation
//
//  Created by Spencer MacDonald on 06/07/2011.
//  Copyright 2011 Square Bracket Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSThread (MCSMAdditions)

+ (void)performBlockOnMainThread:(void (^)())block;
+ (void)performBlockInBackground:(void (^)())block;
+ (void)runBlock:(void (^)())block;
- (void)performBlock:(void (^)())block;
- (void)performBlock:(void (^)())block waitUntilDone:(BOOL)wait;
- (void)performBlock:(void (^)())block afterDelay:(NSTimeInterval)delay;

@end
