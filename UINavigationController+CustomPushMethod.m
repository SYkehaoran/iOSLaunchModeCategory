//
//  UINavigationController+CustomPushMethod.m
//  HXFundManager
//
//  Created by 柯浩然 on 2018/12/18.
//  Copyright © 2018 China Asset Management Co., Ltd. All rights reserved.
//

#import "UINavigationController+CustomPushMethod.h"
#import "UIViewController+LaunchMode.h"
@implementation UINavigationController (CustomPushMethod)
- (void)fm_showViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (viewController.launchMode == LaunchModeSingTask) {
        BOOL isExist = NO;
        
        if ([self.viewControllers containsObject:viewController] && viewController != self.viewControllers.lastObject) {
            isExist = YES;
            [self popToViewController:viewController animated:YES];
            
        }else {
            
            for (UIViewController *vc in self.viewControllers) {
                if (vc != self.viewControllers.lastObject && [vc isKindOfClass:[viewController class]]) {
                    isExist = YES;
                    [self popToViewController:vc animated:YES];
                    break;
                }
            }
        }
        if (!isExist) {
            [self pushViewController:viewController animated:YES];
        }
    }else {
        
        [self pushViewController:viewController animated:YES];
    }
    
}

@end
