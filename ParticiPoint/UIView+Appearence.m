//
//  UIView+Appearence.m
//  ParticiPoint
//
//  Created by PTG on 14/07/16.
//  Copyright © 2016 People Tech Group. All rights reserved.
//

#import "UIView+Appearence.h"

@implementation UIView (Appearence)

- (void)addBorederWithWidth:(CGFloat)width color:(UIColor *)color andCornerRaduis:(CGFloat)cornerRadius {
    self.layer.borderWidth = width;
    self.layer.borderColor = color.CGColor;
    self.layer.cornerRadius = cornerRadius;
    //[self.layer setMasksToBounds:YES];
}



@end
