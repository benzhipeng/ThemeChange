//
//  UINavigationBar+Theme.m
//  TestTheme
//
//  Created by ben zhipeng on 15/11/9.
//  Copyright © 2015年 ben zhipeng. All rights reserved.
//

#import "UINavigationBar+Theme.h"
#import "UIView+Theme.h"

@implementation UINavigationBar (Theme)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        SEL originalSelector = @selector(setBarTintColor:);
        SEL swizzledSelector = @selector(hook_setBarTintColor:);
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        BOOL didAddMethod =
        class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        if (didAddMethod){
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (void)hook_setBarTintColor:(UIColor*)barTintColor {
    
    if(barTintColor && barTintColor.key){
        if(!self.key){
            self.key = barTintColor.key;
            
            [[ThemeManager sharedManager].themeTintObjectDic setThemeObject:self key:self.key];
        }
    }
    [self hook_setBarTintColor:barTintColor];
}

@end
