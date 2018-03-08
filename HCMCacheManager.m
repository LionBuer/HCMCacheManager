//
//  HCMCacheManager.m
//  HelloCordova
//
//  Created by X on 2017/11/29.
//

#import "HCMCacheManager.h"
#import "YYCache.h"

/** ~/Library/Caches/com.supconit.hcmobile.ios/basis */
static NSString *const kPublicValuesCacheName = @"supconit_hcmobile_ios";
/** ~/Library/Caches/com.supconit.hcmobile.ios/basis */
static NSString *const kPrivateValuesCacheName = @"supconit_hcmobile_ios_for_platform";

static NSString * const kCacheFolderName = @"com.supconit.hcmobile.ios";


// basis缓存，缓存路径在~/Library/Caches/com.supconit.hcmobile.ios/basis，缓存策略：不限制大小、不限制时间，缓存方式：数据库和本地混合式（超过20kb用数据库存储）
@interface HCMCacheManager ()
//@property (nonatomic, strong) YYCache *cache;
@end

@implementation HCMCacheManager

+ (instancetype)sharedManager{
    static HCMCacheManager *sharedInstance;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        sharedInstance = [[self alloc] init];
        
        YYCache *cache = [YYCache cacheWithName:[kCacheFolderName stringByAppendingPathComponent:@"basis"]];
        
        sharedInstance.cache = cache;
        
    });
    return sharedInstance;
}

/** 获取供平台用的缓存 */
+ (NSMutableDictionary *)privateCachedKeyValues{
    
    NSMutableDictionary *cachedKeyValues = (NSMutableDictionary *)[[HCMCacheManager sharedManager].cache objectForKey:kPrivateValuesCacheName];
    
    if (!cachedKeyValues) {
        cachedKeyValues = [NSMutableDictionary dictionary];
    }
    
    return cachedKeyValues;
    
}

/** 设置供平台用的缓存并缓存到本地和内存 */
+ (void)setPrivateCachedKeyValues:(NSDictionary *)keyValues{
    YYCache *cache = [HCMCacheManager sharedManager].cache;
    [cache setObject:[keyValues mutableCopy] forKey:kPrivateValuesCacheName];
}

/** 删除供平台用的缓存 */
+ (void)removePrivateCachedKeyValues{
    YYCache *cache = [HCMCacheManager sharedManager].cache;
    [cache removeObjectForKey:kPrivateValuesCacheName];
}


/** 获取供用户用的缓存 */
+ (NSMutableDictionary *)publicCachedKeyValues{
    
    NSMutableDictionary *cachedKeyValues = (NSMutableDictionary *)[[HCMCacheManager sharedManager].cache objectForKey:kPublicValuesCacheName];
    
    if (!cachedKeyValues) {
        cachedKeyValues = [NSMutableDictionary dictionary];
    }
    
    return cachedKeyValues;
}

/** 设置供用户用的缓存并缓存到本地和内存 */
+ (void)setPublicCachedKeyValues:(NSDictionary *)keyValues{
    YYCache *cache = [HCMCacheManager sharedManager].cache;
    [cache setObject:[keyValues mutableCopy] forKey:kPublicValuesCacheName];
}

/** 删除供用户用的缓存 */
+ (void)removePublicCachedKeyValues{
    YYCache *cache = [HCMCacheManager sharedManager].cache;
    [cache removeObjectForKey:kPublicValuesCacheName];
}

@end
