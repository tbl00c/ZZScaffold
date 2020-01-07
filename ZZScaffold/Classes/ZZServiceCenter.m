//
//  ZZServiceCenter.m
//  ZZModule
//
//  Created by 李伯坤 on 2019/7/12.
//

#import "ZZServiceCenter.h"

@interface ZZServiceCenter ()

@property (nonatomic, strong, readonly) NSMutableDictionary *serviceData;

@end

@implementation ZZServiceCenter

+ (instancetype)center
{
    static ZZServiceCenter *center;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        center = [[ZZServiceCenter alloc] init];
    });
    return center;
}

- (instancetype)init
{
    if (self = [super init]) {
        _serviceData = [[NSMutableDictionary alloc] init];
    }
    return self;
}

#pragma mark - # API
/// 注册协议关联类
- (BOOL)registerService:(Class)serviceClass forProtocol:(Protocol *)protocol
{
    NSAssert(serviceClass && protocol, @"[转转服务] 服务注册失败，class或protocol不能为空");
    if (!serviceClass || !protocol) {
        return NO;
    }
    [self.serviceData setObject:serviceClass forKey:NSStringFromProtocol(protocol)];
    return YES;
}

/// 根据协议获取关联类
- (Class)serviceForProtocol:(Protocol *)protocol
{
    NSAssert(protocol, @"[服务注册] 服务获取失败，protocol不能为空");
    Class class = [self.serviceData objectForKey:NSStringFromProtocol(protocol)];
    return class;
}

/// 解除协议关联类
- (BOOL)unregisterServiceForProtocol:(Protocol *)protocol
{
    NSAssert(protocol, @"[服务注册] 服务获取失败，protocol不能为空");
    if (!protocol) {
        return NO;
    }
    [self.serviceData removeObjectForKey:NSStringFromProtocol(protocol)];
    return YES;
}

@end
