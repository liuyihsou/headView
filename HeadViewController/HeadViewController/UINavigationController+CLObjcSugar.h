//
//  ViewController.m
//  HeadViewController
//
//  Created by lishaopeng on 16/11/25.
//  Copyright © 2016年 lishaopeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (CLObjcSugar)

/// 自定义全屏拖拽返回手势
@property (nonatomic, strong, readonly) UIPanGestureRecognizer *cl_popGestureRecognizer;

@end
