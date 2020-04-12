//
//  ZWViewControls.m
//  TaiKangDoctor
//
//  Created by zw on 2019/5/13.
//  Copyright © 2019 zw. All rights reserved.
//

#import "ZWViewControls.h"

@implementation ZWViewControls
#pragma mark 给UILabel设置行间距和字间距等属性，获取高度
+(CGFloat)getLabelHeightWithAttributesWithLabel:(UILabel*)label withText:(NSString*)text withFont:(UIFont*)font withParaAlign:(NSTextAlignment)align withLineSpacing:(CGFloat)lineSpacing withWidth:(CGFloat)width{
    text = kNoNullStr(text);
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = align;
    paraStyle.lineSpacing = lineSpacing; //设置行间距
    //设置字间距 NSKernAttributeName:@1.5f
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@0.f};
    
    NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:text attributes:dic];
    label.attributedText = attributeStr;
    CGRect rect = [attributeStr boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    //文本的高度减去字体高度小于等于行间距，判断为当前只有1行
    if ((rect.size.height - font.lineHeight) <= paraStyle.lineSpacing) {
        if ([self containChinese:text]) {  //如果包含中文
            rect = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height-paraStyle.lineSpacing);
        }
    }
    return rect.size.height;
}
#pragma mark判断是否包含中文
+ (BOOL)containChinese:(NSString *)str {
    for(int i=0; i< [str length];i++){
        int a = [str characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff){
            return YES;
        }
    }
    return NO;
}
#pragma mark 给UILabel设置行间距和字间距等属性，获取宽度
+(CGFloat)getLabelWidthWithAttributesWithLabel:(UILabel*)label withText:(NSString*)text withFont:(UIFont*)font withParaAlign:(NSTextAlignment)align withLineSpacing:(CGFloat)lineSpacing withHeight:(CGFloat)height{
    text = kNoNullStr(text);
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = align;
    paraStyle.lineSpacing = lineSpacing; //设置行间距
    //设置字间距 NSKernAttributeName:@1.5f
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@0.f};
    
    NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:text attributes:dic];
    label.attributedText = attributeStr;
    CGRect rect = [attributeStr boundingRectWithSize:CGSizeMake(MAXFLOAT, height) options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    //文本的高度减去字体高度小于等于行间距，判断为当前只有1行
    if ((rect.size.height - font.lineHeight) <= paraStyle.lineSpacing) {
        if ([self containChinese:text]) {  //如果包含中文
            rect = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height-paraStyle.lineSpacing);
        }
    }
    return rect.size.width;
}

