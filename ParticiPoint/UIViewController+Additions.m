//
//  UIViewController+Additions.m
//  ParticiPoint
//
//  Created by PTG on 14/07/16.
//  Copyright © 2016 People Tech Group. All rights reserved.
//

#import "UIViewController+Additions.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import "SKPanoramaView.h"

@implementation UIViewController (Additions)


- (void)addPanoramicMovingBGFWithImage:(NSString *)bg_image; {
    SKPanoramaView *panoramaView = [[SKPanoramaView alloc] initWithFrame:self.view.frame image:[UIImage imageNamed:bg_image]];
    panoramaView.animationSpeed = 30.0f;
    panoramaView.startPosition = SKPanoramaStartPositionLeft;
    [self.view addSubview:panoramaView];
    [self.view sendSubviewToBack:panoramaView];
    [panoramaView startAnimating];
}

- (void)addTitle:(NSString *)title {
    [self addTitle:title withColor:[UIColor whiteColor]];
}

- (void)addTitle:(NSString *)title withColor:(UIColor *)titleColor {
    self.navigationItem.title = title;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:titleColor,NSFontAttributeName:[UIFont fontWithName:@"HelveticaNeue-Medium" size:20]}];
}

- (void)showAlert:(NSString *)title message:(NSString *)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)addPaddingToTextFileds {
    [self addPaddingToTextFieldsInViews:[self allTextFieldsInView:self.view]];
}

- (void)addPaddingToTextFieldsInViews:(NSArray *)views {
    for (UIView *v in views) {
        if ([v isKindOfClass:[UITextField class]]) {
            [(UITextField *)v addLeadingInset];
        }
    }
}

//@@--Local Methods
-(NSArray*)allTextFieldsInView:(UIView*)view{
    NSMutableArray* textfieldarray = [[NSMutableArray alloc] init];
    for(id x in [view subviews]){
        if([x isKindOfClass:[UITextField class]])
            [textfieldarray addObject:x];
        
        if([x respondsToSelector:@selector(subviews)]){
            // if it has subviews, loop through those, too
            [textfieldarray addObjectsFromArray:[self allTextFieldsInView:x]];
        }
    }
    return textfieldarray;
}

@end

@implementation UIViewController (Loading)

- (void)showHUD {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

//- (void)showHUDWithLoaderText:(NSString *)hudLblText {
//    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
////    hud.mode = MBProgressHUDModeAnnularDeterminate;
////    hud.label.text = hudLblText;
////    [self doSomethingInBackgroundWithProgressCallback:^(float progress) {
////        hud.progress = progress;
////    } completionCallback:^{
////        [hud hideAnimated:YES];
////    }];
//}

- (void)hideHUD {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}
@end


@implementation UITextField (Helpers)

- (BOOL)hasaValidEmail {
    BOOL stricterFilter = YES;
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self.text];
}

- (void)addLeadingInset {
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 35)];
    self.leftView = leftView;
    self.leftViewMode = UITextFieldViewModeAlways;
}

@end


//@***----------- Dictionary - Response ----------------***@//

@implementation NSDictionary (Response)

- (NSString *)statusMessage {
    return [self valueForKey:@"_statusMessage"];
}

- (id) responsedata {
    return [self valueForKey:@"data"];
}

@end

