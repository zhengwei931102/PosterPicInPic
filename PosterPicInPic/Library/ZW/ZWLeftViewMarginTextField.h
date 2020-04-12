//
//  ZWLeftViewMarginTextField.h
//  QuitSmoking
//
//  Created by zw on 2019/10/17.
//  Copyright © 2019 zw. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZWLeftViewMarginTextField : UITextField
@property(nonatomic,assign)CGFloat leftViewMargin;
@property(nonatomic,assign)CGFloat topViewMargin;
@property(nonatomic,assign)CGFloat leftViewWidth;
@property(nonatomic,assign)CGFloat leftViewHeight;
@property(nonatomic,assign)CGFloat leftTextMargin;
@property(nonatomic,assign)CGFloat leftEditingMargin;

////leftView添加左边距
//- (CGRect)leftViewRectForBounds:(CGRect)bounds;
////text位置添加左边距
//- (CGRect)textRectForBounds:(CGRect)bounds;
////编辑位置添加左边距
//- (CGRect)editingRectForBounds:(CGRect)bounds;
@end

NS_ASSUME_NONNULL_END
