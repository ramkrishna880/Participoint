//
//  PPSwitch.m
//  ParticiPoint
//
//  Created by PTG on 25/07/16.
//  Copyright © 2016 People Tech Group. All rights reserved.
//

#import "PPSwitch.h"

@implementation PPSwitch

- (void)awakeFromNib {
    [self setInit];
}

- (id)init {
    if (self == [super init]) {
        [self setInit];
    }
    return self;
}

- (void)setInit {
    self.onTintColor = [UIColor colorWithRed:158.0/255.0 green:0.0/255.0 blue:35.0/255.0 alpha:1.0];
}

@end
