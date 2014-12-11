//
//  BAWaveAnimationView.m
//  BALoadingAnimations
//
//  Created by Jeff Hurray on 7/20/14.
//  Copyright (c) 2014 jhurray. All rights reserved.
//

#import "BAWaveAnimationView.h"

@implementation BAWaveAnimationView

-(id) initWithConfig:(BALoadingAnimationConfig *)config andFrame:(CGRect)frame;
{
    if (self = [super initWithConfig:config andFrame:frame])
    {
        // config sterf
        [self setBackgroundColor:[UIColor clearColor]];

    }
    return self;
}

-(void)startAnimation
{
    // override
}

-(void)stopAnimation
{
    // override
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
