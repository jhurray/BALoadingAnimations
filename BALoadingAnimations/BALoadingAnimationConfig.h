//
//  BALoadingAnimationConfig.h
//  BALoadingAnimations
//
//  Created by Jeff Hurray on 7/18/14.
//  Copyright (c) 2014 jhurray. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BALoadingAnimationConfig : NSObject

// singleton
+(BALoadingAnimationConfig *) sharedInstance;

// inits
+(BALoadingAnimationConfig *)customConfigWithMessage:(NSString *)message andPrimaryColor:(UIColor *)primaryColor andSecondaryColor:(UIColor *)secondaryColor andTintColor:(UIColor *)tintColor andFont:(UIFont *)font;

// getters
+(NSString *)message;
+(UIColor *)primaryColor;
+(UIColor *)secondaryColor;
+(UIColor *)tintColor;
+(UIFont *)font;
// instance
-(NSString *)message;
-(UIColor *)primaryColor;
-(UIColor *)secondaryColor;
-(UIColor *)tintColor;
-(UIFont *)font;
-(BOOL)showsMessage;
-(void)setMessageShown:(BOOL)yayOrNay;

// setters
+(void)setMessage:(NSString *)message;
+(void)setFont:(UIFont *)font;
+(void)setPrimaryColor:(UIColor *)primaryColor;
+(void)setSecondaryColor:(UIColor *)secondaryColor;
+(void)setTintColor:(UIColor *)tintColor;
+(void)setPrimaryColor:(UIColor *)primaryColor andSecondaryColor:(UIColor *)secondaryColor andTintColor:(UIColor *)tintColor;
+(BOOL)showsMessage;
+(void)setMessageShown:(BOOL)yayOrNay;

@end
