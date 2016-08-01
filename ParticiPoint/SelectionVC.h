//
//  SelectionVC.h
//  ParticiPoint
//
//  Created by PTG on 19/07/16.
//  Copyright © 2016 People Tech Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PickerVcDelegate <NSObject>
@optional
//- (void)didSelectedPickerValue:(NSString *)selectedVal forType:(KpickerType)type;
- (void)didSelectedPickerValue:(id)selectedVal forType:(KpickerType)type;
@end

@interface SelectionVC : UIViewController
@property (nonatomic) KpickerType pickerType;
@property (nonatomic, weak) id <PickerVcDelegate> delegate;

@property (nonatomic, strong) NSArray *values;
@property (nonatomic, strong) NSString *questionName;
//- (void) setValues:(NSArray *)vals;
@end
