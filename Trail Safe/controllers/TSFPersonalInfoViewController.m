//
//  TSFPersonalInfoViewController.m
//  Trail Safe
//
//  Created by Franklin Webber on 6/1/13.
//  Copyright (c) 2013 Trail Safe. All rights reserved.
//

#import "TSFPersonalInfoViewController.h"

@interface TSFPersonalInfoViewController ()

@end

@implementation TSFPersonalInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

- (IBAction)submitData:(id)sender {
    [self performSegueWithIdentifier:@"InCaseOfEmergencyInfo" sender:self];
}
@end
