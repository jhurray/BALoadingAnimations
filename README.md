BALoadingAnimations
======

**An animated wrapper around asynchronous operations.**

Performs code in blocks and selectors asynchronously while presenting a loading animation.
When the work is done, the loading animation is removed from the view.

Styling / Configuration
--------------

Many loading animations:
..*Spinner (Default)
..*Ripple
..*Wave
..*Pulse

BALoadingAnimationConfig class methods change a singleton, which is used as the default configuration for all BALoadingAnimations

Use the  class methods to style the loading animations.

**OR...**

Create your own and pass it into a BALoadingAnimation class method if you want it to be different than your own default.

Basic Use
-----------

Add outside an async call and remove after that operation is completed.
**Never wrap these animations around operations on the main thread. This may cause animations to be delayed**

    [BALoadingAnimation addBALoadingAnimation:BALoadingAnimationTypeDefault toView:self.view];
         dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
     
           [self makeBigRequestWithURL:url];
     
            dispatch_async(dispatch_get_main_queue(), ^{
                [self removeBALoadingAnimationFromView:self.view];
     
            });
         });


Selectors
----------
Wrap any selector in a BALoadingAnimation. Passes the return value from the selector (if any) through in the callback.

     [BALoadingAnimation runBALoadingAnimation:BALoadingAnimationTypeDefault whileSelector:@selector(makeBigRequestWithURL:) withTarget:self andObject:url runsOnView:self.view withCallback:^(id object) {
     	
     	if(object)
     	{
     		NSLog(@"object returned from selector");
     	}
     	else 
     	{
     		NSLog(@"nothing returned from selector");
     	}

     }];

Blocks
--------

Any code placed in a BAExecutionBlock will be run asynchronously and wrapped in a BALoadinganimation that is removed before completion block is called. 

    __block NSString *results = @"";
    
    [BALoadingAnimation runBALoadingAnimation:BALoadingAnimationTypeDefault onView:self.view whileExecuting:^{
        results = [self makeBigRequestWithURL:url];
    } withCompletion:^{
        NSLog(@"%@", results);
    }];


Custom Loading Animations
----------------

To create your own Custom loading animations subclass BAAnimationView and add a BALoadingAnimationType in the BALoadingAnimation.h file. Then update     
**+(CGRect)frameForAnimationType:(BALoadingAnimationType)animationType**    
and    
**+(BAAnimationView *)animationViewForAnimationType:(BALoadingAnimationType)animationType**    
appropriately in BALoadingAnimation.m.  




