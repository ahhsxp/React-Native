//
//  FileManager.h
//  live
//
//  Created by heixiu on 16/5/4.
//  Copyright © 2016年 JingGe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileManager : NSObject

/**
 *  identity 为可以标识这个文件的ID
 */
// 获取文件路径
+ (NSString *)getFilePathWithIdentity:(NSString *)identity;
// 是否存在文件
+ (BOOL)existsFileWithIdentity:(NSString *)identity;
// 保存文件, 如果有相同的文件会自动更新
+ (BOOL)saveFileWithIdentity:(NSString *)identity withObject:(id)object;
// 删除文件
+ (BOOL)deleteFileWithIdentity:(NSString *)identity;
// 获取所有文件
+ (NSArray *)getAllFileWithIdentity:(NSString *)identity;
// 获取data数据
+ (NSData *)getDataWithIdentity:(NSString *)identity;

@end
