//
//  main.m
//  Trail Safe
//
//  Created by Franklin Webber on 6/1/13.
//  Copyright (c) 2013 Trail Safe. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TSFAppDelegate.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        [PXEngine licenseKey:@"5TQL8-7SM8A-DOF3C-P3J68-089GG-S7BIS-NF3D7-3D4LR-1355O-50TG1-22RQB-VSL28-MUTT3-G9N24-8KUGQ-AA" forUser:@"franklin.webber@gmail.com"];
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([TSFAppDelegate class]));
    }
}
