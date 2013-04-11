//
//  ViewController.h
//  CarmerSample
//
//  Created by Mars on 13-4-11.
//  Copyright (c) 2013年 Mars. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ViewController : UIViewController<UITextFieldDelegate>

/// 背景图片
@property (nonatomic, strong) UIImageView *imageView;

/// 触发按钮
@property (nonatomic, strong) UIButton *actionBtn;

/// 奖励视图
@property (nonatomic, strong) UIView *rewordView;

@property (nonatomic, strong) UIView *rewardView;

@end
