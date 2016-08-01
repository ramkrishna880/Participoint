//
//  RearVC.m
//  ParticiPoint
//
//  Created by PTG on 21/07/16.
//  Copyright © 2016 People Tech Group. All rights reserved.
//

#import "RearVC.h"

@interface RearVC () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, weak) IBOutlet UITableView *tblView;

//vars
@property (nonatomic, strong) NSArray *vals;
@end

@implementation RearVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.vals = @[@"Search", @"Home", @"Photo Feed", @"Compete", @"Check Participoints", @"Find a Deal", @"Logout"];
}


#pragma mark Tableview Datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _vals.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *kRearCellID = @"RearViewCellId";
    UITableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:kRearCellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"RearViewCellId"];
        if (indexPath.row == 0) {
            cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search"]];
        } else if (indexPath.row == _vals.count-1) {
            cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logout"]];
        } else {
            cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow"]];
        }
    }
    cell.textLabel.text = _vals [indexPath.row];
    return  cell;
}


/*
 #pragma mark - Navigation 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
