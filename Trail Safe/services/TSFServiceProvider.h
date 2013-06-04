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
- (BOOL)doesUserExists;
- (void)createUser:(TSFUser *)user;

- (void)createContact:(TSFContact *)contact;

- (void)createActivity:(TSFActivity *)activity;
- (TSFActivity *)currentActivity;
- (void)deleteCurrentActivity;

- (void)pushLocation:(NSDictionary *)dictionary;

- (BOOL)hasEmergencyAlreadyBeenInitiated;
- (void)initiateEmergency;

@end
