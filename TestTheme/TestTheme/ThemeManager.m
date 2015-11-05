//
//  ThemeManager.m
//  TestTheme
//
//  Created by ben zhipeng on 15/11/4.
//  Copyright © 2015年 ben zhipeng. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "ThemeManager.h"
#import <objc/runtime.h>
#import <objc/message.h>

@interface ThemeManager ()
@property (nonatomic,strong) NSMutableDictionary*  themeBgObjectDic;
@property (nonatomic,strong) NSMutableDictionary*  themeTextObjectDic;
@end


@implementation ThemeManager

static ThemeManager *_sharedManager;
+ (instancetype)sharedManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{ _sharedManager = [[self alloc] init]; });
    return _sharedManager;
}

- (id)init{
    if(self = [super init]){
        [self addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
        self.themeBgObjectDic = [[NSMutableDictionary alloc] init];
        self.themeTextObjectDic = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)setBgObject:(id)anObject forKey:(NSString*)aKey{

    NSMutableArray* tmp = self.themeBgObjectDic[aKey];
    if(!tmp){
        tmp = [[NSMutableArray alloc] init];
    }
    if(![tmp containsObject:anObject]){
        [tmp addObject:anObject];
    }
    [self.themeBgObjectDic setObject:tmp forKey:aKey];
}


- (void)setTextObject:(id)anObject forKey:(NSString *)aKey{
    NSMutableArray* tmp = self.themeTextObjectDic[aKey];
    if(!tmp){
        tmp = [[NSMutableArray alloc] init];
    }
    if(![tmp containsObject:anObject]){
        [tmp addObject:anObject];
    }
    [self.themeTextObjectDic setObject:tmp forKey:aKey];
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    
    if([keyPath isEqualToString:@"status"]){

        for(NSString* key in self.themeTextObjectDic.allKeys){
            SEL sel = NSSelectorFromString(key);
            Class klass = NSClassFromString(@"UIColor");
            if ( [klass respondsToSelector:sel] ){
                UIColor* color =  objc_msgSend(klass, sel);
                NSArray* objs = self.themeTextObjectDic[key];
                [objs enumerateObjectsUsingBlock:^(UILabel*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    [obj setTextColor:color];
                }];
            }
        }
        
        for(NSString* key in self.themeBgObjectDic.allKeys){
            
            SEL sel = NSSelectorFromString(key);
            Class klass = NSClassFromString(@"UIColor");
            if ( [klass respondsToSelector:sel] ){
                UIColor* color =  objc_msgSend(klass, sel);
                NSArray* objs = self.themeBgObjectDic[key];
                [objs enumerateObjectsUsingBlock:^(UIView*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    [obj setBackgroundColor:color];
                }];
            }
        }
    }else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}
@end
