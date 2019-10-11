//
//  XHMacro.h
//  XHDesign
//
//  Created by cnest on 2019/9/25.
//  Copyright © 2019 huan. All rights reserved.
//

#ifndef XHMacro_h
#define XHMacro_h

#ifdef __OBJC__

#pragma mark 属性----------------------------------------------------------------------------------------------------
//状态栏高度
#define XHStausBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
//屏幕 宽、高
#define XHScreenWidth [UIScreen mainScreen].bounds.size.width
#define XHScreenHeight [UIScreen mainScreen].bounds.size.height
//判断是否为iphoneX
#define XHIsIphoneX ((SCREEN_HEIGHT == 812.0f||SCREEN_HEIGHT == 896.0f)?YES:NO)
//导航栏高度
#define XHNavBarHeight XHIsIphoneX?68.0:44.0
//导航栏高度 包含状态栏
#define XHNavH (XHStausBarHeight + XHNavBarHeight)
//Tabbar高度
#define XHTabH ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)

//计算比例 就算没用到 像素最好使用函数包含 之后需要改变可以统一
#define X(x) (x)
#define Y(y) (y)

//字符串本地化
#define XHLanguage(strKey) NSLocalizedString(strKey, nil)

#pragma mark 回到主线程执行代码 ----------------------------------------------------------------------------------------------------
#define XHMainThreadRun(action)  if ([[NSThread currentThread] isMainThread]) {\
    action;\
}else{\
    dispatch_async(dispatch_get_main_queue(), ^{\
        action;\
    });\
}

#pragma mark 通知----------------------------------------------------------------------------------------------------

//语言无缝切换
#define XHNotiLocalLanguageName @"XHNotiLocalLanguageName"

#define XHNotiDefaultCenter [NSNotificationCenter defaultCenter]
#define XHNotification(name,obj) [XHNotiDefaultCenter postNotificationName:name object:obj]


#pragma mark 颜色----------------------------------------------------------------------------------------------------
//随机色
#define XHColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

#define XHAColor(r, g, b ,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]

#define XHRandColor XHColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))

#pragma mark 日志输出----------------------------------------------------------------------------------------------------

#ifdef DEBUG

#define XHLog(fmt,...) NSLog((@"XH🔴 %s line=%d desc: " fmt),__PRETTY_FUNCTION__,__LINE__,##__VA_ARGS__)

#define XHLowLog(...) XHLog(__VA_ARGS__)

#define XHHighLog(...) XHLog(__VA_ARGS__)

#else

#define XHLog(...)

#endif

#pragma mark 其它----------------------------------------------------------------------------------------------------
//方法实现判断
#define XHRespondsToSel(obj,method) [obj respondsToSelector:@selector(method)]

//强弱引用 block回调下需要用到
#define XHWeak __weak typeof(self) weakSelf=self;
#define XHStrong __strong typeof(weakSelf) self=weakSelf;

#pragma mark 导入工具类----------------------------------------------------------------------------------------------------
#import "UIView+XHTools.h"

#endif

#endif /* XHMacro_h */
