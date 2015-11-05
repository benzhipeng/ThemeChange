//
//  UIView+Theme.m
//  TestTheme
//
//  Created by ben zhipeng on 15/11/4.
//  Copyright © 2015年 ben zhipeng. All rights reserved.
//

#import "UIView+Theme.h"

@implementation UIView (Theme)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        SEL originalSelector = @selector(setBackgroundColor:);
        SEL swizzledSelector = @selector(hook_setBackgroundColor:);
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

- (void)hook_setBackgroundColor:(UIColor*)backgroundColor {

    if(backgroundColor && backgroundColor.key){
        if(!self.key){
            self.key = backgroundColor.key;
            [[ThemeManager sharedManager] setBgObject:self forKey:self.key];
        }
    }
    [self hook_setBackgroundColor:backgroundColor];
}

- (void)setKey:(NSString *)key{
    objc_setAssociatedObject(self, @selector(key), key, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)key{
    id  obj = objc_getAssociatedObject(self, _cmd);
    return obj;
}

@end
