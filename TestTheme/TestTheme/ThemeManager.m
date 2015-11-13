//
//  ThemeManager.m
//  TestTheme
//
//  Created by ben zhipeng on 15/11/4.
//  Copyright © 2015年 ben zhipeng. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "ThemeManager.h"
#import <objc/message.h>

typedef id (^WeakReference)(void);

WeakReference MakeWeakReference (id object) {
    __weak id weakref = object;
    return ^{ return weakref; };
}

id WeakReferenceNonretainedObjectValue (WeakReference ref) {
    if (ref == nil)
        return nil;
    else
        return ref ();
}


@implementation NSMutableDictionary (Theme)

- (void)setThemeObject:(id)object key:(NSString*)key{
    
    NSMutableArray* tmp = self[key];
    if(!tmp){
        tmp = [[NSMutableArray alloc] init];
    }
    if(![tmp containsObject:object]){
        [tmp addObject:MakeWeakReference(object)];
    }
    [self setObject:tmp forKey:key];
}

- (void)clear{
    for(NSString* key in self.allKeys){
        NSMutableArray* objs = self[key];
        NSMutableArray* unusedObjs = [[NSMutableArray alloc] init];
        for(id obj in objs){
            UIView* view = WeakReferenceNonretainedObjectValue(obj);
            if(!view){
                [unusedObjs addObject:obj];
            }
        }
        [objs removeObjectsInArray:unusedObjs];
    }
}

- (void)set:(NSInteger)type{
    for(NSString* key in self.allKeys){
        SEL sel = NSSelectorFromString(key);
        Class klass = NSClassFromString(@"UIColor");
        if ( [klass respondsToSelector:sel] ){
            id (*typed_msgSend)(id, SEL) = (void *)objc_msgSend;
            UIColor* color = typed_msgSend(klass, sel);
            NSMutableArray* objs = self[key];
            NSMutableArray* unusedObjs = [[NSMutableArray alloc] init];
            for(id obj in objs){

                id  view = WeakReferenceNonretainedObjectValue(obj);
                if(view){
                    
                    if(type == 0){
                        [(UIView*)view setBackgroundColor:color];
                    }else if(type == 1){
                        [(UILabel*)view setTextColor:color];
                    }else if(type == 2){
                        UIButton* button = (UIButton*)view;
                        UIControlState state = button.state;
                        [button setTitleColor:color forState:state];
                    }else if(type == 3){
                        [(UINavigationBar*)view setBarTintColor:color];
                    }else {
                        
                    }
                }else {
                    [unusedObjs addObject:obj];
                }
            }
            [objs removeObjectsInArray:unusedObjs];
        }
    }
}
@end




@interface ThemeManager ()
@property (nonatomic,strong) dispatch_queue_t      themeQueue;
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

        self.themeBgObjectDic = [[NSMutableDictionary alloc] init];
        self.themeTextObjectDic = [[NSMutableDictionary alloc] init];
        self.themeTintObjectDic = [[NSMutableDictionary alloc] init];
        self.themeButtonTextObjectDic = [[NSMutableDictionary alloc] init];
        
        self.themeQueue = dispatch_queue_create([@"com.theme.queue" UTF8String], nil);
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changed) name:@"THEME" object:nil];
    }
    return self;
}

- (void)log{
    dispatch_async(self.themeQueue, ^{
        NSLog(@"text---%@",self.themeTextObjectDic);
        NSLog(@"bg----%@",self.themeBgObjectDic);
        NSLog(@"button----%@",self.themeButtonTextObjectDic);
        NSLog(@"navBar----%@",self.themeTintObjectDic);
    });
}

- (void)clear{
    
    dispatch_async(self.themeQueue, ^{
        [self.themeBgObjectDic clear];
        [self.themeButtonTextObjectDic clear];
        [self.themeTextObjectDic clear];
        [self.themeTintObjectDic clear];
    });
}

- (void)changed{

    [self.themeBgObjectDic set:0];
    [self.themeTextObjectDic set:1];
    [self.themeButtonTextObjectDic set:2];
    [self.themeTintObjectDic set:3];
}
@end
