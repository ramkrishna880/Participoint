//
//  RegisterVC.m
//  ParticiPoint
//
//  Created by PTG on 17/07/16.
//  Copyright © 2016 People Tech Group. All rights reserved.
//

#import "RegisterVC.h"
#import "SelectionVC.h"
#import "UITextField+NextField.h"
#import "PPClient.h"
#import "GroupsTableCell.h"
#import "School.h"
#import "GroupQuestion.h"
#import "Group.h"

@interface RegisterVC () <UIPickerViewDelegate, UIPickerViewDataSource, PickerVcDelegate, UITextFieldDelegate, UITableViewDelegate,UITableViewDataSource>
//Outlets
@property (nonatomic, weak) IBOutlet UITextField        *schoolTxtField;
@property (nonatomic, weak) IBOutlet UITextField        *emailTxtField;
@property (nonatomic, weak) IBOutlet UITextField        *pwdTxtField;
@property (nonatomic, weak) IBOutlet UITextField        *rePwdTxtField;
@property (nonatomic, weak) IBOutlet UIPickerView       *gradYrPicker;
@property (nonatomic, weak) IBOutlet UIScrollView       *scrollView;
@property (nonatomic, weak) IBOutlet UITableView        *tblView;
//Others
@property (nonatomic, strong) NSMutableArray            *years;
@property (nonatomic, strong) NSMutableArray            *groupQuestions;
@property (nonatomic, strong) NSMutableArray            *schools;
@property (nonatomic, strong) PPClient                  *client;
@end

@implementation RegisterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addTitle:@"Sign Up"];
    [self addPanoramicMovingBGFWithImage:@"login_bg.jpg"];
    self.navigationItem.hidesBackButton = YES;
    [self.schoolTxtField addBorederWithWidth:0 color:nil andCornerRaduis:5];
    [self.emailTxtField addBorederWithWidth:0 color:nil andCornerRaduis:5];
    [self.pwdTxtField addBorederWithWidth:0 color:nil andCornerRaduis:5];
    [self.rePwdTxtField addBorederWithWidth:0 color:nil andCornerRaduis:5];
    [self.gradYrPicker addBorederWithWidth:1.0 color:[UIColor whiteColor] andCornerRaduis:5];
    [[self.view viewWithTag:100] addBorederWithWidth:0 color:nil andCornerRaduis:5];
    
    [self addPaddingToTextFileds];
    self.emailTxtField.nextField = _pwdTxtField;
    self.pwdTxtField.nextField   = _rePwdTxtField;
    
    _client = [PPClient sharedClient];
    [self createGraduationYearsData];
    [self getSchools];
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.scrollView setContentOffset:CGPointMake(0, -self.scrollView.contentInset.top) animated:YES];
}

#pragma mark UIActions

- (IBAction)switchSelected:(UISwitch *)sender {
    if (sender.on == NO) {
        return;
    }
    //    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    //    SelectionVC *pickerVc = (SelectionVC *)[mainStoryBoard instantiateViewControllerWithIdentifier:PICKERVC_SEGUEID];
    //    pickerVc.delegate = self;
    //
    //    switch (sender.tag) {
    //        case 0:
    //            pickerVc.pickerType = KpickerTypeCampus;
    //            break;
    //        case 1:
    //            pickerVc.pickerType = KpickerTypeSport;
    //            break;
    //        case 2:
    //            pickerVc.pickerType = KpickerTypeMusic;
    //            break;
    //        case 3:
    //            pickerVc.pickerType = KpickerTypeTheatre;
    //            break;
    //        case 4:
    //            pickerVc.pickerType = KpickerTypePosition;
    //            break;
    //        case 5:
    //            pickerVc.pickerType = KpickerTypeHearUs;
    //            break;
    //        case 6:
    //            pickerVc.pickerType = KpickerTypeSchool;
    //            break;
    //        default:
    //            break;
    //    }
    //    pickerVc.modalPresentationStyle = UIModalPresentationOverFullScreen;
    //    [self presentViewController:pickerVc animated:YES completion:nil];
}


- (IBAction)signupTapped:(id)sender {
    if (_schoolTxtField.text || !_emailTxtField.text || !_pwdTxtField.text || !_rePwdTxtField.text) {
        [self showAlert:@"Register" message:@"Enter all Fields"];
    } else if (![_pwdTxtField.text isEqualToString:_rePwdTxtField.text]) {
        [self showAlert:@"Register" message:@"Passwords are not matched"];
    } else {
        
    }
    [self performSegueWithIdentifier:@"loginFromSignUp" sender:nil];
}

- (IBAction)backTapped:(id)sender {
    [self.navigationController popViewControllerAnimated:NO];
}

#pragma mark UipickerView Datasource

- (NSInteger)numberOfComponentsInPickerView: (UIPickerView*)thePickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
    return _years.count;
}

