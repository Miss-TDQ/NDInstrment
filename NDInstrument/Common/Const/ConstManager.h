//
//  PKBConstManager.h
//  ParkBeesIOS
//
//  Created by charles_wtx on 16/7/19.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


UIKIT_EXTERN NSString *const kYellowColor;
UIKIT_EXTERN NSString *const kBackGrayColor;
UIKIT_EXTERN NSString *const kCellLineColor;
UIKIT_EXTERN NSString *const kCellTextColor;
UIKIT_EXTERN NSString *const kCellDetailColor;
UIKIT_EXTERN NSString *const kYellowBackBlack;
UIKIT_EXTERN NSString *const kOrangeTextColor;
UIKIT_EXTERN NSString *const kYellowTextColor;
UIKIT_EXTERN NSString *const kGrayLineColor;
UIKIT_EXTERN NSString *const kPlaceHolderColor;
UIKIT_EXTERN NSString *const kTFBackColor;
UIKIT_EXTERN NSString *const kTextOrangeColor;
UIKIT_EXTERN NSString *const kLightYellorColor;
UIKIT_EXTERN NSString *const kBindingBoxColor;
UIKIT_EXTERN NSString *const kBindingYellowColor;
UIKIT_EXTERN NSString *const kBindingWhiteColor;
UIKIT_EXTERN NSString *const kBlackTextColor;
UIKIT_EXTERN NSString *const kShadowColor;


//当前停车时间改变（需重新发请求）通知
UIKIT_EXTERN NSString *const KTIMENOTIIFY;
//界面viewAppear通知
UIKIT_EXTERN NSString *const KVIEWAPPEARNOTI;

UIKIT_EXTERN NSString *const KPUSH;        // 推送注册信息开关

UIKIT_EXTERN NSString *const KPHONE;       //登录名
UIKIT_EXTERN NSString *const KPWD;         //密码
UIKIT_EXTERN NSString *const KUSERIMG;     //用户头像
UIKIT_EXTERN NSString *const KISLOGINED;   //是否登录过了

UIKIT_EXTERN NSString *const KYCOMNAME;    //合作公司名
UIKIT_EXTERN NSString *const KYISTHREELOGIN; //是否为第三方登录
UIKIT_EXTERN NSString *const KUserUTVDic;    //登录utv保存
UIKIT_EXTERN NSString *const KPayMehtodDic;  //保存上次支付选择的支付方式
UIKIT_EXTERN NSString *const KWXPay;         //微信
UIKIT_EXTERN NSString *const KALIPay;        //支付宝
UIKIT_EXTERN NSString *const KCMBPay;        //一网通
UIKIT_EXTERN NSString *const KCMBAPPPAYURL;  //调起招行一网通APP请求头
UIKIT_EXTERN NSString *const KFINANCERISK;   //投资风险弹窗

//客服电话
UIKIT_EXTERN NSString *const KServicePhone;
UIKIT_EXTERN NSString *const KServiceQQ;
UIKIT_EXTERN NSString *const KTencentAppid;

//官网
UIKIT_EXTERN NSString *const KWebAddress;
//关于我们
UIKIT_EXTERN NSString *const KCompanyName;
UIKIT_EXTERN NSString *const KCopyright;


//版本更新的key
UIKIT_EXTERN NSString *const KUPDATAPP;
UIKIT_EXTERN NSString *const KAPPNOTUPDATA; //不再提醒
UIKIT_EXTERN NSString *const KCURRENTDELETE;  //当前版本删除

//送优惠劵
UIKIT_EXTERN NSString *const KGiveDiscount;

//选择城市
UIKIT_EXTERN NSString *const KSelectCity;
//城市name
UIKIT_EXTERN NSString *const KCityName;
//城市code
UIKIT_EXTERN NSString *const KCityCode;

//是否第一次安装app & 活动用的
UIKIT_EXTERN NSString *const KFirstInstallApp;
//注册完成是否弹框领券成功
UIKIT_EXTERN NSString *const KRegistDiscountNoti;

//是否首次app，钥匙串判断使用
UIKIT_EXTERN NSString *const KInstalledApp;

//微信appid
UIKIT_EXTERN NSString *const KWXAppId;
//微信appSecret
UIKIT_EXTERN NSString *const KWXAppSecrect;


/**************缓存数据需要的fileName和key****************/

//不需要登录时 通用fileName  \
  需要登录的fileName使用userID代替（因为要区分是哪个账号下面的数据）

UIKIT_EXTERN NSString *const KUserFileName;

//广告页model
UIKIT_EXTERN NSString *const KAdJsonKey;
UIKIT_EXTERN NSString *const KAdImgKey;

//个人资料
UIKIT_EXTERN NSString *const KUserInfoKey;

//优惠券
UIKIT_EXTERN NSString *const KDiscountKey;

//停车记录
UIKIT_EXTERN NSString *const KParkHistoryKey;

//绑定车牌
UIKIT_EXTERN NSString *const KBindingCarKey;

//月卡列表
UIKIT_EXTERN NSString *const KMCardListKey;

//消息列表
UIKIT_EXTERN NSString *const KMessListKey;

//收藏列表
UIKIT_EXTERN NSString *const KCollectParkListKey;

//钥匙串账号和密码
UIKIT_EXTERN NSString *const PhoneChain;
UIKIT_EXTERN NSString *const PwdChain;
UIKIT_EXTERN NSString *const LoginChain;

//获取链接失败提示语
UIKIT_EXTERN NSString *const GetAppLinkMess;

//上一版本号 build 评论弹框
UIKIT_EXTERN NSString *const LastBuild;
//上一版本号 build 版本更新之后
UIKIT_EXTERN NSString *const UpdateLastBuild;


//首次安装时间戳
UIKIT_EXTERN NSString *const FirstInstallTime;

//微信提示语
UIKIT_EXTERN NSString *const WXAppSupportApiMess;
//qq提示语
UIKIT_EXTERN NSString *const QQAppSupportApiMess;

//保存首页弹框广告时间
UIKIT_EXTERN NSString *const HomeAdTime;
