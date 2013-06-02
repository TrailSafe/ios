//
//  TSFActivity.h
//  Trail Safe
//
//  Created by Franklin Webber on 6/1/13.
//  Copyright (c) 2013 Trail Safe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSFActivity : NSObject

- (id)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic,retain) NSString *name;
@property (nonatomic,retain) NSDictionary *activityAreaData;
@property (nonatomic,retain) NSDictionary *returnAreaData;

- (NSNumber *)duration;
- (NSNumber *)durationInSeconds;

- (NSDictionary *)toDictionary;

- (BOOL)isCompleted;

@end
