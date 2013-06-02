//
//  TSFHomeViewController.m
//  Trail Safe
//
//  Created by Franklin Webber on 6/1/13.
//  Copyright (c) 2013 Trail Safe. All rights reserved.
//

#import "TSFHomeViewController.h"
#import "TSFUser.h"

@interface TSFHomeViewController ()

@end

@implementation TSFHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (! [TSFUser isCurrentUserDefined]) {
        [self segueToGatherPersonalInformation];
    }

}

- (void)segueToGatherPersonalInformation {
    [self performSegueWithIdentifier:@"gatherPersonalInformation" sender:self];
}

@end
