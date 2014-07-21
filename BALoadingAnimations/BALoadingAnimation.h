//
//  BALoadingAnimation.h
//  BALoadingAnimations
//
//  Created by Jeff Hurray on 7/18/14.
//  Copyright (c) 2014 jhurray. All rights reserved.
//

/*
 
 TO-DO:
    - git 
    - better interface
    - build wave animation
    - build in/out animations
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

@protocol BALoadingAnimationDelegate <NSObject>

-(void)loadingAnimationDidStart:(BALoadingAnimation *)loadingAnimation;
-(void)loadingAnimationDidStop:(BALoadingAnimation *)loadingAnimation;

@end

@interface BALoadingAnimation : UIView

/*
 PUBLIC MEMBERS
 */
@property (nonatomic, weak) id<BALoadingAnimationDelegate> delegate;


/*
    PUBLIC METHODS
*/

// instance methods



// class methods

+(void)addBALoadingAnimation:(BALoadingAnimationType)animationType ToView:(UIView *)superView;

+(void)addBALoadingAnimation:(BALoadingAnimationType)animationType ToView:(UIView *)superView withStyling:(BALoadingAnimationConfig *)config;

+(void)removeBALoadingAnimationFromView:(UIView *)superView;


@end
