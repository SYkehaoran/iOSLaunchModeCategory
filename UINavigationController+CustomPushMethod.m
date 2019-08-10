//
//  UINavigationController+CustomPushMethod.m
//  HXFundManager
//
//  Created by 柯浩然 on 2018/12/18.
//

#import "UINavigationController+CustomPushMethod.h"
#import "UIViewController+LaunchMode.h"

@implementation UINavigationController (CustomPushMethod)

- (void)fm_showViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (viewController.launchMode == LaunchModeSingTask) {
        BOOL isExist = NO;
        
        if ([self.viewControllers containsObject:viewController] && viewController != self.viewControllers.lastObject) {
            isExist = YES;
            
            [viewController viewWillAppearFromStack];
            [self popToViewController:viewController animated:animated];
            
        }else {
            
            for (UIViewController *vc in [self.viewControllers reverseObjectEnumerator]) {
                if (vc != self.viewControllers.lastObject && [vc isKindOfClass:[viewController class]]) {
                    isExist = YES;
                    [vc viewWillAppearFromStack];
                    [self popToViewController:vc animated:animated];
                    break;
                }
            }
        }
        if (!isExist) {
            [self pushViewController:viewController animated:animated];
        }
    }else {
        
        [self pushViewController:viewController animated:animated];
    }
    
}

@end
