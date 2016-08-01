//
//  ViewController.m
//  ParticiPoint
//
//  Created by PTG on 07/07/16.
//  Copyright © 2016 People Tech Group. All rights reserved.
//

#import "ViewController.h"
//#import "UIViewController+Additions.h"
#import "UITextField+NextField.h"
#import "PPClient.h"

@interface ViewController () <UITextFieldDelegate>
//Outlets
@property (nonatomic, weak) IBOutlet UITextField   *emailTxtField;
@property (nonatomic, weak) IBOutlet UITextField   *pwdTxtField;

//Vars
@property (nonatomic) PPClient *dataClient;
@end

@implementation ViewController

#pragma mark UI-lifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTitle:@"Login"];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:74.0/255.0 green:24.0/255.0 blue:117.0/255.0 alpha:1.0];
    [self addPanoramicMovingBGFWithImage:@"login_bg.jpg"];
    [_emailTxtField addBorederWithWidth:0 color:nil andCornerRaduis:5];
    //    _emailTxtField.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 30)];
    //    _emailTxtField.leftViewMode = UITextFieldViewModeAlways;
    [_pwdTxtField addBorederWithWidth:0 color:nil andCornerRaduis:5];
    [[self.view viewWithTag:100] addBorederWithWidth:0 color:nil andCornerRaduis:5];
    [[self.view viewWithTag:200] addBorederWithWidth:2 color:[UIColor whiteColor] andCornerRaduis:13];
    self.dataClient = [PPClient sharedClient];
    
    [self addPaddingToTextFileds];
    self.emailTxtField.nextField = _pwdTxtField;
}



#pragma mark - UIActions
- (IBAction)forgetPasswordTapped:(id)sender {
    [self performSegueWithIdentifier:@"forgetPwdSegue" sender:nil];
}

- (IBAction)signUPTapped:(id)sender {
    [self performSegueWithIdentifier:@"registervcSegue" sender:nil];
}

- (IBAction)signinTapped:(id)sender {
    if (!_emailTxtField.text.length || !_pwdTxtField.text.length) {
        [self showAlert:@"Login" message:@"Please Enter Email or Password"];
    } else if (![_emailTxtField hasaValidEmail]) {
        [self showAlert:@"Login" message:@"Please Enter a valid Email"];
    } else {
        [self performLogin];
    }
}

#pragma mark - Network Op

- (void)performLogin {
    NSDictionary *params = [[NSDictionary alloc] initWithObjectsAndKeys:self.emailTxtField.text,@"schoolmailId",self.pwdTxtField.text,@"password",nil];
    [self showHUD];
    [self.dataClient loginWithUrl:LOGINURL params:params withCompletionHandler:^(NSDictionary * _Nonnull responseObject) {
        [self hideHUD];
        if (responseObject && [responseObject.statusMessage isEqualToString:@"Success"]) {
            if (![[(((NSArray *)responseObject.responsedata) [0]) valueForKey:@"status"] isEqualToString:@"1"]) {
                [self showAlert:@"Login" message:@"Not a valid user"];
                return;
            }
            [self.dataClient setUserGroups:(NSArray *)responseObject.responsedata];
            [self.dataClient setIsLogged:YES];
            NSDictionary *group = responseObject.responsedata ? ((NSArray *)responseObject.responsedata)[0] : nil;
            [self.dataClient setUserId:[group valueForKey:@"userId"]];
            [self performSegueWithIdentifier:@"HomeSegue" sender:nil];
        } else {
            [self showAlert:@"Login" message:@"Failed to Login. plesase check Mail or Password"];
        }
    } failure:^(NSError * _Nullable connectionError) {
        [self showAlert:@"Login" message:connectionError.localizedDescription];
    }];
    //[self performSegueWithIdentifier:@"HomeSegue" sender:nil];
}

#pragma mark Textfiled delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if(textField != _pwdTxtField) {
        [textField.nextField becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
    }
    return YES;
}

#pragma mark Notif
- (void)registerKeyBoardNotifications:(BOOL)shouldRegister {
    if (shouldRegister) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didKeyBoardPresent:) name:UIKeyboardDidShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didKeyBoardHide:) name:UIKeyboardDidHideNotification object:nil];
    } else {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidHideNotification object:nil];
    }
}

- (void)didKeyBoardPresent:(NSNotification *)notif {
    
}

- (void)didKeyBoardHide:(NSNotification *)notif {
    
}

@end
