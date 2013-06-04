//
//  TSFStartHikeViewController.m
//  Trail Safe
//
//  Created by Franklin Webber on 6/1/13.
//  Copyright (c) 2013 Trail Safe. All rights reserved.
//

#import "TSFStartHikeViewController.h"
#import "TSFActivity.h"
#import "TSFDevice.h"
#import "TSFServiceProvider.h"

@interface TSFStartHikeViewController ()

@property (nonatomic,retain) NSNumber *lastSelectedHikeTime;

@end

@implementation TSFStartHikeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.lastSelectedHikeTime = @7200;
    [self.hikeTimePicker setCountDownDuration:[self.lastSelectedHikeTime intValue]];
}

- (IBAction)back:(id)sender {
    [[self navigationController] popViewControllerAnimated:YES];
}

- (IBAction)startHike:(id)sender {
    TSFServiceProvider *provider = [[TSFServiceProvider alloc] initWithDevice:[TSFDevice deviceID]];

    TSFActivity *activity = [[TSFActivity alloc] initWithDictionary:@{@"name": @"Solo Hike", @"time_remaining": self.lastSelectedHikeTime }];
    [provider createActivity:activity];
    
    [self performSegueToOnHike];
}

- (IBAction)timerChanged:(id)sender {
    
    NSTimeInterval timeInterval = (NSTimeInterval)self.hikeTimePicker.countDownDuration;
    NSNumber *hikeTime = [NSNumber numberWithInt:timeInterval];
    
    self.lastSelectedHikeTime = hikeTime;
}

- (void)performSegueToOnHike {
    [self performSegueWithIdentifier:@"startHike" sender:self];
}

@end
