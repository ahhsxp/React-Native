//
//  BSNetworkManager.h
//  BusinessSchool
//
//  Created by heixiu on 16/8/15.
//  Copyright © 2016年 JingGe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BSNetworkManager : NSObject

+ (instancetype)model;

// 网络请求接口
- (void)requestWithPath:(NSString *)path
                 params:(NSDictionary *)params
            targetSuper:(id)targetSuper
                success:(void (^)(id components))responseSuccess
                failure:(void (^)(NSError *error))responseFailure;

// 下载接口
- (void)downloadWithPath:(NSString *)path
                  params:(NSDictionary *)params
             targetSuper:(id)targetSuper
            downProgress:(void (^)(NSProgress *progress))downProgress
             destination:(NSURL *(^)(NSURL *targetPath, NSURLResponse *response))destination
                 failure:(void (^)(NSError *error))responseFailure;

@end
