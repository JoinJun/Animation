//
//  UIView+Animation.h
//  动效
//
//  Created by chenjun on 16/7/13.
//  Copyright © 2016年 cloudssky. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    animationShakeLeftAndRight,//左右抖动
    animationShakeUpAndDown,//上下抖动
    animationEnlarge,//放大
    animationReduce,//缩小
} AnimationType;

@interface UIView (Animation)

- (void)addAnimationWithType:(AnimationType)type;

@end