- (nullable NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString *title = [_years objectAtIndex:row];
    NSAttributedString *valString = [[NSAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    return valString;
}


#pragma mark --TableView Datasource & delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.groupQuestions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GroupsTableCell *cell = [tableView dequeueReusableCellWithIdentifier:GROUPS_CELLID];
    GroupQuestion *question = self.groupQuestions [indexPath.row];
    cell.question.text = question.question;
//    GroupsTableCell * __weak weakCell = cell;
    [cell setDidChangeSwitchBlock:^(UISwitch *sender) {
        [self showPicker:question.groups forType:KpickerTypeOthers];
    }];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

#pragma mark TextfieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (textField == _schoolTxtField) {
        if (!self.schools) {
            [self showAlert:@"Register" message:@"No schools found"];
            return;
        }
        [self showPicker:self.schools forType:KpickerTypeSchool];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if(textField != _rePwdTxtField) {
        [textField.nextField becomeFirstResponder];
    } else {
        if (textField == _emailTxtField) {
            [self checkEmailAvliability];
        }
        [textField resignFirstResponder];
    }
    return YES;
}


#pragma mark Delegate
- (void)didSelectedPickerValue:(NSString *)selectedVal forType:(KpickerType)type {
    if (type == KpickerTypeSchool) {
        self.schoolTxtField.text  =  ((School *)selectedVal).schoolName;
        [self getGroupQuestions:((School *)selectedVal).schoolId];
    } else {
//        Group *group = (Group *)selectedVal;
        [self showAlert:nil message:[NSString stringWithFormat:@"Selected option for %@ is %@",((Group *)selectedVal).question,((Group *)selectedVal).groupName]];
    }
}

#pragma mark - Network Op

- (void)getSchools {
    [self showHUD];
    [self.client getSchoolsWithCompletionHandler:^(NSDictionary *  _Nonnull responseObject) {
        [self hideHUD];
        if (!responseObject) return;
        self.schools = [NSMutableArray new];
        NSArray *arr = responseObject.responsedata;
        for (NSDictionary *schoolDict in arr) {
            School *school = [[School alloc] initWithDictionary:schoolDict];
            [self.schools addObject:school];
        }
    } failure:^(NSError * _Nullable connectionError) {
        [self hideHUD];
        [self showAlert:nil message:connectionError.localizedDescription];
    }];
}

- (void)checkEmailAvliability {
    if (!_emailTxtField.text) return;
    [self showHUD];
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:_emailTxtField.text, @"schoolmailId", nil];
    [self.client forgetPwdWithUrl:FORGETPWDURL params:params withCompletionHandler:^(NSDictionary * _Nonnull responseObject) {
        [self hideHUD];
        if (!responseObject) return;
        if ([responseObject.statusMessage isEqualToString:@"False"]) {
            [self showAlert:@"Register" message:@"This email has already been registered"];
            [_emailTxtField becomeFirstResponder];
        } else {
        }
    } failure:^(NSError * _Nullable connectionError) {
        [self hideHUD];
        [self showAlert:@"Register" message:connectionError.localizedDescription];
    }];
}

- (void)getGroupQuestions:(NSString *)schoolId {
    [self showHUD];
    NSDictionary *params = [[NSDictionary alloc] initWithObjectsAndKeys:schoolId,@"schoolId", nil];
    [self.client fetchGroupsWithParams:params withCompletionHandler:^(NSDictionary *  _Nonnull responseObject) {
        [self hideHUD];
        if (responseObject && [responseObject.statusMessage isEqualToString:@"Success"]) {
            NSArray *tempArr = responseObject.responsedata;
            self.groupQuestions = [NSMutableArray new];
            for (NSDictionary *qDict in tempArr) {
                GroupQuestion *question = [GroupQuestion groupsGuestionWithDictionary:qDict];
                [self.groupQuestions addObject:question];
            }
        }
        [self adjustTableViewHeightForNumOfGroups:self.groupQuestions.count];
        [self.tblView reloadData];
        
    } failure:^(NSError * _Nullable connectionError) {
        [self hideHUD];
        [self showAlert:@"Groups" message:connectionError.localizedDescription];
    }];
}

#pragma mark Others

- (void)createGraduationYearsData {
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy"];
    int i2  = [[formatter stringFromDate:[NSDate date]] intValue];
    _years = [[NSMutableArray alloc] init];
    for (int i=1960; i<=i2+4; i++) {
        [_years addObject:[NSString stringWithFormat:@"%d",i]];
    }
}

- (void)adjustTableViewHeightForNumOfGroups:(NSUInteger)noOfGroups {
    for (NSLayoutConstraint *con in self.tblView.constraints) {
        if (con.firstAttribute == NSLayoutAttributeHeight) {
            con.constant = noOfGroups * 50;
        }
    }
}

- (void)showPicker:(NSArray *)options forType:(KpickerType)type {
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    SelectionVC *pickerVc = (SelectionVC *)[mainStoryBoard instantiateViewControllerWithIdentifier:PICKERVC_SEGUEID];
    pickerVc.delegate = self;
    if (type != KpickerTypeSchool) {
        //        pickerVc.questionName =
    }
    pickerVc.values = options;
    pickerVc.pickerType = type;
    pickerVc.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [self presentViewController:pickerVc animated:YES completion:nil];
    //    [pickerVc performSelector:@selector(setValues:) withObject:nil];
}



#pragma mark - Segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //    if ([segue.destinationViewController respondsToSelector:@selector(setMyData:)]) {
    //        [segue.destinationViewController performSelector:@selector(setMyData:)
    //                                              withObject:myData];
    //    }
    
}

@end
