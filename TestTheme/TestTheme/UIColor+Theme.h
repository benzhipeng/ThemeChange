//
//  UIColor+Theme.h
//  TestTheme
//
//  Created by ben zhipeng on 15/11/4.
//  Copyright © 2015年 ben zhipeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Theme)

@property (nonatomic,strong) NSString*  key;

+ (UIColor*)color1;

+ (UIColor*)color2;
@end
