//
//  UIView+SetGet.h
//  myApp
//
//  Created by forever on 2018/4/26.
//  Copyright © 2018年 forever. All rights reserved.
//

#import <UIKit/UIKit.h>
//类别不能直接添加属性，除非手动添加setter／getter方法或者引入runtime关联对象
@interface UIView (SetGet)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@end
