//
//  XHBaseModel.m
//  XHDesign
//
//  Created by cnest on 2019/9/25.
//  Copyright © 2019 huan. All rights reserved.
//

#import "XHBaseModel.h"

@interface XHBaseModel ()

@end

@implementation XHBaseModel


///注意 : Model 初始化Presenter 需要用到
//-(void)setPDelegate:(id<XHBaseModelDelegate>)pDelegate{
//    _pDelegate=pDelegate;
//}


-(void)dealloc{
    XHLowLog(@"dealloc");
}

@end
