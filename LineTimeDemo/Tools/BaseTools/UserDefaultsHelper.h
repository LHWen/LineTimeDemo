//
//  UserDefaultsHelper.h
//  LineTimeDemo
//
//  Created by LHWen on 2017/10/17.
//  Copyright © 2017年 LHWen. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * 数据本地存取工具类
 */
@interface UserDefaultsHelper : NSObject

/* 通过key获取字符串 */
+ (NSString *)getStringForKey:(NSString *)key;
/* 通过key获取Interger值 */
+ (NSInteger)getIntForkey:(NSString *)key;
/* 通过key获取字典数据 */
+ (NSDictionary *)getDictForKey:(NSString *)key;
/* 通过key获取Data数据 */
+ (NSData *)getDataForKey:(NSString *)key;
/* 通过key获取数组 */
+ (NSArray *)getArrayForKey:(NSString *)key;
/* 通过key获取bBOOL值 */
+ (BOOL)getBoolForKey:(NSString *)key;

/* 保存本地字符串值 */
+ (void)setString:(NSString *)value forKey:(NSString*)key;
/* 保存本地Interger值 */
+ (void)setInteger:(NSInteger)value forKey:(NSString *)key;
/* 保存本地Dictionary值 */
+ (void)setDict:(NSDictionary *)value forKey:(NSString *)key;
/* 保存本地字data值 */
+ (void)setData:(NSData *)value forKey:(NSString *)key;
/* 保存本地数组值 */
+ (void)setArraye:(NSArray *)value forKey:(NSString *)key;
/* 保存本地Bool值 */
+ (void)setBool:(BOOL)value forKey:(NSString *)key;

/* 通过key 数组 清除本地保存数据 */
+ (void)clearObjectForKeys:(NSArray *)keys;

@end
