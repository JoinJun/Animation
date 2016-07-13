//
//  ViewController.m
//  动效
//
//  Created by chenjun on 16/7/13.
//  Copyright © 2016年 cloudssky. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Animation.h"
#import "secViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label1 = [[UILabel alloc] init];
    label1.frame = CGRectMake(100, 100, 120, 50);
    label1.backgroundColor = [UIColor grayColor];
    [self.view addSubview:label1];
    label1.text = @"左右抖动";
    label1.textAlignment = NSTextAlignmentCenter;
    [label1 addAnimationWithType:animationShakeLeftAndRight];
    
    UILabel *label2 = [[UILabel alloc] init];
    label2.frame = CGRectMake(100, 180, 120, 50);
    label2.backgroundColor = [UIColor grayColor];
    [self.view addSubview:label2];
    label2.text = @"上下抖动";
    label2.textAlignment = NSTextAlignmentCenter;
    [label2 addAnimationWithType:animationShakeUpAndDown];
    
    UILabel *label3 = [[UILabel alloc] init];
    label3.frame = CGRectMake(100, 260, 120, 50);
    label3.backgroundColor = [UIColor grayColor];
    [self.view addSubview:label3];
    label3.text = @"放大";
    label3.textAlignment = NSTextAlignmentCenter;
    [label3 addAnimationWithType:animationEnlarge];
    
    UILabel *label4 = [[UILabel alloc] init];
    label4.frame = CGRectMake(100, 340, 120, 50);
    label4.backgroundColor = [UIColor grayColor];
    [self.view addSubview:label4];
    label4.text = @"缩小";
    label4.textAlignment = NSTextAlignmentCenter;
    [label4 addAnimationWithType:animationReduce];
    
    UIButton *btn = [[UIButton alloc] init];
    btn.frame = CGRectMake(100, 420, 120, 50);
    [btn setBackgroundColor:[UIColor yellowColor]];
    [btn addTarget:self action:@selector(ssssss) forControlEvents:UIControlEventTouchUpInside];
    [btn addAnimationWithType:animationReduce];
    [self.view addSubview:btn];
}

- (void)ssssss {
    secViewController *sec = [[secViewController alloc] init];
    [self presentViewController:sec animated:YES completion:nil];
}

- (void)large:(UIGestureRecognizer *)ges {
    UIView *view = ges.view;
    [UIView animateWithDuration:2 animations:^{
        CGAffineTransform  transform;
        transform = CGAffineTransformScale(view.transform,1.2,1.2);
        [view setTransform:transform];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:2 animations:^{
            CGAffineTransform  transform;
            transform = CGAffineTransformScale(view.transform,1/1.2,1/1.2);
            [view setTransform:transform];
        }];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
