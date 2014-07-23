//
//  BALoadingAnimation.h
//  BALoadingAnimations
//
//  Created by Jeff Hurray on 7/18/14.
//  Copyright (c) 2014 jhurray. All rights reserved.
//

/*
 
 TO-DO:
    - better interface
    - build wave animation
    - build in/out animations (config)
    - cocoa pods
*/

#import "BALoadingAnimationConfig.h"
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

typedef NS_ENUM(NSInteger, BALoadingAnimationType)
{
    BALoadingAnimationTypeDefault,
    BALoadingAnimationTypeSpinner,
    BALoadingAnimationTypePulse,
    BALoadingAnimationTypeWave,
    BALoadingAnimationTypeRipple
};

@class BALoadingAnimation;

typedef void (^BACompletionBlock)(void);
typedef void (^BAExecutionBlock)(void);

@interface BALoadingAnimation : UIView

// Adds a loading animation to a view.
// Should be called before an async operation.
+(void)addBALoadingAnimation:(BALoadingAnimationType)animationType toView:(UIView *)superView;


// Adds a loading animation to a view with custom styling.
// Should be called before an async operation.
+(void)addBALoadingAnimation:(BALoadingAnimationType)animationType toView:(UIView *)superView withStyling:(BALoadingAnimationConfig *)config;


// Adds a loading animation to the view while a selector is being exectuted asyncronously.
// Removes loading animation when async operation is finished executing.
// Return values from selector passed through completion block.
+(void)runBALoadingAnimation:(BALoadingAnimationType)animationType onView:(UIView *)superView whileExecuting:(BAExecutionBlock)work withCompletion:(BACompletionBlock)completion;


// Adds a loading animation to the view while code in execution block is being exectuted asyncronously.
// Removes loading animation when async operation is finished executing.
// Return values from selector passed through completion block.
// Supports custom styling.
+(void)runBALoadingAnimation:(BALoadingAnimationType)animationType onView:(UIView *)superView withStyling:(BALoadingAnimationConfig *)config whileExecuting:(BAExecutionBlock)work withCompletion:(BACompletionBlock)completion;


// Removes all BAloadingAnimations from the view.
// Should only be used with [BALoadingAnimation addBALoadingAnimation:(BALoadingAnimationType)animationType toView:(UIView *)superView].
// Should only be called asyncronously on the main queue.
+(void)removeBALoadingAnimationFromView:(UIView *)superView;



@end
