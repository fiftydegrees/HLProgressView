//
//  ViewController.m
//  HLProgresssViewSample
//
//  Created by Hervé Droit on 25/11/2013.
//  Copyright (c) 2013 Fifty Degrees. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSTimer *timer;
}

@end

@implementation ViewController

#pragma mark -
#pragma mark - ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.progressView.color = [UIColor redColor];
    self.progressView.width = 1;
    
    self.progressViewReversed.color = [UIColor blueColor];
    self.progressViewReversed.width = 4;
}

#pragma mark -
#pragma mark - ProgressView Demonstration Purpose

- (IBAction)didTapStartLoading:(id)sender
{
    [timer invalidate];
    
    self.progressView.progress = 0.0f;
    self.progressViewReversed.progress = 1.0f;
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.05f
                                             target:self
                                           selector:@selector(incrementProgressesView)
                                           userInfo:nil
                                            repeats:YES];
}

- (void)incrementProgressesView
{
    self.progressView.progress += 0.01f;
    self.progressViewReversed.progress -= 0.01f;
    
    if (self.progressView.progress >= 1.0f ||
        self.progressViewReversed.progress <= 0.0f)
        [timer invalidate];
}

#pragma mark -
#pragma mark - System

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
