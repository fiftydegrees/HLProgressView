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

@property (nonatomic, weak)   CAShapeLayer *circleLayer;
@property (nonatomic, assign) CGPoint       circleCenter;
@property (nonatomic, assign) CGFloat       circleRadius;

@property (nonatomic, strong) UIColor      *lineColor;
@property (nonatomic, assign) NSInteger     iLineWidth;

@end

@implementation HLProgressView

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

- (id)initComposants
{
    self.circleLayer = [CAShapeLayer layer];
    self.circleLayer.strokeColor = [[UIColor blackColor] CGColor];
    self.circleLayer.fillColor = nil;
    self.circleLayer.lineWidth = 1.0f;
    
    return self;
}

#pragma mark - Configuration

- (void)setColor :(UIColor *)color
{
    if (!color)
        self.circleLayer.strokeColor = [[UIColor blackColor] CGColor];
    self.circleLayer.strokeColor = [color CGColor];
}

- (void)setWidth :(NSInteger)width
{
    if (width < 0)
        width = 0;
    else if (width > MIN(self.frame.size.width, self.frame.size.height) / 2)
        width = MIN(self.frame.size.width, self.frame.size.height) / 2;
    self.circleLayer.lineWidth = width;
}

#pragma mark - HLProgressView Main features

- (void)setCurrentProgress :(CGFloat)fCurrentProgress
{
    self.circleCenter = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
    self.circleRadius = MIN(self.frame.size.width / 2, self.frame.size.width / 2);
    
    if (fCurrentProgress < 0.)
        fCurrentProgress = 0.;
    else if (fCurrentProgress > 1.)
        fCurrentProgress = 1.;
    
    self.circleLayer.path = [[self makeCircleWidthProgress:fCurrentProgress] CGPath];
    
    for (CALayer *layer in self.layer.sublayers)
        [layer removeFromSuperlayer];
    [self.layer addSublayer:self.circleLayer];
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
