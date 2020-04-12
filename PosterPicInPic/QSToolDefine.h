//
//  QSToolDefine.h
//  QuitSmoking
//
//  Created by zw on 2019/7/8.
//  Copyright © 2019 zw. All rights reserved.
//

#ifndef QSToolDefine_h
#define QSToolDefine_h


// 颜色
#define kRGB(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0f]
#define kRGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]

// 十六进制颜色
#define COLOR_WITH_HEX(hexValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0 green:((float)((hexValue & 0xFF00) >> 8)) / 255.0 blue:((float)(hexValue & 0xFF)) / 255.0 alpha:1.0f]
#define COLOR_WITH_HEX_A( rgbValue, a )                    [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha: a ]

// 白色
#define kColorWhite  COLOR_WITH_HEX(0xffffff)

// 清空颜色
#define kColorClear     [UIColor clearColor]

//NSLog详细
#ifdef DEBUG // 调试状态, 打开LOG功能
#define NSLog(FORMAT, ...)                              fprintf(stderr,"\n File:%s__Line:%d__Msg:%s\n\n", [[[NSString stringWithUTF8String:__PRETTY_FUNCTION__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

#else // 发布状态, LOG功能正常
#define NSLog(...) NSLog(__VA_ARGS__)
#endif

//判断是不是发布环境
#ifdef DEBUG
#define isProduct FALSE
#else
#define isProduct TRUE
#endif

//屏幕尺寸基础宏定义
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

//判断是否为iPhone
#define Is_Iphone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
//判断是否为iPhone X 系列
#define Is_Iphone_more \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})

//返回按钮高度取值
#define BACK_BAR_HEIGHT (Is_Iphone_more ? 34.f : 20.f)
//状态栏高度
#define STATUS_BAR_HEIGHT (Is_Iphone_more ? 44.f : 20.f)
#define HairCurtains_HEIGHT (Is_Iphone_more ? 34.f : 0.f)
//导航栏高度+状态栏高度
#define NAVIGATION_BAR_HEIGHT (Is_Iphone_more ? 88.f : 64.f)
//tabBar高度
#define TAB_BAR_HEIGHT (Is_Iphone_more ? (49.f+34.f) : 49.f)
//home indicator
#define HOME_INDICATOR_HEIGHT (Is_Iphone_more ? 34.f : 0.f)
#define ContentInsetAdjust_HEIGHT HEIGHT-NAVIGATION_BAR_HEIGHT-TAB_BAR_HEIGHT
// 状态栏高度大于20（热点被连接时）
#define STATUS_BAR_WIfi_BIGGER_THAN_20 (Is_Iphone_more ? NO :([UIApplication sharedApplication].statusBarFrame.size.height > 20))

//尺寸适配
#define Fit3XSizeW(n) ((n)*(WIDTH/375.0))
#define Fit3XSizeH(n) ((n)*((HEIGHT-STATUS_BAR_HEIGHT-HOME_INDICATOR_HEIGHT)/647.0))
//尺寸适配-百分比
#define FitWidthPercent(n)   WIDTH*n*0.01
#define FitHeightPercent(n)   HEIGHT*n*0.01

//字体适配
#define kAutoValueByPX(a)  ( ( a ) * WIDTH / 375.0f )
#define kFontSize(size)    [UIFont systemFontOfSize: size]
#define kBoldFontSize(size)   [UIFont boldSystemFontOfSize:size]
#define kFontSizeByPX(size)   [UIFont systemFontOfSize: kAutoValueByPX(size)]
#define kBoldFontSizeByPX(size) [UIFont boldSystemFontOfSize:kAutoValueByPX(size)]
#define kCustomFontWithSize(n)  [UIFont fontWithName:@"PingFang-SC-Regular" size:n]
#define kCustomFontWithSizeByPX(n)  [UIFont fontWithName:@"PingFang-SC-Regular" size:kAutoValueByPX(n)]
#define kCustomBoldFontWithSizeByPX(n)  [UIFont fontWithName:@"PingFang-SC-Medium" size:kAutoValueByPX(n)]
#define kSemiboldFontWithSizeByPX(n)  [UIFont fontWithName:@"PingFang-SC-Semibold" size:kAutoValueByPX(n)]
#define kSpecialFontWithSizeByPX(name,n)  [UIFont fontWithName:name size:kAutoValueByPX(n)]

//弱引用
#define kWeakSelf(kSelf)   __weak typeof(self)kSelf = self

//NSUserDefaults本地存储
#define kUserDefault                                    [NSUserDefaults standardUserDefaults]
#define kUserDefaultSynchronize                         [[NSUserDefaults standardUserDefaults] synchronize]

//判断BLOCK是否可用
#define kBlockExec(block,...)                           if(block){block(__VA_ARGS__);}


//空字符串处理
#define kNoNullStr(str)  str.length>0?str:@""

//image快速宏定义
#define kImage(name)   [UIImage imageNamed:name]

//weburl快速宏定义
#define kWebURLStr(str)  [NSString stringWithFormat:@"%@%@",QSRequestTopOriginal,str]

//判断当前系统版本
#define CurrentDeviceVersion [[UIDevice currentDevice].systemVersion floatValue]


//NSNumber转换成NSString
#define STRING_Int(number)  [NSString stringWithFormat:@"%@",([NSNumber numberWithInt:number])]
#define STRING_Integer(Integer)  [NSString stringWithFormat:@"%@",([NSNumber numberWithInteger:Integer])]
#define STRING_UInteger(UInteger)  [NSString stringWithFormat:@"%@",([NSNumber numberWithUnsignedInteger:UInteger])]
#define STRING_Float(number)  [NSString stringWithFormat:@"%@",([NSNumber numberWithFloat:number])]
#define STRING_Double(number)  [NSString stringWithFormat:@"%@",([NSNumber numberWithDouble:number])]
//判断横竖屏
#define IsPortrait ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortrait || [[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortraitUpsideDown)

//localString
#define kYBLocalizedString(key) NSLocalizedStringFromTable(key, @"YBLocalString", nil)

//后台code正确值
#define kQSTrueCode @"10000"

#endif /* QSToolDefine_h */
