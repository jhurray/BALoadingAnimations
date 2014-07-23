//
//  BALoadingAnimation.m
//  BALoadingAnimations
//
//  Created by Jeff Hurray on 7/18/14.
//  Copyright (c) 2014 jhurray. All rights reserved.
//

#define DEVICE_WIDTH 320
#define DEVICE_HEIGHT 400
#define LABEL_HEIGHT 30
#define MARGIN 15

#import "BARippleAnimationView.h"
#import "BAPulseAnimationView.h"
#import "BAWaveAnimationView.h"
#import "BASpinnerAnimationView.h"
#import "BALoadingAnimation.h"

@interface BALoadingAnimation()

@property (nonatomic, strong) UILabel *messageLabel;
@property (nonatomic, strong) BAAnimationView *animationView;

+(BAAnimationView *)animationViewForAnimationType:(BALoadingAnimationType)animationType;

@end

@implementation BALoadingAnimation

- (id)initWithFrame:(CGRect)frame animationView:(BAAnimationView *) animationView andBAConfig:(BALoadingAnimationConfig *)config
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        // messgae label init
        CGFloat messageLabelY = frame.size.height - MARGIN*0.5 - LABEL_HEIGHT;
        CGFloat messageLabelWidth = frame.size.width - MARGIN;
        CGRect messageLabelFrame = CGRectMake(MARGIN/2, messageLabelY, messageLabelWidth, LABEL_HEIGHT);
        self.messageLabel = [[UILabel alloc] initWithFrame:messageLabelFrame];
        [self.messageLabel setAdjustsFontSizeToFitWidth:YES];
        [self.messageLabel setFont:config.font];
        [self.messageLabel setText:config.message];
        [self.messageLabel setBackgroundColor:[UIColor clearColor]];
        [self.messageLabel setTextColor:config.secondaryColor];
        [self.messageLabel setTextAlignment:NSTextAlignmentCenter];
        
        if(config.showsMessage)
        {
            [self addSubview:self.messageLabel];
        }
        
        // animation view
        [self addSubview:animationView];
        
        // now set colors
        [self setBackgroundColor:config.primaryColor];
        // set layer properties
        [self.layer setCornerRadius:8.0];
        
        // get a shadow
        self.layer.shadowOffset = CGSizeMake(2.5, 2.5);
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        self.layer.shadowOpacity = 0.8;        
        
    }
    return self;
}


// -----------------------------------  CLASS METHODS  --------------------------------- //

+(void)runBALoadingAnimation:(BALoadingAnimationType)animationType whileSelector:(SEL)selector withTarget:(id)target andObject:(id)object runsOnView:(UIView *)superView
{
    BALoadingAnimationConfig *config = [BALoadingAnimationConfig sharedInstance];
    [BALoadingAnimation runBALoadingAnimation:animationType whileSelector:selector withTarget:target andObject:object runsOnView:superView withStyling:config];
}

+(void)runBALoadingAnimation:(BALoadingAnimationType)animationType whileSelector:(SEL)selector withTarget:(id)target andObject:(id)object runsOnView:(UIView *)superView withStyling:(BALoadingAnimationConfig *)config
{
    [BALoadingAnimation runBALoadingAnimation:animationType whileSelector:selector withTarget:target andObject:object runsOnView:superView withCompletion:nil];
}

+(void)runBALoadingAnimation:(BALoadingAnimationType)animationType whileSelector:(SEL)selector withTarget:(id)target andObject:(id)object runsOnView:(UIView *)superView withStyling:(BALoadingAnimationConfig *)config andCompletion:(BACompletionReturnBlock)completion
{
    [self addBALoadingAnimation:animationType toView:superView withStyling:config];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        // Do something...
        #pragma clang diagnostic push
        #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        id obj = [target performSelector:selector withObject:object];
        #pragma clang diagnostic pop
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self removeBALoadingAnimationFromView:superView];
            completion(obj);
        });
    });
}

+(void)runBALoadingAnimation:(BALoadingAnimationType)animationType whileSelector:(SEL)selector withTarget:(id)target andObject:(id)object runsOnView:(UIView *)superView withCompletion:(BACompletionReturnBlock)completion
{
    BALoadingAnimationConfig *config = [BALoadingAnimationConfig sharedInstance];
    [self runBALoadingAnimation:animationType whileSelector:selector withTarget:target andObject:object runsOnView:superView withStyling:config andCompletion:completion];
}

+(void)runBALoadingAnimation:(BALoadingAnimationType)animationType onView:(UIView *)superView withStyling:(BALoadingAnimationConfig *)config whileExecuting:(BAExecutionBlock)work withCompletion:(BACompletionBlock)completion
{
    [self addBALoadingAnimation:animationType toView:superView withStyling:config];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        // Do something...
        work();
        dispatch_async(dispatch_get_main_queue(), ^{
            [self removeBALoadingAnimationFromView:superView];
            completion();
        });
    });
}

