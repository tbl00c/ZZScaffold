//
//  ZZModuleCenter.m
//  ZZModule
//
//  Created by 李伯坤 on 2019/7/11.
//

#import "ZZModuleCenter.h"

@interface ZZModuleCenter ()

@property (nonatomic, strong, readonly) NSMutableArray<Class> *moduleClasseList;

@property (nonatomic, strong, readonly) NSMutableDictionary<Class, id> *modulesMap;

@property (nonatomic, strong, readonly) NSMutableArray<id<ZZModuleProtocol>> *moduleList;

@end

@implementation ZZModuleCenter

+ (instancetype)center
{
    static ZZModuleCenter *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[ZZModuleCenter alloc] init];
    });
    return manager;
}

- (instancetype)init
{
    if (self = [super init]) {
        _moduleClasseList = [[NSMutableArray alloc] init];
        _modulesMap = [[NSMutableDictionary alloc] init];
    }
    return self;
}

#pragma mark - # API
/// 注册组件
- (void)registerModule:(Class)moduleClass
{
    NSAssert(moduleClass != nil, @"[ZZScaffold] 注册异常, 组件不能为nil");
    if (moduleClass) {
        NSAssert(![self.moduleClasseList containsObject:moduleClass], @"[ZZScaffold] 注册异常, 组件不可重复注册：%@", NSStringFromClass(moduleClass));
        if ([self.moduleClasseList containsObject:moduleClass]) {
            NSLog(@"[ZZScaffold] 组件注册异常, module不可重复注册：%@", NSStringFromClass(moduleClass));
            return;
        }
        [self.moduleClasseList addObject:moduleClass];
    }
}

/// 初始化组件
- (void)moduleInit
{
    [self.moduleClasseList enumerateObjectsUsingBlock:^(Class moduleClass, NSUInteger idx, BOOL *stop) {
        [self p_initModule:moduleClass];
    }];
}

- (void)p_initModule:(Class)moduleClass
{
    NSAssert(![self.modulesMap objectForKey:moduleClass], @"[ZZScaffold] 初始化异常, 组件不可重复初始化：%@", NSStringFromClass(moduleClass));
    if ([self.modulesMap objectForKey:moduleClass]) {
        NSLog(@"[ZZScaffold] 组件注册异常, module不可重复注册：%@", NSStringFromClass(moduleClass));
        return;
    }
    id<ZZModuleProtocol> module = [[moduleClass alloc] init];
    [self.modulesMap setObject:module forKey:moduleClass];
    [self.moduleList addObject:module];
    if ([module respondsToSelector:@selector(moduleInit:)]) {
        [module moduleInit:self.context];
    }
}

/// 注册并初始化组件
- (void)registerModuleAndInit:(Class)moduleClass
{
    [self registerModule:moduleClass];
    [self p_initModule:moduleClass];
}

@end
  
