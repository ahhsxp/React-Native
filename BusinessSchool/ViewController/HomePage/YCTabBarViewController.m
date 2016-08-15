//
//  YCTabBarViewController.m
//  YCEaseMob
//
//  Created by 袁灿 on 15/10/30.
//  Copyright © 2015年 yuancan. All rights reserved.
//

#import "YCTabBarViewController.h"




#import "BSHomeViewController.h"
#import "BSMessageViewController.h"
#import "BSContectViewController.h"
#import "BSMineViewController.h"

@interface YCTabBarViewController ()

@end

@implementation YCTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES; //隐藏系统的返回按钮
    
    BSHomeViewController *home = [[BSHomeViewController alloc] init];
    home.tabBarItem.title = @"首页";
    home.tabBarItem.image = [UIImage imageNamed:@"tabbar_home"];
    home.tabBarItem.tag = 0;
    UINavigationController *navigation1 = [[UINavigationController alloc] initWithRootViewController:home];
    
    
    
    
    BSMessageViewController *message = [[BSMessageViewController alloc] init];
    message.tabBarItem.title = @"消息";
    message.tabBarItem.image = [UIImage imageNamed:@"消息[选中]"];
    message.tabBarItem.tag = 1;
   UINavigationController *navigation2 = [[UINavigationController alloc] initWithRootViewController:message];
    
    BSContectViewController *contect = [[BSContectViewController alloc] init];
    contect.tabBarItem.title = @"通讯录";
    contect.tabBarItem.image = [UIImage imageNamed:@"tabbar_compose_background_icon_add"];
    contect.tabBarItem.tag =2;
    UINavigationController *navigation3 = [[UINavigationController alloc] initWithRootViewController:contect];
    
    BSMineViewController *mine = [[BSMineViewController alloc] init];
    mine.tabBarItem.title = @"我的";
    mine.tabBarItem.image = [UIImage imageNamed:@"tabbar_Cart"];
    mine.tabBarItem.tag = 3;
    UINavigationController *navigation4 = [[UINavigationController alloc] initWithRootViewController:mine];
    
    self.viewControllers = @[navigation1,navigation2,navigation3,navigation4];
}


#pragma mark - UITabBarDelegate

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    if (item.tag == 0) {
        self.title = @"首页";
        self.navigationItem.rightBarButtonItem = nil;
    }else if (item.tag == 1){
        self.title = @"消息";
        self.navigationItem.rightBarButtonItem = nil;
    }else if (item.tag == 2){
        self.title = @"通讯录";
        self.navigationItem.rightBarButtonItem = nil;
    }else if (item.tag == 3){
        self.title = @"我的";
        self.navigationItem.rightBarButtonItem = nil;
    }
}


#pragma mark - Private Menthods

@end
