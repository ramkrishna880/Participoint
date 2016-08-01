//
//  ForgetPwdVC.m
//  ParticiPoint
//
//  Created by PTG on 15/07/16.
//  Copyright © 2016 People Tech Group. All rights reserved.
//

#import "ForgetPwdVC.h"
#import "PPClient.h"

@interface ForgetPwdVC ()
//Outlets
@property (nonatomic, weak) IBOutlet UITextField  *email;
@property (nonatomic) PPClient                    *dataClient;
@end

@implementation ForgetPwdVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Forget Password";
    self.navigationItem.hidesBackButton = YES;
    self.dataClient = [PPClient sharedClient];
    [self addPanoramicMovingBGFWithImage:@"login_bg.jpg"];
    [self.email addBorederWithWidth:0 color:nil andCornerRaduis:5];
    [[self.view viewWithTag:100] addBorederWithWidth:0 color:nil andCornerRaduis:5];
    [self addPaddingToTextFileds];
}

#pragma mark UIActions

- (IBAction)submitTapped:(id)sender {
    if (!self.email.text.length) {
        [self showAlert:@"Forget Password" message:@"Please enter Email"];
    } else {
        [self performForgetPwdOperation];
    }
}

- (IBAction)backTapped:(id)sender {
    [self.navigationController popViewControllerAnimated:NO];
}

#pragma mark - Network Op

- (void)performForgetPwdOperation {
    NSDictionary *params = [[NSDictionary alloc] initWithObjectsAndKeys:self.email.text, @"schoolMailId", nil];
    [_dataClient forgetPwdWithUrl:FORGETPWDURL params:params withCompletionHandler:^(NSDictionary * _Nonnull responseObject) {
        if (responseObject && [responseObject.statusMessage isEqualToString:@"Success"]) {
            [self showAlert:@"Forget Password" message:@"Password has been sent to your Mail"];
            [self.navigationController popViewControllerAnimated:YES];
        }
    } failure:^(NSError * _Nullable connectionError) {
        [self showAlert:@"Forget password" message:connectionError.localizedDescription];
    }];
    //    [self showAlert:@"Forget Password" message:@"Password has been sent to your Mail"];
}

@end
