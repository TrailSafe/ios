//
//  TSFServiceProvider.m
//  Trail Safe
//
//  Created by Franklin Webber on 6/1/13.
//  Copyright (c) 2013 Trail Safe. All rights reserved.
//

#import "TSFServiceProvider.h"

@implementation TSFServiceProvider

+ (void)createUser:(TSFUser *)user withDevice:(NSString *)device {
    NSString *userURL = [NSString stringWithFormat:@"%@/%@",[self serviceURLWithDevice:device],@"/user"];
    
    NSDictionary *userData = @{@"user": @{ @"first_name" : user.name,
                                           @"last_name" : @"",
                                           @"phone_number" : user.phoneNumber } };
    
    [self postWithURL:userURL andData:userData];
}

+ (void)createContact:(TSFContact *)contact withDevice:(NSString *)device {
    NSString *contactURL = [NSString stringWithFormat:@"%@/%@",[self serviceURLWithDevice:device],@"/contact"];
    [self postWithURL:contactURL andData:[contact toDictionary]];
}

+ (NSString *)serviceURL {
    return @"http://api.trailsafeapp.com";
}

+ (NSString *)apiKey {
    return @"d86717e11cbb54c45390bbb6262c0df3537d24b5d283a380800620035fe5f47622b770487dbadd9feec0dfbeaf64c5b3423ed38ce99504169481686a5ce5c26e";
}

+ (NSString *)serviceURLWithDevice:(NSString *)device {
    return [NSString stringWithFormat:@"%@/devices/%@",[self serviceURL],device];
}


+ (id)postWithURL:(NSString *)url andData:(NSDictionary *)dictionary {
    
    JXHTTPOperation *operation = [[JXHTTPOperation alloc] initWithURL:[NSURL URLWithString:url]];
    operation.requestBody = [[JXHTTPFormEncodedBody alloc] initWithDictionary:dictionary];
    operation.requestHeaders = @{@"Authorization": [self apiKey] };
    
    
    [operation startAndWaitUntilFinished];
    
    NSString *result = [operation responseString];
    NSLog(@"%@",result);
    return result;
}

@end
