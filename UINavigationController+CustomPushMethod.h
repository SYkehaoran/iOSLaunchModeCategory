//
//  UINavigationController+CustomPushMethod.h
//  HXFundManager
//
//  Created by 柯浩然 on 2018/12/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (CustomPushMethod)

- (void)fm_showViewController:(UIViewController *)viewController animated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
