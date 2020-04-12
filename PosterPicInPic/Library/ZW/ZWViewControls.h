//
//  ZWViewControls.h
//  TaiKangDoctor
//
//  Created by zw on 2019/5/13.
//  Copyright © 2019 zw. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZWViewControls : NSObject
///给UILabel设置行间距和字间距等属性，获取高度
+(CGFloat)getLabelHeightWithAttributesWithLabel:(UILabel*)label withText:(NSString*)text withFont:(UIFont*)font withParaAlign:(NSTextAlignment)align withLineSpacing:(CGFloat)lineSpacing withWidth:(CGFloat)width;
///判断是否包含中文
+ (BOOL)containChinese:(NSString *)str;
///给UILabel设置行间距和字间距等属性,获取宽度
+(CGFloat)getLabelWidthWithAttributesWithLabel:(UILabel*)label withText:(NSString*)text withFont:(UIFont*)font withParaAlign:(NSTextAlignment)align withLineSpacing:(CGFloat)lineSpacing withHeight:(CGFloat)height;
/// 创建Label
+(UILabel *)labelCreateWithFrame:(CGRect)frame Font:(CGFloat)font IsBold:(BOOL)isBold  Text:(NSString *)text Color:(UIColor *__nullable)color Direction:(NSTextAlignment)direction;
/// 创建imageView
+(UIImageView *)imageViewCreateViewWithFrame:(CGRect)frame ImageName:(NSString*__nullable)imageName;
/// 创建button
+(UIButton*)buttonCreateWithFrame:(CGRect)frame Title:(NSString* __nullable)title Font:(CGFloat)font IsBold:(BOOL)isBold TitleColor:(UIColor *__nullable)titleColor TitleSelectColor:(UIColor *__nullable)titleSelectColor ImageName:(NSString*__nullable)imageName Target:(id)target Action:(SEL)action;
/// 创建UITextField
+(UITextField *)textFieldCreateTextFieldWithFrame:(CGRect)frame placeholder:(NSString*)placeholder passWord:(BOOL)YESorNO leftImageView:(UIImageView*__nullable)imageView rightImageView:(UIImageView*__nullable)rightImageView Font:(float)font backgroundImageName:(NSString*__nullable)imageName;
/// 创建UITextView
+(UITextView*)createTextViewWithFrame:(CGRect)frame placeholder:(NSString*)placeholder Font:(float)font;

@end

NS_ASSUME_NONNULL_END
