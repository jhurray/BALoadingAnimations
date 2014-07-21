//
//  BASpinnerAnimationView.m
//  BALoadingAnimations
//
//  Created by Jeff Hurray on 7/20/14.
//  Copyright (c) 2014 jhurray. All rights reserved.
//

#import "BASpinnerAnimationView.h"

@interface BASpinnerAnimationView()

@property (nonatomic, strong) UIActivityIndicatorView *spinner;

@end

@implementation BASpinnerAnimationView

-(id) initWithConfig:(BALoadingAnimationConfig *)config andFrame:(CGRect)frame;
{
    if (self = [super initWithConfig:config andFrame:frame])
    {
        // config sterf
        self.spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [self centerSpinner];
    }
    return self;
}

-(void)centerSpinner
{
    CGFloat spinnerX = (self.frame.size.width - self.spinner.frame.size.width)/2;
    CGFloat spinnerY= (self.frame.size.height - self.spinner.frame.size.height)/2;
    CGRect spinnerFrame = CGRectMake(spinnerX, spinnerY, self.spinner.frame.size.width, self.spinner.frame.size.height);
    [self.spinner setFrame:spinnerFrame];
}

-(void)startAnimation
{
    [self addSubview:self.spinner];
    [self.spinner startAnimating];
}

-(void)stopAnimation
{
    [self.spinner removeFromSuperview];
    [self.spinner stopAnimating];
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
