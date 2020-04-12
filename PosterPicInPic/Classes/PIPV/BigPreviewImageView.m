//
//  BigPreviewImageView.m
//  PosterPicInPic
//
//  Created by zw on 2020/4/9.
//  Copyright © 2020 zw. All rights reserved.
//

#import "BigPreviewImageView.h"

@implementation BigPreviewImageView
-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    
    UIView *hitView = [super hitTest:point withEvent:event];
    return hitView;
}

@end
