//
//  ViewController.m
//  Sample
//
//  Created by Ignacio on 3/29/14.
//  Copyright (c) 2014 DZN Labs. All rights reserved.
//

#import "ViewController.h"
#import "DZNWebViewController.h"

@interface ViewController () {
    DZNWebViewController *_controller;
}
@end

@implementation ViewController

+ (void)initialize
{
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:15.0],
                                                           NSForegroundColorAttributeName: [UIColor darkGrayColor]}];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(presentWebViewController:)];
    [self.view addGestureRecognizer:gesture];
}

- (void)presentWebViewController:(id)sender
{
    NSURL *URL = [NSURL URLWithString:@"http://www.objc.io/"];
    
    _controller = [[DZNWebViewController alloc] initWithURL:URL];
    _controller.toolbarTintColor = [UIColor whiteColor];
    _controller.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismissWebViewController:)];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:_controller];
    [self presentViewController:navigationController animated:YES completion:NULL];
}

- (void)dismissWebViewController:(id)sender
{
    [_controller dismissViewControllerAnimated:YES completion:^{
        _controller = nil;
    }];
}

@end