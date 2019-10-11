//
//  XHBaseVC.h
//  XHDesign
//
//  Created by cnest on 2019/9/25.
//  Copyright © 2019 huan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XHBasePresenter.h"

NS_ASSUME_NONNULL_BEGIN

@protocol XHBaseVCProtocol <NSObject>

@required
///初始化子视图
///添加视图 用cView添加
-(void)initSubView;

@optional

///初始化控制器配置
///如子类自己实现 必须继承父类 [super initVCCofig];
///可以配置一些 Presenter Block回调
-(void)initVCCofig;

///获取持有者名称  若不实现  则采取截取类名策略初始化
///截取策略:  VC  或   ViewController
-(NSString*)getPresenterName;

///刷新界面UI
-(void)refreshMainUI;

///左侧导航按钮触发
-(void)navBackBtnClick;

#pragma mark 滚动Scroll ==========
///当前视图是否需要滚动 cView
-(BOOL)isViewNeedScroll;
///获取滚动范围
-(CGSize)getScrollSize;


#pragma mark 加载视图 ==========
//显示、隐藏加载视图
-(void)showLoadingView;

/// 自动隐藏
/// @param hideTime 延迟时间
-(void)showAutoHideLoadingView:(int)hideTime;

-(void)hideLoadingView;
//显示、隐藏无数据视图
-(void)showNoDataView;
-(void)hideNoDataView;

@end


#pragma mark XHBaseVC -----------------------------------------------------------------------

@interface XHBaseVC<TPresenter:XHBasePresenter*> : UIViewController<XHBaseVCProtocol>

///持有者
@property (nonatomic,strong,readonly) TPresenter presenter;

/// 内容视图
@property (nonatomic, weak,readonly) UIView *cView;

//导航栏左右按钮
@property (nonatomic, weak,readonly) UIButton *leftBtn;
@property (nonatomic, weak,readonly) UIButton *rightBtn;//创建了才存在


#pragma mark method

///创建左边导航按钮
-(void)addNavLeftBtn:(nullable NSString*)lStr image:(nullable NSString*)image highlightedImage:(nullable NSString*)highlightedImage action:(SEL)action;

///创建右边导航按钮
-(void)addNavRightBtn:(nullable NSString*)lStr image:(nullable NSString*)image highlightedImage:(nullable NSString*)highlightedImage action:(SEL)action;

@end

NS_ASSUME_NONNULL_END
