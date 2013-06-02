//
//  TSFDevice.m
//  Trail Safe
//
//  Created by Franklin Webber on 6/1/13.
//  Copyright (c) 2013 Trail Safe. All rights reserved.
//

#import "TSFDevice.h"

@implementation TSFDevice

+ (id)deviceID {
    return [self findOrCreateDeviceID];
}

+ (NSString *)findOrCreateDeviceID {
    
    NSString *deviceID = [[NSUserDefaults standardUserDefaults] objectForKey:[self keyDeviceIdentifier]];
    
    if (deviceID == nil) {
        deviceID = [self GetUUID];
        [self setDeviceID:deviceID];
    }
    
    return deviceID;
}

+ (void)setDeviceID:(NSString *)deviceID {
    [[NSUserDefaults standardUserDefaults] setObject:deviceID forKey:[self keyDeviceIdentifier]];
}


+ (NSString *)keyDeviceIdentifier {
    return @"device.identifier";
}

+ (NSString *)GetUUID {
    CFUUIDRef theUUID = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, theUUID);
    CFRelease(theUUID);
    return (__bridge NSString *)string;
}

@end
