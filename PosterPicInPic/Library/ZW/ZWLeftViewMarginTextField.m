//
//  ZWLeftViewMarginTextField.m
//  QuitSmoking
//
//  Created by zw on 2019/10/17.
//  Copyright © 2019 zw. All rights reserved.
//

#import "ZWLeftViewMarginTextField.h"

@implementation ZWLeftViewMarginTextField
//leftView添加左边距
- (CGRect)leftViewRectForBounds:(CGRect)bounds{
    CGRect textRect = [super leftViewRectForBounds:bounds];
    textRect.origin.x += self.leftViewMargin;
    textRect.origin.y = self.topViewMargin;
    textRect.size.width = self.leftViewWidth;
    textRect.size.height = self.leftViewHeight;
    return textRect;
}

//text位置添加左边距
- (CGRect)textRectForBounds:(CGRect)bounds {
    CGRect rect = [super textRectForBounds:bounds];
    int margin = self.leftTextMargin;
    CGRect inset = CGRectMake(rect.origin.x + margin, rect.origin.y, rect.size.width - margin, rect.size.height);
    return inset;
}

//编辑位置添加左边距
- (CGRect)editingRectForBounds:(CGRect)bounds {
    CGRect rect = [super editingRectForBounds:bounds];
    int margin = self.leftEditingMargin;
    CGRect inset = CGRectMake(rect.origin.x + margin, rect.origin.y, rect.size.width - margin, rect.size.height);
    return inset;
}

@end
