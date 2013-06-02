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

@interface TSFServiceProvider : NSObject

+ (void)createUser:(TSFUser *)user withDevice:(NSString *)device;
+ (void)createContact:(TSFContact *)contact withDevice:(NSString *)device;

@end
