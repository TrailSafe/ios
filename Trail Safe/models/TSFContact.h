//
//  TSFContact.h
//  Trail Safe
//
//  Created by Franklin Webber on 6/1/13.
//  Copyright (c) 2013 Trail Safe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSFContact : NSObject

+ (BOOL)isDefaultContactDefined;
+ (id)defaultContact;
+ (void)saveContactAsDefaultContact:(TSFContact *)contact;

- (id)initWithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)toDictionary;

@property (nonatomic,retain) NSString *name;
@property (nonatomic,retain) NSString *phoneNumber;


@end
