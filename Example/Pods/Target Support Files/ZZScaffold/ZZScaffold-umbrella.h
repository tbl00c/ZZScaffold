#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "ZZAppContext.h"
#import "ZZModuleCenter.h"
#import "ZZModuleProtocol.h"
#import "ZZScaffold.h"
#import "ZZServiceCenter.h"

FOUNDATION_EXPORT double ZZScaffoldVersionNumber;
FOUNDATION_EXPORT const unsigned char ZZScaffoldVersionString[];

