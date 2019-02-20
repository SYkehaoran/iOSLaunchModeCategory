//
//  UIViewController+LaunchMode.m
//  HXFundManager
//
//  Created by 柯浩然 on 2018/12/18.
//  Copyright © 2018 China Asset Management Co., Ltd. All rights reserved.
//

#import "UIViewController+LaunchMode.h"
#import <objc/runtime.h>

static NSString * const kLaunchModeKey = @"kLaunchModeKey";

@implementation UIViewController (LaunchMode)

- (void)setLaunchMode:(LaunchMode)launchMode {
    objc_setAssociatedObject(self, &kLaunchModeKey, @(launchMode), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (LaunchMode)launchMode {
    return [objc_getAssociatedObject(self, &kLaunchModeKey) integerValue];
}

- (instancetype)initWithNavigationController:(UINavigationController *)navigationController {
    
    for (UIViewController *vc in [navigationController.viewControllers reverseObjectEnumerator]) {
        if ([vc isKindOfClass:[self class]]) {
            if (vc.launchMode == LaunchModeSingTask) {
                return vc;
            }
            break;
        }
    }
    
    return [self init];
}

- (void)viewWillAppearFromStack {
    
}

@end
