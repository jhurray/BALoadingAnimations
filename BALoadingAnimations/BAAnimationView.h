//
//  BAAnimationView.h
//  BALoadingAnimations
//
//  Created by Jeff Hurray on 7/18/14.
//  Copyright (c) 2014 jhurray. All rights reserved.
//

#include "BALoadingAnimationConfig.h"
#import <UIKit/UIKit.h>

@interface BAAnimationView : UIView

-(id) initWithConfig:(BALoadingAnimationConfig *)config andFrame:(CGRect)frame;

-(void) startAnimation;
-(void) stopAnimation;


@end
