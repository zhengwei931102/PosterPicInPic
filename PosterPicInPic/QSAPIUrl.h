//
//  QSAPIUrl.h
//  QuitSmoking
//
//  Created by zw on 2019/7/8.
//  Copyright © 2019 zw. All rights reserved.
//

#ifndef QSAPIUrl_h
#define QSAPIUrl_h

//正式
//#define QSDom  @"http://139.224.221.3:8080"
//东软
#define QSDom  @"http://139.224.221.3:80"
//测试
//#define QSDom  @"http://192.168.43.183:8080"
//#define QSDom  @"http://192.168.137.67:8080"
//#define QSDom  @"http://192.168.1.106:8080"
//#define QSDom  @"http://172.20.10.2:8080"

#define PrjName  @"cas"
#define QSRequestTopOriginal  [NSString stringWithFormat:@"%@/%@", QSDom,PrjName]
#define ErrorNoNetworkingTxt  @"服务器报错了，\n请稍后再访问。"
#define ErrorKICKOUTTxt  @"您的账号在其他设备登录，如非本人操作，请尝试重新登录或联系客服。"
#define ErrorTimeOutTxt  @"服务器连接超时，\n请稍后重试。"
//API url请求
//首页
//获取验证码
#define QSGetsmscode [NSString stringWithFormat:@"%@/commonManageAction_commonRun.action?processID=johnson.userloginservice.getsmscode", QSRequestTopOriginal]


#endif /* QSAPIUrl_h */
