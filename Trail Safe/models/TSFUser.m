//
//  TSFUser.m
//  Trail Safe
//
//  Created by Franklin Webber on 6/1/13.
//  Copyright (c) 2013 Trail Safe. All rights reserved.
//

#import "TSFUser.h"

@implementation TSFUser

+ (BOOL)isCurrentUserDefined {
    return [self userData] != nil;
}

+ (id)currentUser {
    NSDictionary *dictionary = [[NSUserDefaults standardUserDefaults] objectForKey:[self keyCurrentUser]];
    return [[self alloc] initWithDictionary:dictionary];
}

+ (void)saveUserAsCurrentUser:(TSFUser *)user {
    [[NSUserDefaults standardUserDefaults] setObject:[user toDictionary] forKey:[[self class] keyCurrentUser]];
}

+ (NSDictionary *)userData {
    return [[NSUserDefaults standardUserDefaults] objectForKey:[self keyCurrentUser]];
}

+ (NSString *)keyCurrentUser {
    return @"user.current";
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
