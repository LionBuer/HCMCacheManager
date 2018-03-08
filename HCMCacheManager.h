//
//  HCMCacheManager.h
//  HelloCordova
//
//  Created by X on 2017/11/29.
//

#import <UIKit/UIKit.h>
@class YYCache;

@interface HCMCacheManager : NSObject
@property (nonatomic, strong) YYCache *cache;
+ (instancetype)sharedManager;
/**
 * 以下方法都为同步操作，为阻塞当前线程直至操作完成
 */
/** 获取供平台用的缓存 */
+ (NSMutableDictionary *)privateCachedKeyValues;
/** 设置供平台用的缓存并缓存到本地和内存 */
+ (void)setPrivateCachedKeyValues:(NSDictionary *)keyValues;
/** 删除供平台用的缓存 */
+ (void)removePrivateCachedKeyValues;
/** 获取供用户用的缓存 */
+ (NSMutableDictionary *)publicCachedKeyValues;
/** 设置供用户用的缓存并缓存到本地和内存 */
+ (void)setPublicCachedKeyValues:(NSDictionary *)keyValues;
/** 删除供用户用的缓存 */
+ (void)removePublicCachedKeyValues;
@end









