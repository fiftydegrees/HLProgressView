//
//  HLProgressView.h
//  CircleProject
//
//  Created by Hervé HEURTAULT DE LAMMERVILLE on 25/11/13.
//  Copyright (c) 2013 Emmanuel Pérez. All rights reserved.
//

#import <UIKit/UIKit.h>

#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)

@interface HLProgressView : UIView

#pragma mark - HLProgressView Configuration

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, assign) NSInteger width;

#pragma mark - HLProgressView Features

@property (nonatomic, assign) CGFloat progress;

@end
