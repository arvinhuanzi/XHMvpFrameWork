//
//  XHBaseVC.m
//  XHDesign
//
//  Created by cnest on 2019/9/25.
//  Copyright © 2019 huan. All rights reserved.
//

#import "XHBaseVC.h"
#import "XHBaseVC+VC.h"

#pragma GCC diagnostic ignored "-Wundeclared-selector"  //解除警告

@interface XHBaseVC ()<XHBasePresenterDelegate>

/// 内容视图
@property (nonatomic, weak) UIView *cView;

@end

@implementation XHBaseVC



- (void)viewDidLoad {
    [super viewDidLoad];
    //基础设置
    self.view.backgroundColor=[UIColor whiteColor];
    // 不允许 viewController 自动调整，我们自己布局；如果设置为YES，视图会自动下移 64 像素
    self.automaticallyAdjustsScrollViewInsets = NO;//因为当界面上只有tableview控件时，在iOS7以上，iOS11以下系统，坐标零点都是从导航栏开始
//    //创建内容视图
//    [self cView];
    //默认创建 返回导航按钮
//    [self addNavLeftBtn:nil image:@"back" highlightedImage:@"back" action:@selector(navBackBtnClick)];
    
    ///初始化
    [self initVCCofig];
    
    [self initSubView];
    
}


//内容视图
- (UIView *)cView {
    if (!_cView) {
        UIView *view =[self createCView];//该方法在 XHBaseVC+VC.h中
        _cView=view;
    }
    return _cView;
}

///创建左边导航按钮
-(void)addNavLeftBtn:(nullable NSString*)lStr image:(nullable NSString*)image highlightedImage:(nullable NSString*)highlightedImage action:(SEL)action{
    [self addNavLeftBtnl:lStr image:image highlightedImage:highlightedImage action:action];
}

///创建右边导航按钮
-(void)addNavRightBtn:(nullable NSString*)lStr image:(nullable NSString*)image highlightedImage:(nullable NSString*)highlightedImage action:(SEL)action{
    [self addNavRightBtnl:lStr image:image highlightedImage:highlightedImage action:action];
}


#pragma mark action  响应

//返回按钮点击
-(void)navBackBtnClick{
    //返回上一层
    if (self.navigationController.childViewControllers.count>1) {
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

#pragma mark XHBasePresenterDelegate
///刷新界面
- (void)Presenter_RefreshUI {
    [self refreshMainUI];
    
}

#pragma mark XHBaseVCProtocol

-(void)initVCCofig{
    [self initPresenter];
}

-(void)initSubView{}

-(void)refreshMainUI{}


#pragma mark other

///创建持有者
-(BOOL)initPresenter{
    if (_presenter)return YES;
    NSString *presenter=[self getPresenterStr];//该方法在 XHBaseVC+VC.h中
    //未获取到 则报错
//    NSAssert(presenter.length>0,@"str presenter is null");
    //创建持有者
    _presenter=[[NSClassFromString(presenter) alloc] init];
    //presenter 创建 如果创建失败 则采用默认的
    if (!_presenter) {
        _presenter=[[XHBasePresenter alloc] init];
        presenter=@"XHBasePresenter";
    }
    //设置代理
    //运行时机制设置代理
    if ([_presenter respondsToSelector:@selector(setVCDelegate:)]) {
        [_presenter performSelector:@selector(setVCDelegate:) withObject:self];
    }else{
       NSAssert(_presenter!=nil,@"presenter setDelegate 未实现...");
    }
    XHLowLog(@"vc=%@ presenter=%@ 持有者创建成功",NSStringFromClass([self class]),presenter);
    return YES;
}



//状态栏 设置
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
}


-(void)dealloc{
    XHLowLog(@"dealloc");
}

@end
