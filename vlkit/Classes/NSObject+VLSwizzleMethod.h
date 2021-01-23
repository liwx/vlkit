//
//  NSObject+VLSwizzleMethod.h
//  Pods
//
//  Created by liwx on 2021/1/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (VLSwizzleMethod)
void vl_swizzleMethod(Class class, SEL originalSelector, SEL swizzledSelector);
@end

NS_ASSUME_NONNULL_END
