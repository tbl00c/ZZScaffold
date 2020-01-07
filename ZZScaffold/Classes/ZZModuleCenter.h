//
//  ZZModuleCenter.h
//  ZZModule
//
//  Created by 李伯坤 on 2019/7/11.
//

#import <Foundation/Foundation.h>
#import "ZZModuleProtocol.h"
#import "ZZAppContext.h"

@interface ZZModuleCenter : NSObject

/// APP环境上下文
@property (nonatomic, strong) ZZAppContext *context;

+ (instancetype)center NS_SWIFT_NAME(shareInstance());

/**
 组件注册

 @param module 组件类，需要实现组件协议
 */
- (void)registerModule:(Class)moduleClass;

/**
 初始化组件
 */
- (void)moduleInit;

/**
 注册并初始化组件
 
 @param module 组件类，需要实现组件协议
 */
- (void)registerModuleAndInit:(Class)moduleClass;

@end

