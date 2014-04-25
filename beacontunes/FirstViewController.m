//
//  FirstViewController.m
//  beacontunes
//
//  Created by Jamie Sutherland on 25/04/2014.
//  Copyright (c) 2014 Pussy Galore. All rights reserved.
//

#import "FirstViewController.h"
#import "BuyViewController.h"
#import "ESTBeacon.h"
#import "ESTBeaconManager.h"
#import "ESTBeaconRegion.h"

@interface FirstViewController ()

@property (nonatomic, strong) ESTBeacon         *beacon;
@property (nonatomic, strong) ESTBeaconManager  *beaconManager;
@property (nonatomic, strong) ESTBeaconRegion   *beaconRegion;

@property (nonatomic, strong) UISwitch          *enterRegionSwitch;
@property (nonatomic, strong) UISwitch          *exitRegionSwitch;

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor clearColor];
    
    /////////////////////////////////////////////////////////////
    // setup Estimote beacon manager
    
    // craete manager instance
    self.beaconManager = [[ESTBeaconManager alloc] init];
    self.beaconManager.delegate = self;
    
    // create sample region object (you can additionaly pass major / minor values)
    self.beaconRegion = [[ESTBeaconRegion alloc] initWithProximityUUID:ESTIMOTE_PROXIMITY_UUID
                                                      identifier:@"EstimoteSampleRegion"];
    
    self.beaconRegion.notifyOnEntry = self.enterRegionSwitch.isOn;
    self.beaconRegion.notifyOnExit = self.exitRegionSwitch.isOn;
    
    // start looking for estimote beacons in region
    // when beacon ranged beaconManager:didEnterRegion:
    // and beaconManager:didExitRegion: invoked
    //[self.beaconManager startMonitoringForRegion:self.beaconRegion];
    
    //[self.beaconManager requestStateForRegion:self.beaconRegion];
    
    // start looking for estimtoe beacons in region
    // when beacon ranged beaconManager:didRangeBeacons:inRegion: invoked
    [self.beaconManager startRangingBeaconsInRegion:self.beaconRegion];
}

-(void)beaconManager:(ESTBeaconManager *)manager
   didDetermineState:(CLRegionState)state
           forRegion:(ESTBeaconRegion *)region
{
    if(state == CLRegionStateInside)
    {
   //     [self setProductImage];
    }
    else
    {
   //     [self setDiscountImage];
    }
}


-(void)beaconManager:(ESTBeaconManager *)manager
     didRangeBeacons:(NSArray *)beacons
            inRegion:(ESTBeaconRegion *)region
{
    if([beacons count] > 0)
    {
        // beacon array is sorted based on distance
        // closest beacon is the first one
        ESTBeacon* closestBeacon = [beacons objectAtIndex:0];
        
        
        NSURL * imageURL;
        NSData * imageData;
        UIImage * image;
        BuyViewController *viewController = [[BuyViewController alloc] init];

        // calculate and set new y position
        switch (closestBeacon.proximity)
        {
            case CLProximityUnknown:
                //self.distanceLabel.text = @"Unknown region";
                break;
            case CLProximityImmediate:
                //self.distanceLabel.text = @"Immediate region";
                self.artistName.text = @"Foo Fighters";
                self.venueName.text = @"Voodoo Rooms";
                self.trackName.text = @"Monkey Wrench";
                
                imageURL = [NSURL URLWithString:@"http://upload.wikimedia.org/wikipedia/en/thumb/0/0d/FooFighters-TheColourAndTheShape.jpg/220px-FooFighters-TheColourAndTheShape.jpg"];
                imageData = [NSData dataWithContentsOfURL:imageURL];
                image = [UIImage imageWithData:imageData];
                self.albumArt.image = image;
                
                //[self.navigationController pushViewController:viewController animated:YES];
                NSLog(@"Switch to payment view");
                break;
            case CLProximityNear:
                //self.distanceLabel.text = @"Near region";
                self.artistName.text = @"Blink-182";
                self.venueName.text = @"Liquid Rooms";
                self.trackName.text = closestBeacon.proximityUUID.UUIDString;
                
                imageURL = [NSURL URLWithString:@"http://www.shopradiocast.com/product_images/o/376/blink__78943_std.jpg"];
                imageData = [NSData dataWithContentsOfURL:imageURL];
                image = [UIImage imageWithData:imageData];
                self.albumArt.image = image;
                
                break;
            case CLProximityFar:
                //self.distanceLabel.text = @"Far region";
                
                break;
                
            default:
                break;
        }
    }
}

#pragma mark - ESTBeaconManager delegate

- (void)beaconManager:(ESTBeaconManager *)manager didEnterRegion:(ESTBeaconRegion *)region
{
    UILocalNotification *notification = [UILocalNotification new];
    notification.alertBody = @"Enter region notification";
    
    [[UIApplication sharedApplication] presentLocalNotificationNow:notification];
}

- (void)beaconManager:(ESTBeaconManager *)manager didExitRegion:(ESTBeaconRegion *)region
{
    UILocalNotification *notification = [UILocalNotification new];
    notification.alertBody = @"Exit region notification";
    
    [[UIApplication sharedApplication] presentLocalNotificationNow:notification];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
