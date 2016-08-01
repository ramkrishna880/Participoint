//
//  GroupsTableCell.m
//  ParticiPoint
//
//  Created by PTG on 27/07/16.
//  Copyright © 2016 People Tech Group. All rights reserved.
//

#import "GroupsTableCell.h"

@implementation GroupsTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.qToggle.onTintColor = [UIColor colorWithRed:158.0/255.0 green:0.0/255.0 blue:35.0/255.0 alpha:1.0];
    [self.qToggle addTarget:self action:@selector(switchToggled:) forControlEvents:UIControlEventValueChanged];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

- (void)switchToggled:(id)sender {
    if (self.didChangeSwitchBlock) {
        self.didChangeSwitchBlock(sender);
    }
}

@end
