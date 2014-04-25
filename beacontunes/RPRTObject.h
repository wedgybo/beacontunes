//
//  RPRTObject.h
//  beacontunes
//
//  Created by Jamie Sutherland on 25/04/2014.
//  Copyright (c) 2014 Pussy Galore. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RPRTObject : NSObject

@property (strong, nonatomic) NSString *band_id;
@property (strong, nonatomic) NSString *band_name;
@property (strong, nonatomic) NSString *beacon_id;
@property (strong, nonatomic) NSString *gig_id;
@property (strong, nonatomic) NSString *gig_name;
@property (strong, nonatomic) NSString *venue_id;
@property (strong, nonatomic) NSString *venue_name;

@end
