//
//  XHBaseVC+VC.m
//  XHDesign
//
//  Created by cnest on 2019/9/27.
//  Copyright © 2019 huan. All rights reserved.
//

#import "XHBaseVC+VC.h"
//#import <objc/runtime.h>

@interface XHBaseVC ()
@property (nonatomic, weak) UIButton *leftBtn;
@property (nonatomic, weak) UIButton *rightBtn;
@end

@implementation XHBaseVC (CView)

#pragma mark 导航栏

-(void)addNavLeftBtnl:(NSString*)lStr image:(NSString*)image highlightedImage:(NSString*)highlightedImage action:(SEL)action{
    
    UIButton *btn=[self createNavBtnWithTitle:lStr image:image highlightedImage:highlightedImage action:action];
    UIBarButtonItem *barBtn=[[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem=barBtn;
    self.leftBtn=btn;
    
}

-(void)addNavRightBtnl:(NSString*)lStr image:(NSString*)image highlightedImage:(NSString*)highlightedImage action:(SEL)action{
    
    UIButton *btn=[self createNavBtnWithTitle:lStr image:image highlightedImage:highlightedImage action:action];
    UIBarButtonItem *barBtn=[[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem=barBtn;
    self.rightBtn=btn;

}

///创建导航按钮
-(UIButton*)createNavBtnWithTitle:(NSString*)lStr image:(NSString*)image highlightedImage:(NSString*)highlightedImage action:(SEL)action{
    UIButton *btn=[[UIButton alloc]init];
    if (lStr.length>0) {
        [btn setTitle:lStr forState:(UIControlStateNormal)];
        [btn setTitle:lStr forState:(UIControlStateHighlighted)];
    }else if (image.length>0) {
        [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    }else if (highlightedImage.length>0) {
        [btn setBackgroundImage:[UIImage imageNamed:highlightedImage] forState:UIControlStateHighlighted];
    }
    //这只大小
    btn.frame=CGRectMake(0, 0, 40, 40);
    
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];

    return btn;
}

#pragma mark other

///获取持有者字符串
-(NSString*)getPresenterStr{
    NSString *presenter;
    ///尝试获取Presenter
    if (XHRespondsToSel(self, getPresenterName)) {
        presenter=[self getPresenterName];
    }
    //获取失败 尝试截取类字符串 初始化
    if (presenter.length<=0) {
        NSString * vcStr=NSStringFromClass([self class]);
        NSString *suffix=@"VC";
        if ([vcStr hasSuffix:suffix]) {//截断 VC
            presenter=[[vcStr componentsSeparatedByString:suffix] firstObject];
        }else{
            suffix=@"ViewController";
            if ([vcStr hasSuffix:suffix]){//截断 ViewController
                presenter=[[vcStr componentsSeparatedByString:suffix] firstObject];
            }
        }
        if (presenter.length>0)presenter=[presenter stringByAppendingString:@"Presenter"];
    }
    return presenter;
}


///创建内容视图
-(UIView*)createCView{
    UIView *view = [[UIView alloc]initWithFrame:self.view.bounds];
    view.backgroundColor = [UIColor clearColor];
    //是否需要滚动
    BOOL isNeedScroll=NO;
    if (XHRespondsToSel(self, isViewNeedScroll)) {
        isNeedScroll=[self isViewNeedScroll];
    }
    if (isNeedScroll) {//需要滚动
        UIScrollView *scorollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
        scorollView.showsVerticalScrollIndicator=NO;
        scorollView.showsHorizontalScrollIndicator=NO;
        scorollView.bounces=YES;
        //设置滚动范围 可自定义
        CGSize sSize=CGSizeZero;
        if (XHRespondsToSel(self, getScrollSize)) {
            sSize=[self getScrollSize];
        }
        scorollView.contentSize =sSize;
        [self.view insertSubview:scorollView atIndex:0];
        [scorollView addSubview:view];
    }else{
        [self.view insertSubview:view atIndex:0];
    }
    return view;
}

@end
