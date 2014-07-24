//
//  BAFlowAnimationView.m
//  BALoadingAnimations
//
//  Created by Jeff Hurray on 7/22/14.
//  Copyright (c) 2014 jhurray. All rights reserved.
//

#import "BAFlowAnimationView.h"

@interface BAFlowAnimationView()

@property (nonatomic) float orbitSize;
@property (nonatomic) float planetSize;
@property (nonatomic) float speed;
@property (nonatomic) UIColor *color;

@end


/**
 *
 *  THIS IS GROSS CODE
 *
 *  THIS WILL BE CLEANED UP LATER 
 * 
 *  ( 7/23/2014 )
 */

@implementation BAFlowAnimationView

-(id) initWithConfig:(BALoadingAnimationConfig *)config andFrame:(CGRect)frame;
{
    if (self = [super initWithConfig:config andFrame:frame])
    {
        // config sterf
        self.planetSize = self.frame.size.height / 6.0;
        self.orbitSize = self.frame.size.height * 2 / 5.0;
        self.speed = 2.0;
        self.color = [BALoadingAnimationConfig secondaryColor];
        
    }
    return self;
}

-(void)startAnimation
{
    // override
    [self start];
}

-(void)stopAnimation
{
    // override
    [self stop];
}

-(void)addPlanet
{
    CALayer *orbit = [CALayer layer];
    orbit.bounds = CGRectMake(0, 0, self.orbitSize, self.orbitSize);
    orbit.position = CGPointMake(self.planetSize/2, self.planetSize/2);
    orbit.borderWidth = 0;
    orbit.borderColor = self.color.CGColor;
    orbit.cornerRadius = self.orbitSize/2;
    [self.layer addSublayer:orbit];
}

-(void)start
{
    
    CALayer *planet1 = [CALayer layer];
    planet1.bounds = CGRectMake(0, 0, self.planetSize, self.planetSize);
    planet1.position = CGPointMake(self.frame.size.height/2, self.frame.size.height/2);
    planet1.backgroundColor = [UIColor clearColor].CGColor;
    planet1.cornerRadius = self.planetSize/2;
    [self.layer addSublayer:planet1];
    
    CALayer *orbit1 = [CALayer layer];
    orbit1.bounds = CGRectMake(0, 0, self.orbitSize, self.orbitSize);
    orbit1.position = CGPointMake(self.planetSize/2, self.planetSize/2);
    orbit1.borderWidth = 0;
    orbit1.borderColor = self.color.CGColor;
    orbit1.cornerRadius = self.orbitSize/2;
    [planet1 addSublayer:orbit1];
    
    CALayer *planet2 = [CALayer layer];
    planet2.bounds = CGRectMake(0, 0, self.planetSize, self.planetSize);
    planet2.position = CGPointMake(self.orbitSize, self.orbitSize/2);
    planet2.backgroundColor = self.color.CGColor;
    planet2.cornerRadius = self.planetSize/2;
    [orbit1 addSublayer:planet2];
    
    CALayer *orbit2 = [CALayer layer];
    orbit2.bounds = CGRectMake(0, 0, self.orbitSize, self.orbitSize);
    orbit2.position = CGPointMake(self.planetSize/2, self.planetSize/2);
    orbit2.borderWidth = 0;
    orbit2.borderColor = self.color.CGColor;
    orbit2.cornerRadius = self.orbitSize/2;
    [planet2 addSublayer:orbit2];
    
    CALayer *planet3 = [CALayer layer];
    planet3.bounds = CGRectMake(0, 0, self.planetSize, self.planetSize);
    planet3.position = CGPointMake(self.orbitSize, self.orbitSize/2);
    planet3.backgroundColor = self.color.CGColor;
    planet3.cornerRadius = self.planetSize/2;
    [orbit2 addSublayer:planet3];
    
    CALayer *planet4 = [CALayer layer];
    planet4.bounds = CGRectMake(0, 0, self.planetSize, self.planetSize);
    planet4.position = CGPointMake(self.orbitSize/2, self.orbitSize);
    planet4.backgroundColor = self.color.CGColor;
    planet4.cornerRadius = self.planetSize/2;
    [orbit1 addSublayer:planet4];
    
    CALayer *orbit3 = [CALayer layer];
    orbit3.bounds = CGRectMake(0, 0, self.orbitSize, self.orbitSize);
    orbit3.position = CGPointMake(self.planetSize/2, self.planetSize/2);
    orbit3.borderWidth = 0;
    orbit3.borderColor = self.color.CGColor;
    orbit3.cornerRadius = self.orbitSize/2;
    [planet4 addSublayer:orbit3];
    
    CALayer *planet5 = [CALayer layer];
    planet5.bounds = CGRectMake(0, 0, self.planetSize, self.planetSize);
    planet5.position = CGPointMake(self.orbitSize/2, self.orbitSize);
    planet5.backgroundColor = self.color.CGColor;
    planet5.cornerRadius = self.planetSize/2;
    [orbit3 addSublayer:planet5];
    
    CALayer *planet6 = [CALayer layer];
    planet6.bounds = CGRectMake(0, 0, self.planetSize, self.planetSize);
    planet6.position = CGPointMake(0, self.orbitSize/2);
    planet6.backgroundColor = self.color.CGColor;
    planet6.cornerRadius = self.planetSize/2;
    [orbit1 addSublayer:planet6];
    
    CALayer *orbit4 = [CALayer layer];
    orbit4.bounds = CGRectMake(0, 0, self.orbitSize, self.orbitSize);
    orbit4.position = CGPointMake(self.planetSize/2, self.planetSize/2);
    orbit4.borderWidth = 0;
    orbit4.borderColor = self.color.CGColor;
    orbit4.cornerRadius = self.orbitSize/2;
    [planet6 addSublayer:orbit4];
    
    CALayer *planet7 = [CALayer layer];
    planet7.bounds = CGRectMake(0, 0, self.planetSize, self.planetSize);
    planet7.position = CGPointMake(0, self.orbitSize/2);
    planet7.backgroundColor = self.color.CGColor;
    planet7.cornerRadius = self.planetSize/2;
    [orbit4 addSublayer:planet7];
    
    CALayer *planet8 = [CALayer layer];
    planet8.bounds = CGRectMake(0, 0, self.planetSize, self.planetSize);
    planet8.position = CGPointMake(self.orbitSize/2, 0);
    planet8.backgroundColor = self.color.CGColor;
    planet8.cornerRadius = self.planetSize/2;
    [orbit1 addSublayer:planet8];
    
    CALayer *orbit5 = [CALayer layer];
    orbit5.bounds = CGRectMake(0, 0, self.orbitSize, self.orbitSize);
    orbit5.position = CGPointMake(self.planetSize/2, self.planetSize/2);
    orbit5.borderWidth = 0;
    orbit5.borderColor = self.color.CGColor;
    orbit5.cornerRadius = self.orbitSize/2;
    [planet8 addSublayer:orbit5];
    
    CALayer *planet9 = [CALayer layer];
    planet9.bounds = CGRectMake(0, 0, self.planetSize, self.planetSize);
    planet9.position = CGPointMake(self.orbitSize/2, 0);
    planet9.backgroundColor = self.color.CGColor;
    planet9.cornerRadius = self.planetSize/2;
    [orbit5 addSublayer:planet9];
    
    [self addGroupAnimationToLayer:orbit1];
    [self addSpinAnimationToLayer:orbit2];
    [self addSpinAnimationToLayer:orbit3];
    [self addSpinAnimationToLayer:orbit4];
    [self addSpinAnimationToLayer:orbit5];
}

