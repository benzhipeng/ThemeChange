//
//  main.m
//  TestTheme
//
//  Created by ben zhipeng on 15/11/4.
//  Copyright © 2015年 ben zhipeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <objc/runtime.h>

int main(int argc, char * argv[]) {
    @autoreleasepool {
        // Swizzle the nav bar
//        Method drawRectCustomBackground = class_getInstanceMethod([UINavigationBar class], @selector(drawRectCustomBackground:));
//        Method drawRect = class_getInstanceMethod([UINavigationBar class], @selector(drawRect:));
//        method_exchangeImplementations(drawRect, drawRectCustomBackground);
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
