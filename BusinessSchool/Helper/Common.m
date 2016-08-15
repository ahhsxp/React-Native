//
//  Common.m
//  live
//
//  Created by hysd on 15/7/29.
//  Copyright (c) 2015年 kenneth. All rights reserved.
//

#import "Common.h"

static Common *sharedObj = nil;
@implementation Common
+ (Common*) sharedInstance
{
    @synchronized (self)
    {
        if (sharedObj == nil)
        {
            sharedObj = [[self alloc] init];
            sharedObj.adaptIphoneScaleNum = [sharedObj adaptIphoneScale];
            sharedObj.adaptIphoneScaleHeight = [sharedObj adaptIphoneScaleHeight];
        }
    }
    return sharedObj;
}
+ (id) allocWithZone:(NSZone *)zone
{
    @synchronized (self) {
        if (sharedObj == nil) {
            sharedObj = [super allocWithZone:zone];
            return sharedObj;
        }
    }
    return nil;
}
- (id) copyWithZone:(NSZone *)zone //第四步
{
    return self;
}

#pragma mark 抖动
- (void)shakeView:(UIView*)viewToShake
{
    CGFloat t =4.0;
    CGAffineTransform translateRight  =CGAffineTransformTranslate(CGAffineTransformIdentity, t,0.0);
    CGAffineTransform translateLeft =CGAffineTransformTranslate(CGAffineTransformIdentity,-t,0.0);
    viewToShake.transform = translateLeft;
    [UIView animateWithDuration:0.07 delay:0.0 options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat animations:^{
        [UIView setAnimationRepeatCount:2.0];
        viewToShake.transform = translateRight;
    } completion:^(BOOL finished){
        if(finished){
            [UIView animateWithDuration:0.05 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
                viewToShake.transform =CGAffineTransformIdentity;
            } completion:NULL];
        }
    }];
}
#pragma mark 手机号码验证

- (BOOL)isValidateMobile:(NSString *)mobile
{
    NSString * phoneRegex = @"^(1)\\d{10}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}

// 验证码6位验证
- (BOOL)isValidateSmsNum:(NSString *)smsNum {
    
    NSString *smsNumRegex = @"\\d{6}"; 
    
    NSPredicate *smsNumPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", smsNumRegex];
    
    return [smsNumPredicate evaluateWithObject:smsNum];
}

// 四位数字
- (BOOL)isValidateFourNum:(NSString *)numStr {
    
    NSString *fourNumRegex = @"\\d{4}";
    
    NSPredicate *fourNumPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", fourNumRegex];
    
    return [fourNumPredicate evaluateWithObject:numStr];
}

// 姓名验证
- (BOOL)validateRealname:(NSString *)realname {
    
    NSString *nicknameRegex = @"^[\u4e00-\u9fa5]{2,8}$";
    
    NSPredicate *nicknamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nicknameRegex];
    
    return [nicknamePredicate evaluateWithObject:realname];
}

/**
 *  验证密码是否符合格式，长度在6~18之间，只能包含字符、数字
 *
 *  @param code 密码字符串
 *
 *  @return 判断结果
 */
- (BOOL)isValidateCode:(NSString *)code {
    
    //    NSString *codeRegex = @"^[0-9a-zA-Z]{6,18}$";
    NSString *codeRegex = @"^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9]{5,17}$"; //可以数字开头
    //    NSString *codeRegex = @"^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z][a-zA-Z0-9]{5,17}$"; //必须字母开头
    
    NSPredicate *codeTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",codeRegex];
    return [codeTest evaluateWithObject:code];
    
}

/**
 *  检验全都是数字的字符串
 *
 *  @param str 待检测的字符串
 *
 *  @return 判断结果
 */
- (BOOL)isAllNumbers:(NSString *)str {
    
    NSString *numberRegex = @"^[0-9]*$";
    NSPredicate *numberPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numberRegex];
    return [numberPredicate evaluateWithObject:str];
}
//^[0-9]*$

/**
 *  屏幕适配
 *
 *  @return 适配比例
 */
- (CGFloat)adaptIphoneScale {
    
    if (([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)) {
        return 320/375.0; //iphone5
    } else if (([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)) {
        return 414/375.0; //iphone6p
    } else if (([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)) {
        return 320/375.0; //iphone4/4s
    }else if (([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(1125, 2001), [[UIScreen mainScreen] currentMode].size) ) : NO)) {
        return 375/375.0; //iphone6p
    } else {
        return [UIScreen mainScreen].bounds.size.width / 375.0;
    }
}

/**
 *  屏幕适配高
 *
 *  @return 适配比例
 */
- (CGFloat)adaptIphoneScaleHeight {
    
    if (([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)) {
        return 568/666.667; //iphone5
    } else if (([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)) {
        return 736/666.667; //iphone6p
    } else if (([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)) {
        return 480/666.667; //iphone4/4s
    }else if (([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2001), [[UIScreen mainScreen] currentMode].size) : NO)) {
        return 667/666.667; //iphone6p big
    }else{
        return [UIScreen mainScreen].bounds.size.height / 666.667;
    }
}

@end

