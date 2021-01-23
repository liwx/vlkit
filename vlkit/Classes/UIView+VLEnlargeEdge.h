//
//  UIView+VLEnlargeEdge.h
//  Pods
//
//  Created by liwx on 2021/1/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (VLEnlargeEdge)
/// 上下左右同时扩大 margin
/// @param margin 扩大的点击范围
- (void)vl_setEnlargeEdgeWithMargin:(CGFloat)margin;


/// 上下左右分别设置扩大点击范围 edge
/// @param edge 上下左右设置值
- (void)vl_setEnlargeEdgeWithEdge:(UIEdgeInsets)edge;
@end

NS_ASSUME_NONNULL_END
