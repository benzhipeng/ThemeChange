//
//  UILabel+Theme.m
//  TestTheme
//
//  Created by ben zhipeng on 15/11/5.
//  Copyright © 2015年 ben zhipeng. All rights reserved.
//

#import "UILabel+Theme.h"
#import "UIView+Theme.h"

@implementation UILabel (Theme)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        SEL originalSelector = @selector(setTextColor:);
        SEL swizzledSelector = @selector(hook_setTextColor:);
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

- (void)hook_setTextColor:(UIColor*)textColor {
    
    if(textColor && textColor.key){
        if(!self.key){
            self.key = textColor.key;
            [[ThemeManager sharedManager] setTextObject:self forKey:self.key];
        }
    }
    [self hook_setTextColor:textColor];
}



@end
