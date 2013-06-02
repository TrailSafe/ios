//
//  TSFHomeViewController.m
//  Trail Safe
//
//  Created by Franklin Webber on 6/1/13.
//  Copyright (c) 2013 Trail Safe. All rights reserved.
//

#import "TSFHomeViewController.h"
#import "TSFUser.h"
#import "TSFServiceProvider.h"
#import "TSFDevice.h"

@interface TSFHomeViewController ()

@end

@implementation TSFHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (! [TSFUser isCurrentUserDefined]) {
        [self segueToGatherPersonalInformation];
    }
    
    if ( [TSFServiceProvider currentActivityWithDevice:[TSFDevice deviceID]]) {
        [self segueToOnHike];
    }

}

- (void)segueToGatherPersonalInformation {
    [self performSegueWithIdentifier:@"gatherPersonalInformation" sender:self];
}

- (void)segueToOnHike {
    [self performSegueWithIdentifier:@"resumeHike" sender:self];
}

@end
