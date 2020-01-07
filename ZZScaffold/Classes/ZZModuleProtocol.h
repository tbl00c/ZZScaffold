//
//  ZZModuleProtocol.h
//  ZZModule
//
//  Created by 李伯坤 on 2019/7/11.
//

#import <Foundation/Foundation.h>
#import "ZZAppContext.h"

@protocol ZZModuleProtocol <NSObject>

/**
 模块初始化

 @param context app环境上下文
 */
- (void)moduleInit:(ZZAppContext *)context;

@end

