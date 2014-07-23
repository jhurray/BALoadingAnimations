//
//  BALoadingAnimationConfig.m
//  BALoadingAnimations
//
//  Created by Jeff Hurray on 7/18/14.
//  Copyright (c) 2014 jhurray. All rights reserved.
//

#define DEFAULT_MESSAGE @"Loading..."
#define DEFAULT_PRIMARY_COLOR [UIColor colorWithWhite:0.197 alpha:0.800]
#define DEFAULT_SECONDARY_COLOR [UIColor whiteColor]
#define DEFAULT_TINT_COLOR [UIColor colorWithRed:0.199 green:0.714 blue:0.850 alpha:1.000]
#define DEFAULT_FONT [UIFont systemFontOfSize:18]


#import "BALoadingAnimationConfig.h"

@interface BALoadingAnimationConfig()

@property (nonatomic) NSString *_message;
@property (nonatomic) UIColor *_primaryColor;
@property (nonatomic) UIColor *_secondaryColor; 
@property (nonatomic) UIColor *_tintColor;
@property (nonatomic) UIFont *_font;
@property (nonatomic) BOOL _showsMessage;

@end

@implementation BALoadingAnimationConfig

static BALoadingAnimationConfig *sharedClient;

+(BALoadingAnimationConfig *)sharedInstance {
    if(!sharedClient)
    {
        sharedClient = [[BALoadingAnimationConfig alloc] initWithDefaults];
    }
    return sharedClient;
}

+(void)sanityCheck
{
    [BALoadingAnimationConfig sharedInstance];
}

-(id) initWithDefaults
{
    self = [super init];
    if(self) {
        self._message = DEFAULT_MESSAGE;
        self._primaryColor = DEFAULT_PRIMARY_COLOR;
        self._secondaryColor = DEFAULT_SECONDARY_COLOR;
        self._tintColor = DEFAULT_TINT_COLOR;
        self._font = DEFAULT_FONT;
        self._showsMessage = TRUE;
    }
    return self;
}

-(id) initWithWithMessage:(NSString *)message andPrimaryColor:(UIColor *)primaryColor andSecondaryColor:(UIColor *)secondaryColor andTintColor:(UIColor *)tintColor andFont:(UIFont *)font
{
    self = [super init];
    if(self) {
        // message
        if(message)
        {
            self._message = message;
        }
        else
        {
            self._message = DEFAULT_MESSAGE;
        }
        // font
        if(font)
        {
            self._font = font;
        }
        else
        {
            self._font = DEFAULT_FONT;
        }
        // primary color
        if(primaryColor)
        {
            self._primaryColor = primaryColor;
        }
        else
        {
            self._primaryColor = DEFAULT_PRIMARY_COLOR;
        }
        // secondary color
        if(secondaryColor)
        {
            self._secondaryColor = secondaryColor;
        }
        else{
            self._secondaryColor = DEFAULT_SECONDARY_COLOR;
        }
        // tint color
        if(tintColor)
        {
            self._tintColor = tintColor;
        }
        else
        {
            self._tintColor = DEFAULT_TINT_COLOR;
        }
        self._showsMessage = TRUE;
    }
    return self;
}

+(BALoadingAnimationConfig *)customConfigWithMessage:(NSString *)message andPrimaryColor:(UIColor *)primaryColor andSecondaryColor:(UIColor *)secondaryColor andTintColor:(UIColor *)tintColor andFont:(UIFont *)font
{
    return [[BALoadingAnimationConfig alloc] initWithWithMessage:message andPrimaryColor:primaryColor andSecondaryColor:secondaryColor andTintColor:tintColor andFont:font];
}

+(NSString *)message
{
    [BALoadingAnimationConfig sanityCheck];
    return sharedClient._message;
}

+(UIFont *)font
{
    [BALoadingAnimationConfig sanityCheck];
    return sharedClient._font;
}

+(UIColor *)primaryColor
{
    [BALoadingAnimationConfig sanityCheck];
    return sharedClient._primaryColor;
}

+(UIColor *)secondaryColor
{
    [BALoadingAnimationConfig sanityCheck];
    return sharedClient._secondaryColor;
}

+(UIColor *)tintColor
{
    [BALoadingAnimationConfig sanityCheck];
    return sharedClient._tintColor;
}

+(BOOL)showsMessage
{
    [BALoadingAnimationConfig sanityCheck];
    return sharedClient._showsMessage;
}

-(NSString *)message
{
    return self._message;
}

-(UIFont *)font
{
    return self._font;
}

-(UIColor *)primaryColor
{
    return self._primaryColor;
}

-(UIColor *)secondaryColor
{
    return self._secondaryColor;
}

-(UIColor *)tintColor
{
    return self._tintColor;
}

-(BOOL)showsMessage
{
    return self._showsMessage;
}

-(void)setMessageShown:(BOOL)yayOrNay
{
    [BALoadingAnimationConfig sanityCheck];
    self._showsMessage = yayOrNay;
}

+(void)setMessage:(NSString *)message
{
    [BALoadingAnimationConfig sanityCheck];
    if(message)
    {
        sharedClient._message = message;
    }
    else
    {
        sharedClient._message = DEFAULT_MESSAGE;
    }
}

+(void)setFont:(UIFont *)font
{
    [BALoadingAnimationConfig sanityCheck];
    if(font)
    {
        sharedClient._font = font;
    }
    else
    {
        sharedClient._font = DEFAULT_FONT;
    }
}

+(void)setPrimaryColor:(UIColor *)primaryColor
{
    [BALoadingAnimationConfig sanityCheck];
    if(primaryColor)
    {
        sharedClient._primaryColor = primaryColor;
    }
    else
    {
        sharedClient._primaryColor = DEFAULT_PRIMARY_COLOR;
    }
}

+(void)setSecondaryColor:(UIColor *)secondaryColor
{
    [BALoadingAnimationConfig sanityCheck];
    if(secondaryColor)
    {
        sharedClient._secondaryColor = secondaryColor;
    }
    else{
        sharedClient._secondaryColor = DEFAULT_SECONDARY_COLOR;
    }
}

+(void)setTintColor:(UIColor *)tintColor
{
    [BALoadingAnimationConfig sanityCheck];
    if(tintColor)
    {
        sharedClient._tintColor = tintColor;
    }
    else
    {
        sharedClient._tintColor = DEFAULT_TINT_COLOR;
    }
}

+(void)setMessageShown:(BOOL)yayOrNay
{
    [BALoadingAnimationConfig sanityCheck];
    sharedClient._showsMessage = yayOrNay;
}

+(void)setPrimaryColor:(UIColor *)primaryColor andSecondaryColor:(UIColor *)secondaryColor andTintColor:(UIColor *)tintColor
{
    [BALoadingAnimationConfig setPrimaryColor:primaryColor];
    [BALoadingAnimationConfig setSecondaryColor:secondaryColor];
    [BALoadingAnimationConfig setTintColor:tintColor];
}


@end
