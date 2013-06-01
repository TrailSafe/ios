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

- (IBAction)submitData:(id)sender {
    [self performSegueWithIdentifier:@"backToHome" sender:self];
}
@end
