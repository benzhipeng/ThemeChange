//
//  AppDelegate.m
//  TestTheme
//
//  Created by ben zhipeng on 15/11/4.
//  Copyright © 2015年 ben zhipeng. All rights reserved.
//

#import "AppDelegate.h"
#import "UIColor+Custom.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

+ (UIColor *)colorwithHexString:(NSString *)hexStr alpha:(CGFloat)alpha;
{
    //-----------------------------------------
    // Convert hex string to an integer
    //-----------------------------------------
    unsigned int hexint = 0;
    
    // Create scanner
    NSScanner *scanner = [NSScanner scannerWithString:hexStr];
    
    // Tell scanner to skip the # character
    [scanner setCharactersToBeSkipped:[NSCharacterSet
                                       characterSetWithCharactersInString:@"#"]];
    [scanner scanHexInt:&hexint];
    
    //-----------------------------------------
    // Create color object, specifying alpha
    //-----------------------------------------
    UIColor *color =
    [UIColor colorWithRed:((CGFloat) ((hexint & 0xFF0000) >> 16))/255
                    green:((CGFloat) ((hexint & 0xFF00) >> 8))/255
                     blue:((CGFloat) (hexint & 0xFF))/255
                    alpha:alpha];
    
    return color;
}

- (void)test{
    

}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
//    [[UINavigationBar appearance] lt_setBackgroundColor:[UIColor color1]];
    [[UINavigationBar appearance] setBarTintColor:[UIColor color1]];
//    [[UINavigationBar appearance] setTranslucent:NO];
//    [[UINavigationBar appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor color2],
//                                                            NSFontAttributeName : [UIFont boldSystemFontOfSize:17]}];
//
//    CGRect frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64);
//    UIGraphicsBeginImageContextWithOptions(frame.size, false, 0);
//    [[[self class] colorwithHexString:@"FB3D4F" alpha:1] setFill];
//    UIRectFill(frame);
//    UIImage* navBackgroundImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    
//    [UINavigationBar appearance].layer.contents = (id)navBackgroundImage.CGImage;
//    [[UINavigationBar appearance] setBackgroundImage:[UIImage new]
//                                                  forBarMetrics:UIBarMetricsDefault]; //UIImageNamed:@"transparent.png"
//    [UINavigationBar appearance].shadowImage = [UIImage new];////UIImageNamed:@"transparent.png"
//    [UINavigationBar appearance].backgroundColor = [[self class] colorwithHexString:@"FB3D4F" alpha:1];
    
   // [[UINavigationBar appearance] lt_setBackgroundColor:[[self class] colorwithHexString:@"FB3D4F" alpha:1]];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
