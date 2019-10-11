//
//  XHBasePresenter.h
//  XHDesign
//
//  Created by cnest on 2019/9/25.
//  Copyright © 2019 huan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XHBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol XHBasePresenterDelegate <NSObject>
///刷新UI
-(void)Presenter_RefreshUI;

@end

@protocol XHBasePresenterProtocol <NSObject>

@required

@optional

///初始化控制器配置
///如子类自己实现 必须继承父类 [super initPresenterConfig];
///可以配置一些 model Block回调
-(void)initPresenterConfig;

///获取Model名称  若不实现  则采取截取类名策略初始化
///截取策略:  Model
-(NSString*)getModelName;

@end



@interface XHBasePresenter<VCDelegate : id<XHBasePresenterDelegate>> : NSObject<XHBasePresenterProtocol>

///视图的回调代理
@property(weak,nonatomic,readonly)VCDelegate vcDelegate;

///Model
@property(strong,nonatomic,readonly)XHBaseModel *tModel;

@end

NS_ASSUME_NONNULL_END
