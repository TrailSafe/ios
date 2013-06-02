//
//  TSFServiceProvider.h
//  Trail Safe
//
//  Created by Franklin Webber on 6/1/13.
//  Copyright (c) 2013 Trail Safe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSFUser.h"
#import "TSFContact.h"
#import "TSFActivity.h"

@interface TSFServiceProvider : NSObject

- (id)initWithDevice:(NSString *)device;

+ (BOOL)doesUserExistsWithDevice:(NSString *)device;
+ (void)createUser:(TSFUser *)user withDevice:(NSString *)device;

+ (void)createContact:(TSFContact *)contact withDevice:(NSString *)device;

+ (void)createActivity:(TSFActivity *)activity withDevice:(NSString *)device;
+ (TSFActivity *)currentActivityWithDevice:(NSString *)device;
+ (void)deleteCurrentActivityWithDevice:(NSString *)device;

+ (void)pushLocation:(NSDictionary *)dictionary withDevice:(NSString *)device;

+ (BOOL)hasEmergencyAlreadyBeenInitiatedWithDevice:(NSString *)device;
+ (void)initiateEmergencyWithDevice:(NSString *)device;

@end
