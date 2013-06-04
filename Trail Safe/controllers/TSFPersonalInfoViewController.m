//
//  TSFPersonalInfoViewController.m
//  Trail Safe
//
//  Created by Franklin Webber on 6/1/13.
//  Copyright (c) 2013 Trail Safe. All rights reserved.
//

#import "TSFPersonalInfoViewController.h"
#import "TSFUser.h"
#import "TSFServiceProvider.h"

@interface TSFPersonalInfoViewController ()

@end

@implementation TSFPersonalInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboardAnimated)];
    
    [self.view addGestureRecognizer:tap];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self registerKeyboardEvents];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self unregisterKeyboardEvents];
}

#pragma mark - Events

- (IBAction)submitData:(id)sender {
    
    NSDictionary *userInfo = @{@"name":self.nameField.text,@"phoneNumber":self.phoneField.text};
    
    TSFUser *user = [[TSFUser alloc] initWithDictionary:userInfo];
    [TSFUser saveUserAsCurrentUser:user];
    
    TSFServiceProvider *provider = [TSFServiceProvider provider];
    [provider createUser:user];
    
    [self segueToCollectEmergencyContactInformation];
}

- (void)segueToCollectEmergencyContactInformation {
    [self performSegueWithIdentifier:@"InCaseOfEmergencyInfo" sender:self];
}

#pragma mark - Keyboard Events

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

- (void)keyboardDidShow:(NSNotification *)notification {
    __block UIView *mainView = self.view;
    
    [UIView animateWithDuration:0.2 animations:^{
        [mainView setFrame:CGRectMake(0,-130,320,460)];
    }];
    
}

-(void)keyboardDidHide:(NSNotification *)notification {
    [self dismissKeyboardAnimated];
}

- (void)dismissKeyboardAnimated {
    [[self phoneField] resignFirstResponder];
    [[self nameField] resignFirstResponder];
    
    __block UIView *mainView = self.view;
    
    [UIView animateWithDuration:0.2 animations:^{
        [mainView setFrame:CGRectMake(0,0,320,460)];
    }];
}

- (void)registerKeyboardEvents {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
}

- (void)unregisterKeyboardEvents {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
