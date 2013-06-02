//
//  TSFStartHikeViewController.h
//  Trail Safe
//
//  Created by Franklin Webber on 6/1/13.
//  Copyright (c) 2013 Trail Safe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TSFStartHikeViewController : UIViewController

- (IBAction)back:(id)sender;
- (IBAction)startHike:(id)sender;

- (IBAction)timerChanged:(id)sender;

@property (weak, nonatomic) IBOutlet UIDatePicker *hikeTimePicker;
@end
