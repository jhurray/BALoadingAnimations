//
//  BAAnimationView.m
//  BALoadingAnimations
//
//  Created by Jeff Hurray on 7/18/14.
//  Copyright (c) 2014 jhurray. All rights reserved.
//

#import "BAAnimationView.h"

@implementation BAAnimationView

- (id)initWithFrame:(CGRect)frame
{
    return [self initWithConfig:[BALoadingAnimationConfig sharedInstance] andFrame:frame];
}

-(id) initWithConfig:(BALoadingAnimationConfig *)config andFrame:(CGRect)frame;
{
    if (self = [super initWithFrame:frame])
    {
        // config sterf
        [self setBackgroundColor:[UIColor clearColor]];
        //[self.layer setBorderWidth:1.0];
        //[self.layer setBorderColor:config.secondaryColor.CGColor];
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
