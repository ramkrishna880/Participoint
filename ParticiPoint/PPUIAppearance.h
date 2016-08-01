//
//  PPUIAppearance.h
//  ParticiPoint
//
//  Created by PTG on 14/07/16.
//  Copyright © 2016 People Tech Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PPUIAppearance : NSObject


+(void)enhanceNavBarAppearance:(NSString*)navBarFileName;

+(void)enhanceTabBarBackgroundAppearance:(NSString*)bgFileName
                      selectionIndicator:(NSString*)selFilename
                  selectedImageTintColor:(UIColor*)selectedColor
                         normalTintColor:(UIColor*)tintColor;

+(void)enhanceNavBarController:(UINavigationController*)navBarController
                  barTintColor:(UIColor*)barTintColor
                     tintColor:(UIColor*)tintColor
                titleTextColor:(UIColor*)titleTextColor;

+(UIView*)createLogo:(NSString*)logoFileName;

+(void)enhanceToolbarAppearance:(NSString*)toolBarFileName;

+(void)enhanceBarButtonAppearance:(UIColor*)color;

@end
