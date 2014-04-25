//
//  RPRTCommunicator.m
//  beacontunes
//
//  Created by Jamie Sutherland on 25/04/2014.
//  Copyright (c) 2014 Pussy Galore. All rights reserved.
//

#import "RPRTCommunicator.h"

@implementation RPRTCommunicator
- (void)searchBeacons:(NSString*)beaconId
{
    NSString *urlAsString = [NSString stringWithFormat:@"https://api.rprtapp.com/music/%@", beaconId];
    NSURL *url = [[NSURL alloc] initWithString:urlAsString];
    NSLog(@"%@", urlAsString);
    
    [NSURLConnection sendAsynchronousRequest:[[NSURLRequest alloc] initWithURL:url] queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        if (error) {
            [self.delegate fetchingGroupsFailedWithError:error];
        } else {
            [self.delegate receivedGroupsJSON:data];
        }
    }];
}
@end
