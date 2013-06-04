//
//  TSFLocationService.h
//  Trail Safe
//
//  Created by Franklin Webber on 6/2/13.
//  Copyright (c) 2013 Trail Safe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface TSFLocationService : NSObject <CLLocationManagerDelegate>

+ (id)location;
- (void)startUpdatingLocation;
- (void)stopUpdatingLocation;

@end
