//
//  BAPulseAnimationView.m
//  BALoadingAnimations
//
//  Created by Jeff Hurray on 7/20/14.
//  Copyright (c) 2014 jhurray. All rights reserved.
//

#define SQUARES_ACROSS 4
#define SQUARES_DOWN 4
#define DURATION 0.25

#import "BAPulseAnimationView.h"

@interface BAPulseAnimationView()

@property (nonatomic, strong) NSMutableArray *squares;
@property (nonatomic, strong) NSMutableArray *litSquares;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation BAPulseAnimationView

-(id) initWithConfig:(BALoadingAnimationConfig *)config andFrame:(CGRect)frame;
{
    if (self = [super initWithConfig:config andFrame:frame])
    {
        // config sterf
        self.squares = [NSMutableArray array];
        self.litSquares = [NSMutableArray array];
        [self setupLayers];
        [self setupLitSquares];
        self.timer = [NSTimer scheduledTimerWithTimeInterval:DURATION target:self selector:@selector(lightSquares) userInfo:nil repeats:YES];
    }
    return self;
}

-(void) setupLayers
{
    
    for (double i = 0.0; i < SQUARES_ACROSS; ++i)
    {
        for (double j = 0.0; j < SQUARES_DOWN; ++j)
        {
            CGSize size = self.frame.size;
            CGRect squareFrame = CGRectMake(size.width*i/SQUARES_ACROSS, size.height*j/SQUARES_DOWN, size.width/SQUARES_ACROSS, size.height/SQUARES_DOWN);
            CALayer *square = [self makeSquareLayerWithFrame:squareFrame];
            [self.squares addObject:square];
            [self.layer addSublayer:square];
        }
    }
}

-(void) setupLitSquares
{
    
    for(int i = 0; i < self.squares.count; ++i)
    {
        if(i%2)
        {
            [self.litSquares addObject:[NSNumber numberWithInt:i]];
            CALayer *square =  [self.squares objectAtIndex:i];
            [self animateLightUpForSquare:square];
        }
    }
}

-(void)animateLightUpForSquare:(CALayer *)square
{
    CAKeyframeAnimation *colorsAnimation = [CAKeyframeAnimation animationWithKeyPath:@"backgroundColor"];
    colorsAnimation.values = [NSArray arrayWithObjects: (id)[BALoadingAnimationConfig tintColor].CGColor, (id)[BALoadingAnimationConfig secondaryColor].CGColor, nil];
    colorsAnimation.keyTimes = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.25], [NSNumber numberWithFloat:0.5], [NSNumber numberWithFloat:0.75],[NSNumber numberWithFloat:1.0], nil];
    colorsAnimation.calculationMode = kCAAnimationPaced;
    colorsAnimation.removedOnCompletion = NO;
    colorsAnimation.fillMode = kCAFillModeForwards;
    colorsAnimation.duration = DURATION;
    
    [square addAnimation:colorsAnimation forKey:@"colors"];
}

-(void) lightSquares
{
    for (int i = 0; i < self.litSquares.count; ++i)
    {
        unsigned int rand = arc4random_uniform((UInt32)self.squares.count);
        [self.litSquares replaceObjectAtIndex:i withObject:[NSNumber numberWithInt:rand]];
        CALayer *square = [self.squares objectAtIndex:rand];
        [self animateLightUpForSquare:square];
    }
}

-(CALayer *) makeSquareLayerWithFrame:(CGRect)frame
{
    CALayer *square = [[CALayer alloc] init];
    square.backgroundColor = [BALoadingAnimationConfig secondaryColor].CGColor;
    square.borderWidth = 1.5;
    square.borderColor = [BALoadingAnimationConfig primaryColor].CGColor;
    square.frame = frame;
    return square;
}

-(void)startAnimation
{
    // override
    [self.timer fire];
}

-(void)stopAnimation
{
    // override
    [self.timer invalidate];
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
