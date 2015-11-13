//
//  ThemeManager.h
//  TestTheme
//
//  Created by ben zhipeng on 15/11/4.
//  Copyright © 2015年 ben zhipeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (Theme)
- (void)setThemeObject:(id)object key:(NSString*)key;

- (void)clear;

- (void)set:(NSInteger)type;
@end



@interface ThemeManager : NSObject
@property (nonatomic,assign) NSInteger status;
@property (nonatomic,strong) NSMutableDictionary*  themeBgObjectDic;
@property (nonatomic,strong) NSMutableDictionary*  themeTintObjectDic;
@property (nonatomic,strong) NSMutableDictionary*  themeTextObjectDic;
@property (nonatomic,strong) NSMutableDictionary*  themeButtonTextObjectDic;

+ (instancetype)sharedManager;

- (void)clear;

- (void)log;
@end