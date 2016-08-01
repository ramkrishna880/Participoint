//
//  UITextField+NextField.m
//  ParticiPoint
//
//  Created by PTG on 15/07/16.
//  Copyright © 2016 People Tech Group. All rights reserved.
//

#import <objc/runtime.h>
#import "UITextField+NextField.h"

static const char *nextFieldKey = "nextFieldKey";

@implementation UITextField (NextField)

- (UITextField *)nextField
{
    return objc_getAssociatedObject(self, nextFieldKey);
}

- (void)setNextField:(UITextField *)nextField
{
    objc_setAssociatedObject(self, nextFieldKey, nextField, OBJC_ASSOCIATION_ASSIGN);
}

@end
