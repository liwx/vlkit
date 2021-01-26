//
//  NSString+VLURLEncode.h
//  Pods
//
//  Created by liwx on 2021/1/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (VLURLEncode)
- (NSString *)vl_urlEncodedString;
- (NSString *)vl_urlDecodedString;
@end

NS_ASSUME_NONNULL_END
