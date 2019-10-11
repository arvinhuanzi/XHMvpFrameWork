//
//  XHBasePresenter.m
//  XHDesign
//
//  Created by cnest on 2019/9/25.
//  Copyright © 2019 huan. All rights reserved.
//

#import "XHBasePresenter.h"

@interface XHBasePresenter()


@end

@implementation XHBasePresenter

///注意 : VC 初始化Presenter 需要用到
-(void)setVCDelegate:(id<XHBasePresenterDelegate>)vcDelegate{
    _vcDelegate=vcDelegate;
    ///开始配置
    [self initPresenterConfig];
}

-(void)dealloc{
    XHLowLog(@"dealloc");
}

#pragma mark XHBasePresenterProtocol

-(void)initPresenterConfig{
    ///初始化model
    [self initModel];
    
    
    
}


#pragma mark other
///创建模型
-(void)initModel{
    if (_tModel)return;
    NSString *model=[self getModelStr];
    //未获取到 则报错
//    NSAssert(model.length>0,@"str (model) is null");
    //创建持有者
    _tModel=[[NSClassFromString(model) alloc] init];
    //model 创建 如果创建失败 则采用默认的
    if (!_tModel) {
        _tModel=[[XHBaseModel alloc] init];
        model=@"XHBaseModel";
    }
    //model层 一般用block模式回调数据
//    //设置代理
//#pragma GCC diagnostic ignored "-Wundeclared-selector"
//    if ([_tModel respondsToSelector:@selector(setPDelegate:)]) {
//        [_tModel performSelector:@selector(setPDelegate:) withObject:self];
//    }else{
//        NSAssert(_tModel!=nil,@"model setDelegate 未实现...");
//    }
#ifdef DEBUG
    NSLog(@"presenter=%@ model=%@ model创建成功",NSStringFromClass([self class]),model);
#endif
}

-(NSString*)getModelStr{
    NSString *model;
    ///尝试获取Presenter
    if ([self respondsToSelector:@selector(getModelName)]) {
        model=[self getModelName];
    }
    //获取失败 尝试截取类字符串 初始化
    if (model.length<=0) {
        NSString * vcStr=NSStringFromClass([self class]);
        NSString *suffix=@"Presenter";
        if ([vcStr hasSuffix:suffix]) {
            model=[[vcStr componentsSeparatedByString:suffix] firstObject];
        }
        if (model.length>0) {
            model=[model stringByAppendingString:@"Model"];
        }
    }
    return model;
}


@end