- (void)stop
{
    self.layer.sublayers = nil;
    [UIView animateWithDuration:0.00001 animations:^{
        self.alpha = 0;
    }];
}



- (void)addGroupAnimationToLayer:(CALayer*)layer
{
    CAAnimationGroup *group = [CAAnimationGroup animation];
    
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    anim.fromValue = (NSNumber*)[layer valueForKeyPath:@"transform.rotation"];
    anim.toValue = [NSNumber numberWithFloat:[(NSNumber*)[layer valueForKeyPath:@"transform.rotation"] floatValue] + 2 * M_PI];
    anim.repeatCount = HUGE_VALF;
    anim.duration = self.speed;
    //[layer addAnimation:anim forKey:@"transform"];
    
    CABasicAnimation *anim2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    anim2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    anim2.fromValue = [NSNumber numberWithFloat:1];
    anim2.toValue = [NSNumber numberWithFloat:0.5];
    anim2.repeatCount = HUGE_VALF;
    anim2.duration = self.speed/2.0;
    anim2.autoreverses = true;
    //[layer addAnimation:anim forKey:@"transform"];
    
    group.animations = [NSArray arrayWithObjects: anim, anim2, nil];
    group.duration = self.speed;
    group.repeatCount = HUGE_VALF;
    //group.autoreverses = true;
    [layer addAnimation:group forKey:@"transform"];
}

- (void)addSpinAnimationToLayer:(CALayer*)layer
{
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    anim.fromValue = [NSNumber numberWithFloat:0];
    anim.toValue = [NSNumber numberWithFloat:2 * M_PI];
    anim.repeatCount = HUGE_VALF;
    anim.duration = self.speed;
    [layer addAnimation:anim forKey:@"transform"];
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
