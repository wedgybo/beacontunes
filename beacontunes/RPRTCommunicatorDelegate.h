//
//  RPRTCommunicatorDelegate.h
//  beacontunes
//
//  Created by Jamie Sutherland on 25/04/2014.
//  Copyright (c) 2014 Pussy Galore. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RPRTCommunicatorDelegate <NSObject>
- (void)receivedGroupsJSON:(NSData *)objectNotation;
- (void)fetchingGroupsFailedWithError:(NSError *)error;
@end
