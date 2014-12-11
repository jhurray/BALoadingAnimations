//
//  BARippleAnimationView.m
//  BALoadingAnimations
//
//  Created by Jeff Hurray on 7/20/14.
//  Copyright (c) 2014 jhurray. All rights reserved.
//

#define OPACITY_FROM 1.0
#define OPACITY_TO 0.0
#define SCALE_FROM 0.0
#define SCALE_TO 1.0
#define DURATION 1.5

#import "BARippleAnimationView.h"

@interface BARippleAnimationView()

@property (nonatomic, strong) CALayer *circleLayer1;
@property (nonatomic, strong) CALayer *circleLayer2;
@property (nonatomic, strong) CALayer *circleLayer3;

@end

@implementation BARippleAnimationView

-(id) initWithConfig:(BALoadingAnimationConfig *)config andFrame:(CGRect)frame;
{
    if (self = [super initWithConfig:config andFrame:frame])
    {
        // config sterf
        self.circleLayer1 = [self makeCircleLayerWithBorderWidth:2.0];
        self.circleLayer2 = [self makeCircleLayerWithBorderWidth:6.0];
        self.circleLayer3 = [self makeCircleLayerWithBorderWidth:4.0];
    }
    return self;
}

-(CALayer *)makeCircleLayerWithBorderWidth:(CGFloat)width
{
    CALayer *circleLayer = [[CALayer alloc] init];
    circleLayer.backgroundColor = [UIColor clearColor].CGColor;
    circleLayer.borderColor = [BALoadingAnimationConfig secondaryColor].CGColor;
    circleLayer.borderWidth = width;
    CGSize size = self.frame.size;
    circleLayer.cornerRadius = size.width/2;
    circleLayer.frame = CGRectMake(0, 0, size.width, size.height);
    return circleLayer;
}

-(void) addRippleAnimationToLayer:(CALayer *)layer
{
    CABasicAnimation *opacity = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacity.toValue = [NSNumber numberWithFloat:OPACITY_TO];
    opacity.fromValue = [NSNumber numberWithFloat:OPACITY_FROM];
    
    CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scale.toValue = [NSNumber numberWithFloat:SCALE_TO];
    scale.fromValue = [NSNumber numberWithFloat:SCALE_FROM];
    
    CAAnimationGroup *animations = [CAAnimationGroup animation];
    [animations setAnimations:[NSArray arrayWithObjects:opacity, scale, nil]];
    animations.duration = DURATION;
    animations.repeatCount = HUGE_VALF;
    
    [self.layer addSublayer:layer];
    [layer addAnimation:animations forKey:@"ripple"];
}

-(void)ripple
{
    [self performSelector:@selector(addRippleAnimationToLayer:) withObject:self.circleLayer1 afterDelay:0.0];
    [self performSelector:@selector(addRippleAnimationToLayer:) withObject:self.circleLayer2 afterDelay:DURATION/3.0];
    [self performSelector:@selector(addRippleAnimationToLayer:) withObject:self.circleLayer3 afterDelay:DURATION*2/3.0];
}

-(void)startAnimation
{
    [self ripple];
}

-(void)stopAnimation
{
    [self.circleLayer1 removeAnimationForKey:@"ripple"];
    [self.circleLayer2 removeAnimationForKey:@"ripple"];
    [self.circleLayer3 removeAnimationForKey:@"ripple"];
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
