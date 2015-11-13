//
//  TestViewController.m
//  TestTheme
//
//  Created by ben zhipeng on 15/11/5.
//  Copyright © 2015年 ben zhipeng. All rights reserved.
//

#import "TestViewController.h"
#import "UIColor+Custom.h"
#import "ThemeManager.h"
#import <objc/message.h>

@interface TestViewController ()
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UIView *testView;
@property (weak, nonatomic) IBOutlet UIButton *testButton;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    //设置标题
    self.textLabel.textColor = [UIColor color1];
    self.testView.backgroundColor = [UIColor color1];
    
//    self.testButton.titleLabel.textColor = [UIColor color1];
    [self.testButton setTitleColor:[UIColor color1] forState:UIControlStateNormal];
//
    self.title = @"消息";
}

- (void)dealloc{
    
 
}


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = [NSString stringWithFormat:@"%zd",indexPath.row];
    cell.textLabel.textColor = [UIColor color1];
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 30;
}

- (IBAction)changeColor:(id)sender {
    
    [ThemeManager sharedManager].status = ![ThemeManager sharedManager].status;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"THEME" object:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
