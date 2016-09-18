//
//  ZFModalTransitionAnimator.h
//
//  Created by Amornchai Kanokpullwad on 5/10/14.
//  Copyright (c) 2014 zoonref. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <UIKit/UIGestureRecognizerSubclass.h>

typedef NS_ENUM(NSUInteger, ZFModalTransitonDirection) {
    ZFModalTransitonDirectionBottom,
    ZFModalTransitonDirectionLeft,
    ZFModalTransitonDirectionRight,
};

@interface ZFDetectScrollViewEndGestureRecognizer : UIPanGestureRecognizer
@property (nonatomic, weak) UIScrollView *scrollview;
@end

@interface ZFModalTransitionAnimator : UIPercentDrivenInteractiveTransition <UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, assign, getter=isDragable) BOOL dragable;
@property BOOL bounces;
@property ZFModalTransitonDirection direction;
@property CGFloat behindViewScale;
@property CGFloat behindViewAlpha;

- (id)initWithModalViewController:(UIViewController *)modalViewController;
- (void)setContentScrollView:(UIScrollView *)scrollView;

@end


//ModalViewController *modalVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ModalViewController"];
//modalVC.modalPresentationStyle = UIModalPresentationCustom;
//modalVC.view.backgroundColor = [UIColor clearColor];
//
//self.animator = [[ZFModalTransitionAnimator alloc] initWithModalViewController:modalVC];
//self.animator.dragable = self.dragable;
//self.animator.bounces = NO;
//self.animator.behindViewAlpha = 0.8f;
//self.animator.behindViewScale = 0.8f;
//
//NSString *title = [sender titleForState:UIControlStateNormal];
//if ([title isEqualToString:@"Left"]) {
//    self.animator.direction = ZFModalTransitonDirectionLeft;
//} else if ([title isEqualToString:@"Right"]) {
//    self.animator.direction = ZFModalTransitonDirectionRight;
//} else {
//    self.animator.direction = ZFModalTransitonDirectionBottom;
//}
//
//modalVC.transitioningDelegate = self.animator;
//[self presentViewController:modalVC animated:YES completion:nil];