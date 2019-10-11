//
//  XHBaseVC+VC.h
//  XHDesign
//
//  Created by cnest on 2019/9/27.
//  Copyright © 2019 huan. All rights reserved.
//
#import "XHBaseVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface XHBaseVC (VC)


#pragma mark private method
-(void)addNavLeftBtnl:(NSString*)lStr image:(NSString*)image highlightedImage:(NSString*)highlightedImage action:(SEL)action;
-(void)addNavRightBtnl:(NSString*)lStr image:(NSString*)image highlightedImage:(NSString*)highlightedImage action:(SEL)action;
-(UIView*)createCView;
-(NSString*)getPresenterStr;

@end

NS_ASSUME_NONNULL_END
