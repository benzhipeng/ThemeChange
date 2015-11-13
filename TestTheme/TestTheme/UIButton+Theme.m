//
//  UIButton+Theme.m
//  TestTheme
//
//  Created by ben zhipeng on 15/11/9.
//  Copyright © 2015年 ben zhipeng. All rights reserved.
//

#import "UIButton+Theme.h"
#import "UIView+Theme.h"


@implementation UIButton (Theme)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        SEL originalSelector = @selector(setTitleColor:forState:);
        SEL swizzledSelector = @selector(hook_setTitleColor:forState:);
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

- (void)hook_setTitleColor:(UIColor*)titleColor forState:(UIControlState)state {
    
    if(titleColor && titleColor.key){
        if(!self.key){
            self.key = titleColor.key;
            
            [[ThemeManager sharedManager].themeButtonTextObjectDic setThemeObject:self key:self.key];
        }
    }
    [self hook_setTitleColor:titleColor forState:UIControlStateNormal];
}

@end
