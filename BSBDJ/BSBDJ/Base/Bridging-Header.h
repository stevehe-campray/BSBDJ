//
//  Bridging-Header.h
//  BSBDJ
//
//  Created by hejingjin on 16/3/15.
//  Copyright © 2016年 baisibudejie. All rights reserved.
//

#ifndef Bridging_Header_h
#define Bridging_Header_h


// 主请求路径
#define XMGMainURL @"http://api.budejie.com/api/api_open.php"

// 间距
#define XMGCellMargin 10
//屏幕宽带，高度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
// 颜色
#define XMGColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
// 全局色
#define XMGGlobalColor XMGColor(229, 229, 229)

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:0.99]

#import <SVProgressHUD.h>
#import "UIBarButtonItem+XMGExtension.h"
#import "DALabeledCircularProgressView.h"
#import "UIView+XMGExtension.h"
#import "NSDate+Extension.h"
#import "NSDate+Util.h"
#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS
#import <Masonry.h>
#import <MJExtension.h>
#import <MJRefresh.h>
#import <POP.h>
#import <AFNetworking.h>
#import <UIImageView+WebCache.h>
#import <UIButton+WebCache.h>

typedef NS_ENUM(NSUInteger, XMGTopicsType) {
    XMGTopicsTypeAll = 1, // 全部
    XMGTopicsTypePicture = 10, // 图片
    XMGTopicsTypeWord = 29, // 段子
    XMGTopicsTypeVoice = 31, // 声音
    XMGTopicsTypeVideo = 41 // 视频
};

#endif /* Bridging_Header_h */
