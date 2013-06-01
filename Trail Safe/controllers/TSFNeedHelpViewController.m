//
//  TSFNeedHelpViewController.m
//  Trail Safe
//
//  Created by Franklin Webber on 6/1/13.
//  Copyright (c) 2013 Trail Safe. All rights reserved.
//

#import "TSFNeedHelpViewController.h"
#import "JDFlipNumberView.h"

@interface TSFNeedHelpViewController ()

@property (weak, nonatomic) IBOutlet JDFlipNumberView *countdownTimer;

@end

@implementation TSFNeedHelpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.countdownTimer = [self createCountdownTimer];
    [self.countdownTimer setValue:10];
    [self.view addSubview:self.countdownTimer];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    [self.countdownTimer animateToValue:0 duration:10 completion:^(BOOL finished) {
        if (finished) {
            [self performSegueWithIdentifier:@"needHelpNow" sender:self];
        }
    }];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.countdownTimer stopAnimation];
    [self.countdownTimer setValue:10];
}

- (IBAction)cancel:(id)sender {
    [[self navigationController] popViewControllerAnimated:YES];
}

- (IBAction)back:(id)sender {
    [[self navigationController] popViewControllerAnimated:YES];
}

#pragma mark - Countdown Timer

- (JDFlipNumberView *)createCountdownTimer {
    JDFlipNumberView *numberView = [[JDFlipNumberView alloc] initWithDigitCount:2];
    [numberView setCenter:self.view.center];
    return numberView;
}

@end
