//
//  ViewController.m
//  HLProgresssViewSample
//
//  Created by Hervé Droit on 25/11/2013.
//  Copyright (c) 2013 Fifty Degrees. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.progressView setColor:[UIColor colorWithRed:26./255.
                                                green:188./255.
                                                 blue:156./255.
                                                alpha:1.0]];
    [self.progressView setWidth:1];
    
    [self.progressViewReversed setColor:[UIColor colorWithRed:52./255.
                                                green:152./255.
                                                 blue:219./255.
                                                alpha:1.0]];
    [self.progressViewReversed setWidth:1];
}

- (IBAction)didTapStartLoading:(id)sender
{
    [timer invalidate];
    [self.progressView setCurrentProgress:0.0f];
    [self.progressViewReversed setCurrentProgress:0.0f];
    iCurrentProgress = 0;
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.05f
                                             target:self
                                           selector:@selector(incrementProgressesView)
                                           userInfo:nil
                                            repeats:YES];
}

- (void)incrementProgressesView
{
    [self.progressView setCurrentProgress:(float)(iCurrentProgress) / 100.];
    [self.progressViewReversed setCurrentProgress:1. - ((float)(iCurrentProgress) / 100.)];
    
    if (iCurrentProgress == 100)
        [timer invalidate];
    iCurrentProgress++;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
