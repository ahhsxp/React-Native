//
//  FileManager.m
//  live
//
//  Created by heixiu on 16/5/4.
//  Copyright © 2016年 JingGe. All rights reserved.
//

#import "FileManager.h"

@implementation FileManager

#pragma mark -- private method
// 获取文件目录
+ (NSString *)getFileDirectory {
    
    NSString *directory = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, TRUE) firstObject];
    
    NSString *cacheDirectory = [directory stringByAppendingString:@"HXFileCache/"];
    
    NSError *error = nil;
    if (![[NSFileManager defaultManager] fileExistsAtPath:cacheDirectory]) {
        
        [[NSFileManager defaultManager] createDirectoryAtPath:cacheDirectory withIntermediateDirectories:YES attributes:nil error:&error];
    }
    
    if (error) {
        NSLog(@"创建文件目录失败！error-->%@", error);
    }
    
    return cacheDirectory;
}

#pragma mark -- public method
// 获取文件路径
+ (NSString *)getFilePathWithIdentity:(NSString *)identity {
    
    return [[FileManager getFileDirectory] stringByAppendingString:identity];
}

// 是否存在文件
+ (BOOL)existsFileWithIdentity:(NSString *)identity {
    
    NSString *path = [self getFilePathWithIdentity:identity];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        
        return YES;
    }
    return NO;
}

// 保存文件, 如果有相同的文件会自动更新
+ (BOOL)saveFileWithIdentity:(NSString *)identity withObject:(id)object {
    
    NSString *path = [self getFilePathWithIdentity:identity];
    BOOL flag = NO;
    if (![FileManager existsFileWithIdentity:identity]) {
        
        flag = [[NSFileManager defaultManager] createFileAtPath:path contents:nil attributes:nil];
    } else {
        
        flag = [FileManager deleteFileWithIdentity:identity];
    }
    
    if (flag) {
        
        flag = [NSKeyedArchiver archiveRootObject:object toFile:path];

    }
    if (NO == flag) {
        
        NSLog(@"写入文件失败");
    }
    
    return flag;
}

// 删除文件
+ (BOOL)deleteFileWithIdentity:(NSString *)identity {
    
    NSString *path = [FileManager getFilePathWithIdentity:identity];
    BOOL flag = NO;
    NSError *error = nil;
    if ([FileManager existsFileWithIdentity:identity]) {
        
        flag = [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
    }
    
    if (error) {
        NSLog(@"删除文件失败error-->%@", error);
        flag = NO;
    }
    return flag;
}


// 获取所有文件
+ (NSArray *)getAllFileWithIdentity:(NSString *)identity {
    
    NSString *path = [FileManager getFilePathWithIdentity:identity];
    NSArray *contentsArr = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    if (nil == contentsArr) {
        
        NSLog(@"获取所有文件失败%@", contentsArr);
    }
    return contentsArr;
}

// 获取data数据
+ (NSData *)getDataWithIdentity:(NSString *)identity {
    
    NSString *path = [FileManager getFilePathWithIdentity:identity];
    NSData *data = nil;
    if ([FileManager existsFileWithIdentity:identity]) {

        data = [NSData dataWithContentsOfFile:path];
        NSLog(@"获取data成功");
    }
    return data;
}
@end
