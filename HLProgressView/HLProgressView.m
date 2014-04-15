//
//  HLProgressView.m
//  CircleProject
//
//  Created by Hervé HEURTAULT DE LAMMERVILLE on 25/11/13.
//  Copyright (c) 2013 Emmanuel Pérez. All rights reserved.
//

#import "HLProgressView.h"
#import <QuartzCore/QuartzCore.h>

@interface HLProgressView ()

@property (nonatomic, strong) CAShapeLayer *circleLayer;
@property (nonatomic, assign) CGPoint       circleCenter;
@property (nonatomic, assign) CGFloat       circleRadius;

@end

@implementation HLProgressView

@synthesize color;
@synthesize width;
@synthesize progress;

- (id)init
{
    self = [super init];
    if (self)
    {
    }
    return [self initComposants];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
    }
    return [self initComposants];
}

 -(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
    }
    
    return [self initComposants];
}

- (id)initComposants
{
    self.circleLayer = [CAShapeLayer layer];
    self.circleLayer.strokeColor = [UIColor blackColor].CGColor;
    self.circleLayer.borderWidth = 1;
    
    return self;
}

#pragma mark - Configuration

- (void)setColor:(UIColor *)updatedColor
{
    if (!updatedColor)
        self.circleLayer.strokeColor = [UIColor blackColor].CGColor;
    self.circleLayer.strokeColor = updatedColor.CGColor;
}

- (UIColor *)color {
    return color;
}

- (void)setWidth:(NSInteger)updatedWidth
{
    if (updatedWidth < 0)
        updatedWidth = 0;
    else if (updatedWidth > MIN(self.frame.size.width, self.frame.size.height) / 2)
        updatedWidth = MIN(self.frame.size.width, self.frame.size.height) / 2;
    self.circleLayer.lineWidth = updatedWidth;
}

- (NSInteger)width {
    return width;
}

#pragma mark - HLProgressView Main features

- (void)setProgress:(CGFloat)updatedProgress
{
    updatedProgress = (updatedProgress < 0.) ? 0.0f : updatedProgress;
    updatedProgress = (updatedProgress > 1.) ? 1.0f : updatedProgress;
    
    self.circleLayer.fillColor = nil;
    
    self.circleCenter = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
    self.circleRadius = MIN(self.frame.size.width / 2, self.frame.size.width / 2);
    
    self.circleLayer.path = [self makeCircleWidthProgress:updatedProgress].CGPath;
    
    for (CALayer *layer in self.layer.sublayers)
        [layer removeFromSuperlayer];
    [self.layer addSublayer:self.circleLayer];
    
    progress = updatedProgress;
}

- (CGFloat)progress {
    return progress;
}

#pragma mark - Internal function

- (UIBezierPath *)makeCircleWidthProgress :(CGFloat)fProgress
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path addArcWithCenter:self.circleCenter
                    radius:self.circleRadius
                startAngle:DEGREES_TO_RADIANS(-90)
                  endAngle:DEGREES_TO_RADIANS(fProgress * 360 - 90)
                 clockwise:YES];
    
    return path;
}

@end
