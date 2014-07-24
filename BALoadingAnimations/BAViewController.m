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
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setupButtons];
}

-(NSString *)makeBigRequestWithURL:(NSString *)url
{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:url]];
    
    NSError *error = [[NSError alloc] init];
    NSHTTPURLResponse *responseCode = nil;
    
    NSData *oResponseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];
    
    if([responseCode statusCode] != 200){
        NSLog(@"Error getting %@, HTTP status code %i", url, [responseCode statusCode]);
        //return nil;
    }
    
    NSString *str = [[NSString alloc] initWithData:oResponseData encoding:NSUTF8StringEncoding];
    
    return str;
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
    
    UIButton *req = [UIButton buttonWithType:UIButtonTypeCustom];
    [req setBackgroundColor:[UIColor colorWithRed:0.168 green:0.604 blue:1.000 alpha:1.000]];
    [req setTitle:@"Make big request" forState:UIControlStateNormal];
    [req setFrame:CGRectMake(0, self.view.frame.size.height-130, self.view.frame.size.width, 50)];
    [req addTarget:self action:@selector(bigRequest) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:req];
}

-(void)bigRequest
{
    // run large request asyncronously with BALoadingAnimation
    
    __block NSString *results = @"";
    NSString *url = @"http://www.vacasso.com/api/city/fetchall";
    
    [BALoadingAnimation runBALoadingAnimation:BALoadingAnimationTypeFlow onView:self.view whileExecuting:^{
        results = [self makeBigRequestWithURL:url];
    } withCompletion:^{
        NSLog(@"\n\n SUCCESS!!! \n\n");
        NSLog(@"%@", results);
    }];
    
    /**************************    EQUIVILENT CODE    **********************************/
    
    /*
     [BALoadingAnimation addBALoadingAnimation:BALoadingAnimationTypeDefault toView:self.view];
     dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
     
     results = [self makeBigRequestWithURL:url];
     
        dispatch_async(dispatch_get_main_queue(), ^{
            [self removeBALoadingAnimationFromView:self.view];
     
        });
     });
     
     */
    
    /**************************    OR DO THIS    **********************************/
    
    /*
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:url]];
    __weak id weakSelf = self;
    
    [BALoadingAnimation addBALoadingAnimation:BALoadingAnimationTypeDefault toView:self.view];
    
    [NSURLConnection sendAsynchronousRequest:request queue:nil completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        [BALoadingAnimationConfig setMessage:@"handling response..."];
        id stuff = [weakSelf doSomethingWithResponse:response];
        [weakSelf doMoreWithStuff:stuff];
        [BALoadingAnimation removeBALoadingAnimationFromView:(UIView *)superView];
    }];
    */
}

-(void)start
{
    // Only necessary if wishing to add views indefinitely and remove with a button touch
    [BALoadingAnimation addBALoadingAnimation:BALoadingAnimationTypeFlow toView:self.view];
}

-(void)end
{
    // Only necessary if wishing to add views indefinitely and remove with a button touch
    [BALoadingAnimation removeBALoadingAnimationFromView:self.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
