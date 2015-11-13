//
//  UIColor+Custom.m
//  TestTheme
//
//  Created by ben zhipeng on 15/11/10.
//  Copyright © 2015年 ben zhipeng. All rights reserved.
//

#import "UIColor+Custom.h"
#import "ThemeManager.h"

@implementation UIColor (Custom)
+ (UIColor*)color1{
    
    UIColor* color = nil;
    if([ThemeManager sharedManager].status == 0){
        color =  [UIColor redColor];
    }else {
        color =  [UIColor yellowColor];
    }
    color.key = NSStringFromSelector(_cmd);
    return color;
}

+ (UIColor*)color2{
    
    UIColor* color = nil;
    if([ThemeManager sharedManager].status == 0){
        color =  [UIColor whiteColor];
    }else {
        color =  [UIColor whiteColor];
    }
    color.key = NSStringFromSelector(_cmd);
    return color;
}

@end
