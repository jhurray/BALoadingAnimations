//
//  BAViewController.m
//  BALoadingAnimations
//
//  Created by Jeff Hurray on 7/18/14.
//  Copyright (c) 2014 jhurray. All rights reserved.
//
#import "BALoadingAnimation.h"
#import "BAViewController.h"

@interface BAViewController ()

@end

@implementation BAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor blueColor]];
    [self setupButtons];
    [BALoadingAnimationConfig setMessageShown:TRUE];
}

-(void)setupButtons
{
    UIButton *start = [UIButton buttonWithType:UIButtonTypeCustom];
    [start setBackgroundColor:[UIColor greenColor]];
    [start setTitle:@"Start" forState:UIControlStateNormal];
    [start setFrame:CGRectMake(0, self.view.frame.size.height-80, self.view.frame.size.width/2, 80)];
    [start addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:start];
    
    UIButton *end = [UIButton buttonWithType:UIButtonTypeCustom];
    [end setBackgroundColor:[UIColor redColor]];
    [end setTitle:@"Stop" forState:UIControlStateNormal];
    [end setFrame:CGRectMake(self.view.frame.size.width/2, self.view.frame.size.height-80, self.view.frame.size.width/2, 80)];
    [end addTarget:self action:@selector(end) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:end];
}

-(void)start
{
    [BALoadingAnimation addBALoadingAnimation:BALoadingAnimationTypePulse ToView:self.view];
}

-(void)end
{
    [BALoadingAnimation removeBALoadingAnimationFromView:self.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
