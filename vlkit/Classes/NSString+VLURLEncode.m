//
//  NSString+VLURLEncode.m
//  Pods
//
//  Created by liwx on 2021/1/26.
//

#import "NSString+VLURLEncode.h"

@implementation NSString (VLURLEncode)


- (NSString *)vl_urlEncodedString {
    static NSCharacterSet *__vl_allowCharacterSet = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __vl_allowCharacterSet = [[NSCharacterSet characterSetWithCharactersInString:@"!*'();:@&=+$,/?#[]"] invertedSet];
    });
    return [self stringByAddingPercentEncodingWithAllowedCharacters:__vl_allowCharacterSet];
}

- (NSString *)vl_urlDecodedString {
    return [self stringByRemovingPercentEncoding];
}


@end
