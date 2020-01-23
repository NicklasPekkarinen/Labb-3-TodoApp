//
//  main.m
//  Labb3 ToDo
//
//  Created by Nicklas Pekkarinen on 2020-01-23.
//  Copyright © 2020 Nicklas Pekkarinen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
