//
//  Line.h
//  FingerPaintMe
//
//  Created by steve on 2016-07-08.
//  Copyright © 2016 steve. All rights reserved.
//

@import UIKit;

@interface Line : NSObject
@property CGPoint start;
@property CGPoint end;
- (instancetype)initWithStart:(CGPoint)start end:(CGPoint)end;
@end
