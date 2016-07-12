//
//  Line.m
//  FingerPaintMe
//
//  Created by steve on 2016-07-08.
//  Copyright © 2016 steve. All rights reserved.
//

#import "Line.h"

@implementation Line
- (instancetype)initWithStart:(CGPoint)start end:(CGPoint)end {
    if (self = [super init]) {
        _start = start;
        _end = end;
    }
    return self;
}
@end
