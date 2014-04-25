//
//  RPRTCommunicator.h
//  beacontunes
//
//  Created by Jamie Sutherland on 25/04/2014.
//  Copyright (c) 2014 Pussy Galore. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RPRTCommunicatorDelegate.h"

@interface RPRTCommunicator : NSObject
@property (weak, nonatomic) id<RPRTCommunicatorDelegate> delegate;

- (void)searchBeacons:(NSString*)beaconId;
@end
