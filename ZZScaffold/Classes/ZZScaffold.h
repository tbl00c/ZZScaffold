//
//  ZZScaffold.h
//  ZZScaffold
//
//  Created by 李伯坤 on 2019/7/12.
//

#ifndef ZZScaffold_h
#define ZZScaffold_h

#import "ZZModuleCenter.h"

#define ZZModuleRegister(Module) \
__attribute__((constructor)) static void moduleRegister_##Module(void) { \
[[ZZModuleCenter center] registerModule:[Module class]];\
}

#import "ZZServiceCenter.h"
#define ZZServiceRegister(Protocol, Service) \
[[ZZServiceCenter center] registerService:[Service class] forProtocol:@protocol(Protocol)];

#define ZZGetService(Protocol) \
[[ZZServiceCenter center] serviceForProtocol:@protocol(Protocol)]

#define ZZGetServiceInstance(Protocol) \
[ZZGetService(Protocol) new]

#endif /* ZZScaffold_h */
