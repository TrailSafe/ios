//
//  TSFServiceProvider.m
//  Trail Safe
//
//  Created by Franklin Webber on 6/1/13.
//  Copyright (c) 2013 Trail Safe. All rights reserved.
//

#import "TSFServiceProvider.h"
#import "JXHTTP.h"

@interface TSFServiceProvider ()

@property (nonatomic,retain) NSString *device;

@end

@implementation TSFServiceProvider

- (id)initWithDevice:(NSString *)device {
    self = [super init];
    if (self) {
        self.device = device;
    }
    return self;
}

- (BOOL)doesUserExists {
    JXHTTPOperation *response = [self getWithURL:[self userURL]];
    return ([response responseStatusCode] == 200);
}

- (void)createUser:(TSFUser *)user {
    NSDictionary *userData = @{@"user": @{ @"first_name" : user.name,
                                           @"last_name" : @"",
                                           @"phone_number" : user.phoneNumber } };

    [self postWithURL:[self userURL] andData:userData];
}

- (void)createContact:(TSFContact *)contact {
    NSString *contactURL = [NSString stringWithFormat:@"%@/%@",[self serviceURL],@"user/emergency_contact"];
    NSDictionary *contactData = @{ @"contact" : [contact toDictionary] };
    [self postWithURL:contactURL andData:contactData];
}

- (void)createActivity:(TSFActivity *)activity {
    [self postWithURL:[self activityURL] andData:[activity toDictionary]];
}

- (TSFActivity *)currentActivity {
    JXHTTPOperation *operation = [self getWithURL:[self currentActivityURL]];

    TSFActivity *activity = nil;

    if ([operation responseStatusCode] == 200) {
        NSDictionary *activityData = [[operation responseJSON] objectForKey:@"activity"];
        activity = [[TSFActivity alloc] initWithDictionary:activityData];
    }

    return activity;
}

- (void)deleteCurrentActivity {
    [self deleteWithURL:[self currentActivityURL]];
}

- (void)pushLocation:(NSDictionary *)dictionary {
    NSDictionary *locationData = @{@"location":dictionary};
    [self postWithURL:[self updateLocationURL] andData:locationData];
}

- (BOOL)hasEmergencyAlreadyBeenInitiated {
    JXHTTPOperation *operation = [self getWithURL:[self initiateEmergencyURL]];
    return (operation.responseStatusCode == 200);
}

- (void)initiateEmergency {
    [self postWithURL:[self initiateEmergencyURL] andData:@{}];
}

#pragma mark - Service Information

- (NSString *)serviceURL {
    return @"http://api.trailsafeapp.com";
}

- (NSString *)serviceURLWithDevice {
    return [NSString stringWithFormat:@"%@/devices/%@",[self serviceURL],[self device]];
}

- (NSString *)activityURL {
    return [NSString stringWithFormat:@"%@/%@",[self serviceURLWithDevice],@"user/activities"];
}

- (NSString *)userURL {
    return [NSString stringWithFormat:@"%@/%@",[self serviceURLWithDevice],@"user"];
}

- (NSString *)currentActivityURL {
    return [NSString stringWithFormat:@"%@/%@",[self serviceURLWithDevice],@"current_activity"];
}

- (NSString *)updateLocationURL {
    return [NSString stringWithFormat:@"%@/%@",[self serviceURLWithDevice],@"locations"];
}

- (NSString *)initiateEmergencyURL {
    return [NSString stringWithFormat:@"%@/%@",[self serviceURLWithDevice],@"help_request"];
}

- (NSString *)apiKey {
    return @"d86717e11cbb54c45390bbb6262c0df3537d24b5d283a380800620035fe5f47622b770487dbadd9feec0dfbeaf64c5b3423ed38ce99504169481686a5ce5c26e";
}


#pragma mark - Request Methods


- (JXHTTPOperation *)getWithURL:(NSString *)url {
    NSLog(@"GET %@",url);

    JXHTTPOperation *operation = [[JXHTTPOperation alloc] initWithURL:[NSURL URLWithString:url]];
    operation.requestHeaders = @{@"Authorization": [self apiKey] };

    [operation startAndWaitUntilFinished];

    NSLog(@"Response %d",[operation responseStatusCode]);

    return operation;
}

- (JXHTTPOperation *)postWithURL:(NSString *)url andData:(NSDictionary *)dictionary {
    NSLog(@"POST %@",url);

    JXHTTPOperation *operation = [[JXHTTPOperation alloc] initWithURL:[NSURL URLWithString:url]];
    operation.requestBody = [JXHTTPJSONBody withJSONObject:dictionary];
    operation.requestHeaders = @{@"Authorization": [self apiKey] };

    [operation startAndWaitUntilFinished];

   NSLog(@"Response %d",[operation responseStatusCode]);

    return operation;
}

- (JXHTTPOperation *)deleteWithURL:(NSString *)url {
    NSLog(@"DELETE %@",url);

    JXHTTPOperation *operation = [[JXHTTPOperation alloc] initWithURL:[NSURL URLWithString:url]];
    [operation.request setHTTPMethod:@"DELETE"];
    operation.requestHeaders = @{@"Authorization": [self apiKey] };

    [operation startAndWaitUntilFinished];

    NSLog(@"Response %d",[operation responseStatusCode]);

    return operation;
}

@end
