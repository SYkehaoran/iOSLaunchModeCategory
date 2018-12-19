//
//  UIViewController+LaunchMode.h
//  HXFundManager
//
//  Created by 柯浩然 on 2018/12/18.
//  Copyright © 2018 China Asset Management Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, LaunchMode) {
    LaunchModeSingTask,//会检查栈里面是否已经有该vc。如果有直接打开，之上的其他vc会被弹出
    LaunchModeStandard,//每次跳转都创建新的vc
};

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (LaunchMode)
@property(nonatomic, assign) LaunchMode launchMode;
@end

NS_ASSUME_NONNULL_END