//
//  TSFOnHikeViewController.m
//  Trail Safe
//
//  Created by Franklin Webber on 6/1/13.
//  Copyright (c) 2013 Trail Safe. All rights reserved.
//

#import "TSFOnHikeViewController.h"
#import "JDDateCountdownFlipView.h"
#import "TSFServiceProvider.h"
#import "TSFLocationService.h"

@interface TSFOnHikeViewController ()

@property (weak, nonatomic) IBOutlet JDDateCountdownFlipView *countdownTimer;

@end

@implementation TSFOnHikeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.countdownTimer = [self createCountdownTimer];
    [self.view addSubview:self.countdownTimer];
}

- (NSDate *)countdownToDate {
    
    TSFServiceProvider *provider = [TSFServiceProvider provider];
    TSFActivity *currentActivity = [provider currentActivity];
    return [NSDate dateWithTimeIntervalSinceNow:[[currentActivity durationInSeconds] intValue]];
}

#pragma mark - Countdown Timer

- (JDDateCountdownFlipView *)createCountdownTimer {
    JDDateCountdownFlipView  *countdownTimer = [[JDDateCountdownFlipView alloc] initWithDayDigitCount:0];
    countdownTimer.targetDate = [self countdownToDate];
    
    [countdownTimer setCenter:self.view.center];
    [countdownTimer setFrame:CGRectMake(countdownTimer.frame.origin.x + 205,countdownTimer.frame.origin.y,self.view.frame.size.width,400)];

    return countdownTimer;
}


- (IBAction)finishHike:(id)sender {
    TSFServiceProvider *provider = [TSFServiceProvider provider];
    [provider deleteCurrentActivity];
    [[TSFLocationService location] stopUpdatingLocation];
    [self performSegueWithIdentifier:@"finishHike" sender:self];
}
@end
