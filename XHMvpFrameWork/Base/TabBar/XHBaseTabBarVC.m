//
//  XHBaseTabBarVC.m
//  XHDesign
//
//  Created by cnest on 2019/9/29.
//  Copyright © 2019 huan. All rights reserved.
//

#import "XHBaseTabBarVC.h"

@interface XHBaseTabBarVC ()

/** 标题数组 */
@property (strong, nonatomic) NSArray *titleArray;

/** 控制器数组 */
@property (strong, nonatomic) NSArray *controllerArray;


@end

@implementation XHBaseTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加控制器
    [self addControllers];
}


- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    
    XHLowLog(@"tabBar 点击....");
}


#pragma mark- 添加控制器
- (void)addControllers{
    for (int i = 0; i < self.titleArray.count; i ++) {
        Class class = NSClassFromString(self.controllerArray[i]);
        UIViewController *VC = [[class alloc] init];
        VC.title = self.titleArray[i];
        [VC.tabBarItem setTitle:self.titleArray[i]];
        VC.tabBarItem.tag = i;
        
        [VC.tabBarItem setImage:[[UIImage imageNamed:@"tabbar0_n"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [VC.tabBarItem setSelectedImage:[[UIImage imageNamed:@"tabbar0_s"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        UINavigationController *NaVC = [[UINavigationController alloc] initWithRootViewController:VC];
        [self addChildViewController:NaVC];
    }
    
    // 设置tabBarItem标题的选中字体颜色和图片的选中渲染色（图片渲染色必须在添加图片时没有设置图片的imageWithRenderingMode才有效）
    self.tabBar.translucent = NO;
    
}

#pragma mark- 懒加载

//MARK: 控制器数组controllerArray
- (NSArray *)controllerArray {
    if (!_controllerArray) {
        _controllerArray = @[@"TestViewController", @"TestTableViewController", @"TestArrowheadMenuSelectedStateViewController", @"TestViewController"];
    }
    
    return _controllerArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
