//
//  TSFActivity.m
//  Trail Safe
//
//  Created by Franklin Webber on 6/1/13.
//  Copyright (c) 2013 Trail Safe. All rights reserved.
//

#import "TSFActivity.h"

@interface TSFActivity ()

@property (nonatomic,retain) NSDate *createdAt;
@property (nonatomic,retain) NSNumber *timeRemaining; // in minutes

@end

@implementation TSFActivity

- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    
    if (self) {
        self.createdAt = [NSDate date];
        
        self.name = [dictionary objectForKey:@"name"];
        
        self.activityAreaData = [dictionary objectForKey:@"activity_area_data"];
        if (!self.activityAreaData) { self.activityAreaData = @{}; }
        
        self.returnAreaData = [dictionary objectForKey:@"return_area_data"];
        if (!self.returnAreaData) { self.returnAreaData = @{}; }
        
        self.timeRemaining = [dictionary objectForKey:@"time_remaining"];    
    }
    
    return self;
}

- (NSNumber *)durationInSeconds {
    return self.timeRemaining;
}

- (NSNumber *)duration {
    return [NSNumber numberWithInt:[self.timeRemaining intValue] / 60];
}

- (BOOL)isCompleted {
    return ([[self createdAt] timeIntervalSinceNow] > [self.duration intValue]);
}

- (NSDictionary *)toDictionary {
    return @{ @"activity": @{ @"name" : self.name,
                              @"activity_area_data" : self.activityAreaData,
                              @"return_area_data" : self.returnAreaData,
                              @"duration" : self.duration } };
}

@end
