//
//  GroupsTableCell.h
//  ParticiPoint
//
//  Created by PTG on 27/07/16.
//  Copyright © 2016 People Tech Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GroupsTableCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel *question;
@property (nonatomic, weak) IBOutlet UISwitch *qToggle;
@property (copy, nonatomic) void (^didChangeSwitchBlock)(id sender);
@end
