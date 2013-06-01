//
//  TSFOnHelpViewController.m
//  Trail Safe
//
//  Created by Franklin Webber on 6/1/13.
//  Copyright (c) 2013 Trail Safe. All rights reserved.
//

#import "TSFOnHelpViewController.h"

@interface TSFOnHelpViewController ()

@end

@implementation TSFOnHelpViewController


- (NSString *)callForHelpText {
    return @"Cancel Call For Help";
}

- (IBAction)cancel:(id)sender {

    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:[self callForHelpText] delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:nil];
    
    [actionSheet showInView:self.view];
    
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    [[self navigationController] popViewControllerAnimated:YES];
}

@end
