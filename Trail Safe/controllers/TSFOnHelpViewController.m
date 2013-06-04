//
//  TSFOnHelpViewController.m
//  Trail Safe
//
//  Created by Franklin Webber on 6/1/13.
//  Copyright (c) 2013 Trail Safe. All rights reserved.
//

#import "TSFOnHelpViewController.h"
#import "TSFServiceProvider.h"

@interface TSFOnHelpViewController ()

@end

@implementation TSFOnHelpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    TSFServiceProvider *provider = [TSFServiceProvider provider];

    if (! [provider hasEmergencyAlreadyBeenInitiated]) {
        [provider initiateEmergency];
    }
}

- (NSString *)callForHelpText {
    return @"Cancel Call For Help";
}

- (IBAction)cancel:(id)sender {

    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:[self callForHelpText] delegate:self cancelButtonTitle:@"Keep Calling For Help" destructiveButtonTitle:@"Cancel" otherButtonTitles:nil];
    
    [actionSheet showInView:self.view];
    
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
        
    if (buttonIndex == 0) {
        [[self navigationController] popViewControllerAnimated:YES];
    }
}

@end
