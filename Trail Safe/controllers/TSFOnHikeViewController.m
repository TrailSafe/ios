//
//  TSFOnHikeViewController.m
//  Trail Safe
//
//  Created by Franklin Webber on 6/1/13.
//  Copyright (c) 2013 Trail Safe. All rights reserved.
//

#import "TSFOnHikeViewController.h"
#import "JDDateCountdownFlipView.h"


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
    NSDateComponents *currentComps = [[NSCalendar currentCalendar] components:NSYearCalendarUnit fromDate:[NSDate date]];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"dd.MM.yy HH:mm"];
    return [dateFormatter dateFromString:[NSString stringWithFormat: @"01.01.%d 00:00", currentComps.year + 1]];
}

#pragma mark - Countdown Timer

- (JDDateCountdownFlipView *)createCountdownTimer {
    JDDateCountdownFlipView  *countdownTimer = [[JDDateCountdownFlipView alloc] initWithDayDigitCount:0];
    countdownTimer.targetDate = [self countdownToDate];
    
    [countdownTimer setCenter:self.view.center];
    [countdownTimer setFrame:CGRectMake(countdownTimer.frame.origin.x + 205,countdownTimer.frame.origin.y,self.view.frame.size.width,400)];

    return countdownTimer;
}


@end
