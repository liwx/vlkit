//
//  UIView+VLEnlargeEdge.m
//  Pods
//
//  Created by liwx on 2021/1/23.
//

#import "UIView+VLEnlargeEdge.h"
#import "NSObject+VLSwizzleMethod.h"

#import <objc/runtime.h>

static char kVLEnlargeTopName;
static char kVLEnlargeLeftName;
static char kVLEnlargeBottomName;
static char kVLEnlargeRightName;

@implementation UIView (VLEnlargeEdge)

- (void)vl_setEnlargeEdgeWithEdge:(UIEdgeInsets)edge {
    objc_setAssociatedObject(self, &kVLEnlargeTopName, @(edge.top), OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &kVLEnlargeRightName, @(edge.right), OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &kVLEnlargeBottomName, @(edge.bottom), OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &kVLEnlargeLeftName, @(edge.left), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)vl_setEnlargeEdgeWithMargin:(CGFloat)margin {
    objc_setAssociatedObject(self, &kVLEnlargeTopName, @(margin), OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &kVLEnlargeRightName, @(margin), OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &kVLEnlargeBottomName, @(margin), OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &kVLEnlargeLeftName, @(margin), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGRect)vl_enlargedRect {
    CGFloat topEdge = [objc_getAssociatedObject(self, &kVLEnlargeTopName) floatValue];
    CGFloat rightEdge = [objc_getAssociatedObject(self, &kVLEnlargeRightName) floatValue];
    CGFloat bottomEdge = [objc_getAssociatedObject(self, &kVLEnlargeBottomName) floatValue];
    CGFloat leftEdge = [objc_getAssociatedObject(self, &kVLEnlargeLeftName) floatValue];
    return CGRectMake(self.bounds.origin.x - leftEdge,
                      self.bounds.origin.y - topEdge,
                      self.bounds.size.width + leftEdge + rightEdge,
                      self.bounds.size.height + topEdge + bottomEdge);
}

- (UIView *)vl_hitTest:(CGPoint) point withEvent:(UIEvent*) event {
    CGRect rect = [self vl_enlargedRect];
    if (CGRectEqualToRect(rect, self.bounds)) {
        return [self vl_hitTest:point withEvent:event];
    }
    return CGRectContainsPoint(rect, point) ? self : nil;
}

- (BOOL)vl_pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    CGRect rect = [self vl_enlargedRect];
    if (CGRectEqualToRect(rect, self.bounds)) {
        return [self vl_pointInside:point withEvent:event];
    }
    return CGRectContainsPoint(rect, point) ? YES : NO;
}


+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vl_swizzleMethod([self class], @selector(hitTest:withEvent:), @selector(vl_hitTest:withEvent:));
        vl_swizzleMethod([self class], @selector(pointInside:withEvent:), @selector(vl_pointInside:withEvent:));
    });
}

@end
