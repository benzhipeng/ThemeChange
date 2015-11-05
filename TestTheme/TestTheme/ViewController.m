//
//  ViewController.m
//  TestTheme
//
//  Created by ben zhipeng on 15/11/4.
//  Copyright © 2015年 ben zhipeng. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+Theme.h"
#import "ThemeManager.h"
#import <objc/message.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    [self.navigationController navigationBar].barTintColor = [UIColor color1];
    [[self.navigationController navigationBar] setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor color2],
                                                                         NSFontAttributeName : [UIFont boldSystemFontOfSize:17]}];
    //设置标题
    self.title = @"消息";
}


- (IBAction)changeColor:(id)sender {
    
    [ThemeManager sharedManager].status = ![ThemeManager sharedManager].status;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
