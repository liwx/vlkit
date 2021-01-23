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

#import "NSObject+VLSwizzleMethod.h"
#import "UIView+VLEnlargeEdge.h"
#import "vlkit.h"

FOUNDATION_EXPORT double vlkitVersionNumber;
FOUNDATION_EXPORT const unsigned char vlkitVersionString[];

