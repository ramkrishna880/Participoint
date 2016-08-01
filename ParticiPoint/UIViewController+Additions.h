//
//  UIViewController+Additions.h
//  ParticiPoint
//
//  Created by PTG on 14/07/16.
//  Copyright © 2016 People Tech Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Additions)
- (void)addPanoramicMovingBGFWithImage:(NSString *)bg_image;
- (void)addTitle:(NSString *)title;
- (void)showAlert:(NSString *)title message:(NSString *)message;
- (void)addPaddingToTextFileds;
@end

//@interface UIView (ListSubviewHierarchy)
//- (NSArray *)listOfSubviews;
//@end

@interface UIViewController (Loding)
- (void)showHUD;
- (void)hideHUD;
@end

@interface UITextField (Helpers)
- (BOOL)hasaValidEmail;
- (void)addLeadingInset;
@end


@interface NSDictionary (Response)
- (NSString *)statusMessage;
- (id)responsedata;
@end