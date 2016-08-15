//
//  BSNetworkManager.m
//  BusinessSchool
//
//  Created by heixiu on 16/8/15.
//  Copyright © 2016年 JingGe. All rights reserved.
//

#import "BSNetworkManager.h"
#import "AFNetworking.h"


@implementation BSNetworkManager

+ (instancetype)model {
    __autoreleasing BSNetworkManager *item = [[self alloc] init];
    return item;
}

// 网络请求接口
- (void)requestWithPath:(NSString *)path
                 params:(NSDictionary *)params
            targetSuper:(id)targetSuper
                success:(void (^)(id components))responseSuccess
                failure:(void (^)(NSError *error))responseFailure {
    if (nil == params) {
        params = [NSDictionary dictionary];
    }
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:path parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseSuccess) {
            responseSuccess(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (responseFailure) {
            responseFailure(error);
        }
    }];
}

- (void)downloadWithPath:(NSString *)path
                  params:(NSDictionary *)params
             targetSuper:(id)targetSuper
            downProgress:(void (^)(NSProgress *progress))downProgress
             destination:(NSURL *(^)(NSURL *targetPath, NSURLResponse *response))destination
                 failure:(void (^)(NSError *error))responseFailure {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:path]];
    [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        if (downProgress) {
            downProgress(downloadProgress);
        }
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        NSURL *path;
        if (destination) {
             path = destination(targetPath, response);
        }
        return path;
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        if (responseFailure) {
            responseFailure(error);
        }
    }];
}

@end
