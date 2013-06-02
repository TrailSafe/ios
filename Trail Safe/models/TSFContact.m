//
//  TSFContact.m
//  Trail Safe
//
//  Created by Franklin Webber on 6/1/13.
//  Copyright (c) 2013 Trail Safe. All rights reserved.
//

#import "TSFContact.h"

@implementation TSFContact

+ (BOOL)isDefaultContactDefined {
    return [self contactData] != nil;
}

+ (id)defaultContact {
    NSDictionary *dictionary = [[NSUserDefaults standardUserDefaults] objectForKey:[self keyDefaultContact]];
    return [[self alloc] initWithDictionary:dictionary];
}

+ (void)saveContactAsDefaultContact:(TSFContact *)contact {
    [[NSUserDefaults standardUserDefaults] setObject:[contact toDictionary] forKey:[[self class] keyDefaultContact]];
}

+ (NSDictionary *)contactData {
    return [[NSUserDefaults standardUserDefaults] objectForKey:[self keyDefaultContact]];
}

+ (NSString *)keyDefaultContact {
    return @"contact.default";
}

#pragma mark - Initialization

- (id)initWithDictionary:(NSDictionary *)dictionary {
    
    self = [super init];
    
    if (self) {
        self.name = [dictionary objectForKey:@"name"];
        self.phoneNumber = [dictionary objectForKey:@"phoneNumber"];
    }
    
    return self;
}

- (NSDictionary *)toDictionary {
    return @{@"name":self.name,@"phoneNumber":self.phoneNumber};
}

@end
