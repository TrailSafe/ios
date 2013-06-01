//
//  TSFICEViewController.m
//  Trail Safe
//
//  Created by Franklin Webber on 6/1/13.
//  Copyright (c) 2013 Trail Safe. All rights reserved.
//

#import "TSFICEViewController.h"

@interface TSFICEViewController ()

@end

@implementation TSFICEViewController

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

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self unregisterKeyboardEvents];
}

- (IBAction)submitData:(id)sender {
    [self performSegueWithIdentifier:@"backToHome" sender:self];
}

#pragma mark - Keyboard Events

- (void)keyboardDidShow:(NSNotification *)notification {
    __block UIView *mainView = self.view;
    
    [UIView animateWithDuration:0.2 animations:^{
        [mainView setFrame:CGRectMake(0,-120,320,460)];
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
