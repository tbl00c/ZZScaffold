//
//  ZZServiceCenter.h
//  ZZModule
//
//  Created by 李伯坤 on 2019/7/12.
//

#import <Foundation/Foundation.h>

@interface ZZServiceCenter : NSObject

+ (instancetype)center NS_SWIFT_NAME(shareInstance());

/**
 注册协议关联类
 */
- (BOOL)registerService:(Class)serviceClass forProtocol:(Protocol *)protocol;

/**
 根据协议获取关联类
 */
- (Class)serviceForProtocol:(Protocol *)protocol;

/**
 解除协议关联类
 */
- (BOOL)unregisterServiceForProtocol:(Protocol *)protocol;

@end
