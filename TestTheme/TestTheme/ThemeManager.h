//
//  ThemeManager.h
//  TestTheme
//
//  Created by ben zhipeng on 15/11/4.
//  Copyright © 2015年 ben zhipeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ThemeManager : NSObject
@property (nonatomic,assign) NSInteger status;
+ (instancetype)sharedManager;

- (void)setBgObject:(id)anObject forKey:(NSString*)aKey;

- (void)setTextObject:(id)anObject forKey:(NSString*)aKey;
@end