+(void)runBALoadingAnimation:(BALoadingAnimationType)animationType onView:(UIView *)superView whileExecuting:(BAExecutionBlock)work withCompletion:(BACompletionBlock)completion
{
    BALoadingAnimationConfig *config = [BALoadingAnimationConfig sharedInstance];
    [BALoadingAnimation runBALoadingAnimation:animationType onView:superView withStyling:config whileExecuting:work withCompletion:completion];
}

+(void)addBALoadingAnimation:(BALoadingAnimationType)animationType toView:(UIView *)superView
{
    // ensure singleton is created
    BALoadingAnimationConfig *config = [BALoadingAnimationConfig sharedInstance];
    [BALoadingAnimation addBALoadingAnimation:animationType toView:superView withStyling:config];
}


+(void)addBALoadingAnimation:(BALoadingAnimationType)animationType toView:(UIView *)superView withStyling:(BALoadingAnimationConfig *)config
{
    // get the correct animationview
    BAAnimationView *animationView = [BALoadingAnimation animationViewForAnimationType: animationType];
    // get frames for sub and super views
    CGRect loadingAnimationFrame = [BALoadingAnimation frameForLoadingAnimationWithSuperview:superView andSubview:animationView];
    // create this view
    BALoadingAnimation *loadingAnimation = [[BALoadingAnimation alloc] initWithFrame:loadingAnimationFrame animationView:animationView andBAConfig:config];
    // add to parent view
    [superView addSubview:loadingAnimation];
    [animationView startAnimation];
}

+(CGRect)frameForLoadingAnimationWithSuperview:(UIView *)superView andSubview:(BAAnimationView *)subview
{
    CGRect subviewFrame = subview.frame;
    CGRect superviewFrame = superView.frame;
    // get size
    CGFloat height = MARGIN*1.5 + subviewFrame.size.height + LABEL_HEIGHT;
    // set for message shown
    if(![BALoadingAnimationConfig showsMessage])
    {
        height = 2*MARGIN + subviewFrame.size.height;
    }
    CGFloat width = MARGIN*2 + subviewFrame.size.width;
    // get origin
    CGFloat x = (superviewFrame.size.width - width)/2;
    CGFloat y = (superviewFrame.size.height - height)/2;
    
    return CGRectMake(x, y, width, height);
}

+(CGRect)frameForAnimationType:(BALoadingAnimationType)animationType
{
    CGRect rect;
    switch (animationType)
    {
        case BALoadingAnimationTypeDefault:
        case BALoadingAnimationTypeSpinner:
            // todo
            rect = CGRectMake(MARGIN, MARGIN, 50, 50);
            break;
        case BALoadingAnimationTypePulse:
            rect = CGRectMake(MARGIN, MARGIN, 80, 80);
            break;
        case BALoadingAnimationTypeWave:
            // todo
            break;
        case BALoadingAnimationTypeRipple:
            rect = CGRectMake(MARGIN, MARGIN, 80, 80);
            break;
        default:
            // should never reach here
            NSLog(@"\n\nBALoadingAnimation Error: incorrect BALoadingAnimationType used in class method.\n\n");
            exit(-1);
            break;
    }
    return  rect;
}

+(BAAnimationView *)animationViewForAnimationType:(BALoadingAnimationType)animationType
{
    BAAnimationView *animationView = nil;
    switch (animationType)
    {
        case BALoadingAnimationTypeDefault:
        case BALoadingAnimationTypeSpinner:
            animationView = [[BASpinnerAnimationView alloc] initWithFrame:[BALoadingAnimation frameForAnimationType:animationType]];
            break;
        case BALoadingAnimationTypePulse:
            animationView = [[BAPulseAnimationView alloc] initWithFrame:[BALoadingAnimation frameForAnimationType:animationType]];
            break;
        case BALoadingAnimationTypeWave:
            // todo
            break;
        case BALoadingAnimationTypeRipple:
            animationView = [[BARippleAnimationView alloc] initWithFrame:[BALoadingAnimation frameForAnimationType:animationType]];
            break;
        default:
            // should never reach here
            NSLog(@"\n\nBALoadingAnimation Error: incorrect BALoadingAnimationType used in class method.\n\n");
            exit(-1);
            break;
    }
    return  animationView;
}

+(void)removeBALoadingAnimationFromView:(UIView *)superView
{
    for (UIView *subview in superView.subviews) {
        if([subview isKindOfClass:[BALoadingAnimation class]])
        {
            BALoadingAnimation *loadingAnimation = ((BALoadingAnimation *)subview);
            [loadingAnimation.animationView stopAnimation];
            [loadingAnimation removeFromSuperview];
        }
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
