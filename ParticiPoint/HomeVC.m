//
//  HomeVC.m
//  ParticiPoint
//
//  Created by PTG on 21/07/16.
//  Copyright © 2016 People Tech Group. All rights reserved.
//

#import "HomeVC.h"
#import "PPClient.h"

@import MapKit;

@interface HomeVC ()
@property (nonatomic, strong) PPClient *client;
@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.navigationController.
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
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
