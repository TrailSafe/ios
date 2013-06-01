//
//  TSFICEViewController.h
//  Trail Safe
//
//  Created by Franklin Webber on 6/1/13.
//  Copyright (c) 2013 Trail Safe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TSFICEViewController : UIViewController

- (IBAction)submitData:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UITextField *nameField;

@end
