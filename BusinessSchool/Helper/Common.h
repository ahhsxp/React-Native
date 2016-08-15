// 
//  Common.h
//  live
//
//  Created by hysd on 15/7/29.
//  Copyright (c) 2015年 kenneth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Common : NSObject

@property (nonatomic, assign) CGFloat adaptIphoneScaleNum;
@property (nonatomic, assign) CGFloat adaptIphoneScaleHeight;

+ (Common *) sharedInstance;

- (void)shakeView:(UIView*)viewToShake;
- (BOOL)isValidateMobile:(NSString *)mobile;
// 6位验证码
- (BOOL)isValidateSmsNum:(NSString *)smsNum;
// 四位数字
- (BOOL)isValidateFourNum:(NSString *)numStr;
// 姓名验证
- (BOOL)validateRealname:(NSString *)realname;
- (BOOL)isValidateCode:(NSString *)code;
// 全都是数字
- (BOOL)isAllNumbers:(NSString *)str;

@end
