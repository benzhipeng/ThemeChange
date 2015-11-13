//
//  UIColor+Theme.m
//  TestTheme
//
//  Created by ben zhipeng on 15/11/4.
//  Copyright © 2015年 ben zhipeng. All rights reserved.
//

#import "UIColor+Theme.h"
#import <objc/runtime.h>
@implementation UIColor (Theme)

- (void)setKey:(NSString *)key{
    objc_setAssociatedObject(self, @selector(key), key, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)key{
    id  obj = objc_getAssociatedObject(self, _cmd);
    return obj;
}


@end
