//
//  UIView+Animation.m
//  动效
//
//  Created by chenjun on 16/7/13.
//  Copyright © 2016年 cloudssky. All rights reserved.
//

#import "UIView+Animation.h"
#import <objc/runtime.h>

@interface UIView ()

@property (nonatomic ,assign) AnimationType type;

@end

@implementation UIView (Animation)

- (void)setType:(AnimationType)type {
    objc_setAssociatedObject(self, @selector(type), @(type), OBJC_ASSOCIATION_RETAIN);
}

- (AnimationType)type {
    return [objc_getAssociatedObject(self, @selector(type)) floatValue];
}

- (void)addAnimationWithType:(AnimationType)type {
    if ([self isKindOfClass:[UIControl class]]) {
        return;
    }
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapLabel:)];
    [self addGestureRecognizer:tap];
    self.type = type;
}

- (void)tapLabel:(UIGestureRecognizer *)ges {
    UIView *view = ges.view;
    if (self.type == animationShakeLeftAndRight) {
        [self shakeLeftAndRight:3 view:view];
    } else if (self.type == animationShakeUpAndDown) {
        [self shakeUpAndDown:3 view:view];
    } else if (self.type == animationEnlarge) {
        [self enlarge:15 view:view];
    } else if (self.type == animationReduce) {
        [self reduce:15 view:view];
    }
}

//左右抖动
- (void)shakeLeftAndRight:(int)offset view:(UIView *)view {
    CGRect rect = view.frame;
    [UIView animateWithDuration:0.1 animations:^{
        view.frame = CGRectMake(rect.origin.x - offset, rect.origin.y, rect.size.width, rect.size.height);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations:^{
            view.frame = CGRectMake(rect.origin.x + offset, rect.origin.y, rect.size.width, rect.size.height);
        } completion:^(BOOL finished) {
            view.frame = rect;
            if (offset != 1) {
                [self shakeLeftAndRight:offset - 1 view:view];
            }
        }];
    }];
}

//上下抖动
- (void)shakeUpAndDown:(int)offset view:(UIView *)view {
    CGRect rect = view.frame;
    [UIView animateWithDuration:0.1 animations:^{
        view.frame = CGRectMake(rect.origin.x, rect.origin.y - offset, rect.size.width, rect.size.height);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations:^{
            view.frame = CGRectMake(rect.origin.x, rect.origin.y + offset, rect.size.width, rect.size.height);
        } completion:^(BOOL finished) {
            view.frame = rect;
            if (offset != 1) {
                [self shakeUpAndDown:offset - 1 view:view];
            }
        }];
    }];
}

//放大
- (void)enlarge:(int)offset view:(UIView *)view {
    [UIView animateWithDuration:0.1 animations:^{
        CGAffineTransform  transform;
        transform = CGAffineTransformScale(view.transform,(1 + offset * 0.01),(1 + offset * 0.01));
        [view setTransform:transform];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations:^{
            CGAffineTransform  transform;
            transform = CGAffineTransformScale(view.transform,1/(1 + offset * 0.01),1/(1 + offset * 0.01));
            [view setTransform:transform];
        } completion:^(BOOL finished) {
            if (offset != 5) {
                [self enlarge:offset - 5 view:view];
            }
        }];
    }];
}

//缩小
- (void)reduce:(int)offset view:(UIView *)view {
    [UIView animateWithDuration:0.1 animations:^{
        CGAffineTransform  transform;
        transform = CGAffineTransformScale(view.transform,1/(1 + offset * 0.01),1/(1 + offset * 0.01));
        [view setTransform:transform];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations:^{
            CGAffineTransform  transform;
            transform = CGAffineTransformScale(view.transform,(1 + offset * 0.01),(1 + offset * 0.01));
            [view setTransform:transform];
        } completion:^(BOOL finished) {
            if (offset != 5) {
                [self reduce:offset - 5 view:view];
            }
        }];
    }];
}

@end
