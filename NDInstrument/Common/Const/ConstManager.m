//
//  PKBConstManager.m
//  ParkBeesIOS
//
//  Created by charles_wtx on 16/7/19.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ConstManager.h"


NSString *const kYellowColor        = @"#f6cf07"; //黄背景
NSString *const kBackGrayColor      = @"#f2f2f2"; //灰背景
NSString *const kCellLineColor      = @"#d7d7d7"; //线的色值
NSString *const kCellTextColor      = @"#52575b"; //列表同一黑色
NSString *const kCellDetailColor    = @"#808080"; //浅色字体
NSString *const kYellowBackBlack    = @"#4f4409"; //黄背景下的黑色字体
NSString *const kOrangeTextColor    = @"#f66107"; //橙色字体
NSString *const kYellowTextColor    = @"#f5c225"; //黄色字体
NSString *const kGrayLineColor      = @"#e0e0e0"; //灰色线
NSString *const kPlaceHolderColor   = @"#8c8c8c"; //输入框默认字体
NSString *const kTFBackColor        = @"#3F4851"; //输入框背景颜色
NSString *const kTextOrangeColor    = @"#ec8a11"; //纯文字橙色
NSString *const kLightYellorColor   = @"#FDE8BD"; //浅黄色
NSString *const kBindingBoxColor    = @"#AFAFAF"; //绑定车牌格子边框颜色
NSString *const kBindingYellowColor = @"#ECE09B"; //绑定车牌字体颜色
NSString *const kBindingWhiteColor  = @"#DEDEDE"; //绑定车牌白色
NSString *const kBlackTextColor     = @"#4C4B4B"; //黑色字体颜色
NSString *const kShadowColor        = @"#D7D7D7"; //浅灰色阴影颜色

//当前停车时间改变（需重新发请求）通知
NSString *const KTIMENOTIIFY    = @"KhourDidChangeNotify";
NSString *const KVIEWAPPEARNOTI = @"KRootViewAppear";

NSString *const KPUSH          = @"KPushSW";  // 推送注册信息开关

NSString *const KPHONE         = @"KPhone";   //登录名
NSString *const KPWD           = @"KPwd";    //密码
NSString *const KUSERIMG       = @"KUserImg"; //用户头像
NSString *const KISLOGINED     = @"KIsLogined";   //是否登录过了

NSString *const KYCOMNAME      = @"KYComname"; //合作公司名
NSString *const KYISTHREELOGIN = @"KYThreelogin"; //是否为第三方登录
NSString *const KUserUTVDic    = @"KUserUTVDic"; //登录utv保存
NSString *const KPayMehtodDic  = @"KPayMehtodDic";  //保存上次支付选择的支付方式
NSString *const KWXPay         = @"KWeixin";         //微信
NSString *const KALIPay        = @"KAli";        //支付宝
NSString *const KCMBPay        = @"KCMB";        //招行一网通
NSString *const KCMBAPPPAYURL  = @"cmbmobilebank://CMBLS/FunctionJump?action=gofuncid&funcid=200007&serverid=CMBEUserPay&requesttype=post&cmb_app_trans_parms_start=here&charset=utf-8&jsonRequestData=";//调招行一网通APP的头

NSString *const KFINANCERISK   = @"KFinanceRisk"; //投资风险弹窗

//客服电话
NSString *const KServicePhone   = @"400-111-8130";
NSString *const KServiceQQ   = @"492592264";

NSString *const KTencentAppid   = @"1104485022";

//官网
NSString *const KWebAddress     = @"http://www.parkbees.com";
//关于我们
NSString *const KCompanyName    = @"深圳市前海亿车科技有限公司";
NSString *const KCopyright      = @"版权所有  Copyright © 2015 – 2017 Ecaray. All Rights Reserved.";


//版本更新的key
NSString *const KUPDATAPP       = @"updataApp";
NSString *const KAPPNOTUPDATA   = @"appNotUpdata"; //不再提醒
NSString *const KCURRENTDELETE  = @"currentDelete";

//送优惠劵
NSString *const KGiveDiscount   = @"giveDicount";

//选择城市
NSString *const KSelectCity     = @"selectCityDic";
//城市name
NSString *const KCityName       = @"cityName";
//城市code
NSString *const KCityCode       = @"cityCode";

//是否第一次安装app & 活动用的
NSString *const KFirstInstallApp    = @"firstInstallApp";
//注册完成是否弹框领券成功
NSString *const KRegistDiscountNoti = @"registDiscountNoti";
//是否首次安装app，钥匙串判断使用
NSString *const KInstalledApp    = @"installedApp";

NSString *const KWXAppId        = @"wx8c9aa923617adc01";
NSString *const KWXAppSecrect   = @"3f673b1ee6856f0b91d4574b9252ae44";

/**************缓存数据需要的fileName和key****************/

//不需要登录时 通用fileName  \
  需要登录的fileName使用userID代替（因为要区分是哪个账号下面的数据）
NSString *const KUserFileName   = @"userFileName";

//广告页model
NSString *const KAdJsonKey      = @"adJson";
NSString *const KAdImgKey       = @"adImgDic";

//个人资料
NSString *const KUserInfoKey    = @"userInfo";

//优惠券
NSString *const KDiscountKey    = @"discountAry";

//停车记录
NSString *const KParkHistoryKey = @"newParkHistoryAry";

//绑定车牌
NSString *const KBindingCarKey  = @"bindingCarAry";

//月卡列表
NSString *const KMCardListKey   = @"mcardListAry";

//消息列表
NSString *const KMessListKey    = @"messListAry";

//收藏列表
NSString *const KCollectParkListKey = @"collectParkAry";

//钥匙串账号和密码
NSString *const PhoneChain      = @"phoneChain";
NSString *const PwdChain        = @"pwdChain";
NSString *const LoginChain      = @"loginChain";


NSString *const GetAppLinkMess  = @"地址获取失败，请稍候重试！";
NSString *const LastBuild       = @"lastBuild";
NSString *const UpdateLastBuild = @"updateLastBuild";

NSString *const FirstInstallTime = @"firstInstallTime";

NSString *const WXAppSupportApiMess = @"您当前未安装微信或者当前版本不支持，无法进行授权";
NSString *const QQAppSupportApiMess = @"您当前未安装QQ或者当前版本不支持，无法进行授权";

NSString *const HomeAdTime = @"homeAdTime";
