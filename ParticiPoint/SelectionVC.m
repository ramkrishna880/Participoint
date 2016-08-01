//
//  SelectionVC.m
//  ParticiPoint
//
//  Created by PTG on 19/07/16.
//  Copyright © 2016 People Tech Group. All rights reserved.
//

#import "SelectionVC.h"
#import "Group.h"
#import "School.h"

@interface SelectionVC () <UIPickerViewDataSource, UIPickerViewDelegate>
@property (nonatomic, weak) IBOutlet UIPickerView  *picker;
//@property (nonatomic, strong) NSArray *values;
@end

@implementation SelectionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColorFromHEX(0x000000, 0.75);
    [[self.view viewWithTag:50] setBackgroundColor:UIColorFromHEX(0xcccccc, 1.0)];
    [[self.view viewWithTag:100] addBorederWithWidth:0 color:nil andCornerRaduis:5];
    [[self.view viewWithTag:101] addBorederWithWidth:0 color:nil andCornerRaduis:5];
    [self.picker addBorederWithWidth:1 color:[UIColor whiteColor] andCornerRaduis:5];
}

#pragma mark pickerview Datasource

- (NSInteger)numberOfComponentsInPickerView: (UIPickerView*)thePickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
    return self.values.count;
}
- (NSAttributedString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (self.pickerType == KpickerTypeSchool) {
        School *sc = self.values [row];
        NSAttributedString *valString = [[NSAttributedString alloc] initWithString:sc.schoolName attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
//        return sc.schoolName;
        return valString;
    } else {
        Group *group = self.values [row];
        NSAttributedString *valString = [[NSAttributedString alloc] initWithString:group.groupName attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
//        return group.groupName;
        return valString;
    }
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
//    if (self.pickerType == KpickerTypeCampus) {
//        if (component == 0) {
//            //TODO update component based upon values
//            [self.picker reloadComponent:1];
//        }
//    }
}

- (IBAction)cancelAction:(id)sender {
    [self dismiss];
}

- (IBAction)doneAction:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectedPickerValue:forType:)]) {
//        NSString *val = nil;
        id selectedObj;
        if (self.pickerType == KpickerTypeSchool) {
            School *selectedSchool = self.values [[self.picker selectedRowInComponent:0]];
            selectedObj = selectedSchool;
//            val = selectedSchool.schoolName;
//            val = [NSString stringWithFormat:@"%@,%@",[self pickerView:self.picker titleForRow:[self.picker selectedRowInComponent:0] forComponent:0],[self pickerView:self.picker titleForRow:[self.picker selectedRowInComponent:1] forComponent:1]];
        } else {
            Group *g =self.values [[self.picker selectedRowInComponent:0]];
            selectedObj = g;
//            [self showAlert:nil message:[NSString stringWithFormat:@"Selected option for %@ is %@",g.question,g.groupName]];
//            val = [self pickerView:self.picker titleForRow:[self.picker selectedRowInComponent:0] forComponent:0];
        }
        
        [self.delegate didSelectedPickerValue:selectedObj forType:self.pickerType];
    }
    [self dismiss];
}

- (void)dismiss {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
