//
//  ViewController.h
//  HLProgresssViewSample
//
//  Created by Hervé Droit on 25/11/2013.
//  Copyright (c) 2013 Fifty Degrees. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HLProgressView.h"

@interface ViewController : UIViewController
{
    NSInteger iCurrentProgress;
    NSTimer   *timer;
}

@property (weak, nonatomic) IBOutlet HLProgressView *progressView;
@property (weak, nonatomic) IBOutlet HLProgressView *progressViewReversed;

- (IBAction)didTapStartLoading:(id)sender;

@end