#pragma mark - 创建Label
+(UILabel *)labelCreateWithFrame:(CGRect)frame Font:(CGFloat)font IsBold:(BOOL)isBold  Text:(NSString *)text Color:(UIColor *__nullable)color Direction:(NSTextAlignment)direction{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.numberOfLines = 0;  //限制行数
    label.textAlignment = direction;  //对齐方式
    label.backgroundColor = [UIColor clearColor];   //设置背景颜色
    if (isBold){
        label.font = kCustomBoldFontWithSizeByPX(font);  //设置label字体
    }else{
        label.font = kCustomFontWithSizeByPX(font); //设置label字体
    }
    label.lineBreakMode = NSLineBreakByTruncatingTail;  //单词折行
    label.textColor = color;   //设置字体颜色
    //    label.adjustsFontSizeToFitWidth = YES;    //自适应（文字多的时候,字体会减小)
    if (label){
        label.text = text;    //设置文字
    }
    return label;
    
}
#pragma mark -- 创建imageView
+(UIImageView *)imageViewCreateViewWithFrame:(CGRect)frame ImageName:(NSString*__nullable)imageName{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    if(imageName.length>0){
        imageView.image = [UIImage imageNamed:imageName];
    }
    imageView.userInteractionEnabled = YES;
    return imageView;
}
#pragma mark --创建button
+(UIButton*)buttonCreateWithFrame:(CGRect)frame Title:(NSString* __nullable)title Font:(CGFloat)font IsBold:(BOOL)isBold TitleColor:(UIColor *__nullable)titleColor TitleSelectColor:(UIColor *__nullable)titleSelectColor ImageName:(NSString* __nullable)imageName Target:(id)target Action:(SEL)action{
    //创建button,同时设置他的frame
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.adjustsImageWhenHighlighted = NO;
    button.frame=frame;
    if (title){
        [button setTitle:title forState:UIControlStateNormal];  //设置button的标题
    }
    if (isBold){
        button.titleLabel.font = kCustomBoldFontWithSizeByPX(font);
    }else{
        button.titleLabel.font = kCustomFontWithSizeByPX(font);  //设置button字体
    }
    
    //    有些时候我们想让UIButton的title居左对齐，我们设置
    //    button.textLabel.textAlignment = UITextAlignmentLeft;
    
    //设置按钮上面字体的颜色
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button setTitleColor:titleSelectColor forState:UIControlStateSelected];
    //    button.adjustsImageWhenHighlighted = NO;//按钮按下的时候系统要不要渲染
    //    button.adjustsImageWhenDisabled = NO;   //按钮不能够使用的时候系统要不要渲染
    button.showsTouchWhenHighlighted = NO;  //按钮按下的时候要不要发光
    //设置里面的内容居中
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    button.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    //设置背景图片，可以使文字与图片共存
    if (imageName.length>0){
        //图片与文字如果需要同时存在，就需要图片足够小 详见人人项目按钮设置
        [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}
#pragma mark --创建UITextField
+(UITextField *)textFieldCreateTextFieldWithFrame:(CGRect)frame placeholder:(NSString*)placeholder passWord:(BOOL)YESorNO leftImageView:(UIImageView*__nullable)imageView rightImageView:(UIImageView*__nullable)rightImageView Font:(float)font backgroundImageName:(NSString*__nullable)imageName{
    UITextField*text= [self createTextFieldWithFrame:frame placeholder:placeholder passWord:YESorNO leftImageView:imageView rightImageView:rightImageView Font:font];
    NSMutableAttributedString *placeholderString = [[NSMutableAttributedString alloc] initWithString:placeholder attributes:@{NSForegroundColorAttributeName : COLOR_WITH_HEX(0xBEBEBE)}];
    text.attributedPlaceholder = placeholderString;
    text.tintColor = COLOR_WITH_HEX(0x54BF76);
    if (imageName.length==0) {
        text.backgroundColor = kRGB(255, 255, 255);
    } else {
        text.background=[UIImage imageNamed:imageName];
    }
    return  text;
}
+(UITextField*)createTextFieldWithFrame:(CGRect)frame placeholder:(NSString*)placeholder passWord:(BOOL)YESorNO leftImageView:(UIImageView*)imageView rightImageView:(UIImageView*)rightImageView Font:(float)font{
    UITextField*textField;
    if(imageView){
        textField=[[ZWLeftViewMarginTextField alloc]initWithFrame:frame];
    }else{
        textField=[[UITextField alloc]initWithFrame:frame];
    }
    
    //灰色提示框
    textField.placeholder=placeholder;
    //文字对齐方式
    textField.textAlignment=NSTextAlignmentJustified;
    textField.secureTextEntry=YESorNO;
    textField.returnKeyType = UIReturnKeyDone;
    //边框
    //textField.borderStyle=UITextBorderStyleLine;
    //键盘类型
    textField.keyboardType=UIKeyboardTypeDefault;
    //关闭首字母大写
    textField.autocapitalizationType=NO;
    //清除按钮
    textField.clearButtonMode=YES;
    //左图片
    textField.leftView=imageView;
    textField.leftViewMode=UITextFieldViewModeAlways;
    //右图片
    textField.rightView=rightImageView;
    //编辑状态下一直存在
    textField.rightViewMode=UITextFieldViewModeAlways;
    //自定义键盘
    //textField.inputView
    //字体
    textField.font= kCustomFontWithSizeByPX(font);
    //字体颜色
    textField.textColor=COLOR_WITH_HEX(0x343434);
    return textField;
    
}
+(UITextView*)createTextViewWithFrame:(CGRect)frame placeholder:(NSString*)placeholder Font:(float)font{
    UITextView* textView = [[UITextView alloc] initWithFrame:frame];
    textView.backgroundColor = [UIColor whiteColor];
    //字体
    textView.font = kCustomFontWithSizeByPX(font);
    //对齐
    textView.textAlignment = NSTextAlignmentJustified;
    //字体颜色
    textView.textColor = COLOR_WITH_HEX(0x343434);
    //允许编辑
    textView.editable = YES;
    //用户交互
    textView.userInteractionEnabled = YES;
    //自定义键盘
    //textView.inputView = view;//自定义输入区域
    //textView.inputAccessoryView = view;//键盘上加view
    textView.scrollEnabled = YES;//滑动
    textView.showsVerticalScrollIndicator = NO;
    textView.returnKeyType = UIReturnKeyDefault;//返回键类型
    textView.keyboardType = UIKeyboardTypeDefault;//键盘类型
    textView.autoresizingMask = UIViewAutoresizingFlexibleHeight;//自适应
    textView.dataDetectorTypes = UIDataDetectorTypeAll;//数据类型连接模式
    textView.autocorrectionType = UITextAutocorrectionTypeNo;//自动纠错方式
    textView.autocapitalizationType = UITextAutocapitalizationTypeNone;//自动大写方式
    return textView;
}

@end


