//
//  UIView+XHTools.m
//  XHDesign
//
//  Created by cnest on 2019/9/29.
//  Copyright © 2019 huan. All rights reserved.
//
#import "UIView+XHTools.h"

@implementation UIView (XHTools)

-(CGFloat)xh_top{
    return self.frame.origin.y;
}

-(void)setXh_top:(CGFloat)xh_top{
    CGRect frame = self.frame;
    frame.origin.y = xh_top;
    self.frame = frame;
}

-(CGFloat)xh_bottom{
    return self.frame.origin.y + self.frame.size.height;
}

-(void)setXh_bottom:(CGFloat)xh_bottom{
    CGRect frame = self.frame;
    frame.origin.y = xh_bottom - frame.size.height;
    self.frame = frame;
}

-(CGFloat)xh_left{
    return self.frame.origin.x;
}

-(void)setXh_left:(CGFloat)xh_left{
    CGRect frame = self.frame;
    frame.origin.x = xh_left;
    self.frame = frame;
}


-(CGFloat)xh_right{
    return self.frame.origin.x + self.frame.size.width;
}

-(void)setXh_right:(CGFloat)xh_right{
    CGRect frame = self.frame;
    frame.origin.x = xh_right - frame.size.width;
    self.frame = frame;
}

-(CGFloat)xh_width{
    return self.frame.size.width;
}

-(void)setXh_width:(CGFloat)xh_width{
    CGRect frame = self.frame;
    frame.size.width = xh_width;
    self.frame = frame;
}

-(CGFloat)xh_height{
    return self.frame.size.height;
}

-(void)setXh_height:(CGFloat)xh_height{
    CGRect frame = self.frame;
    frame.size.height = xh_height;
    self.frame = frame;
}



@end
