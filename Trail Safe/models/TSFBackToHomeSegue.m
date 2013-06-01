//
//  TSFBackToHomeSegue.m
//  Trail Safe
//
//  Created by Franklin Webber on 6/1/13.
//  Copyright (c) 2013 Trail Safe. All rights reserved.
//

#import "TSFBackToHomeSegue.h"
#import "TSFHomeViewController.h"

@implementation TSFBackToHomeSegue

- (void)perform {
    UINavigationController *navigationController = [[self sourceViewController] navigationController];
    [navigationController popToRootViewControllerAnimated:NO];

    [navigationController setNavigationBarHidden:YES];
    [navigationController pushViewController:[self destinationViewController] animated:YES];
}
@end
