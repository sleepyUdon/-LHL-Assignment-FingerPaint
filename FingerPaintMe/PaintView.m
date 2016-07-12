//
//  PaintView.m
//  FingerPaintMe
//
//  Created by steve on 2016-07-08.
//  Copyright © 2016 steve. All rights reserved.
//

#import "PaintView.h"
#import "Line.h"

@interface PaintView()
@property (nonatomic, strong) NSMutableArray *lines;
@end

@implementation PaintView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        _lines = [NSMutableArray array];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    UIBezierPath *path = [[UIBezierPath alloc]init];
    path.lineWidth = 12.0;
    path.lineCapStyle = kCGLineCapRound;
    [[UIColor blueColor] set];
    
    for (Line *line in self.lines) {
        [path moveToPoint:line.start];
        [path addLineToPoint:line.end];
    }
    [path stroke];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint start = [touch previousLocationInView:self];
    CGPoint end = [touch locationInView:self];
    NSLog(@"%s start:%@ end:%@", __PRETTY_FUNCTION__, NSStringFromCGPoint(start), NSStringFromCGPoint(end));
    Line *line = [[Line alloc] initWithStart:start end:end];
    [self.lines addObject:line];
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint start = [touch previousLocationInView:self];
    CGPoint end = [touch locationInView:self];
    NSLog(@"%s start:%@ end:%@", __PRETTY_FUNCTION__, NSStringFromCGPoint(start), NSStringFromCGPoint(end));
    Line *line = [[Line alloc] initWithStart:start end:end];
    [self.lines addObject:line];
    [self setNeedsDisplay];
}

@end
