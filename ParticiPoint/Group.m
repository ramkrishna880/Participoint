//
//  Group.m
//  ParticiPoint
//
//  Created by PTG on 28/07/16.
//  Copyright © 2016 People Tech Group. All rights reserved.
//

#import "Group.h"

@implementation Group


//+ (Group *)groupsGuestionWithDictionary:(NSDictionary *)dict {
+ (Group *)groupsGuestionWithDictionary:(NSArray *)valArr {
    Group *group = [[Group alloc] initWithDictionary:valArr];
    return group;
}


//- (id)initWithDictionary:(NSDictionary *)dictionary {
- (id)initWithDictionary:(NSArray *)array {
//    if (![dictionary isKindOfClass:[NSDictionary class]]) return nil;
    if (![array isKindOfClass:[NSArray class]]) return nil;
    if (self == [super init]) {
//        self.groupId      =   dictionary [@"2"];
//        self.groupName    =   dictionary [@"3"];
//        self.qId          =   dictionary [@"0"];
//        self.question     =   dictionary [@"1"];
        
        self.groupId      =   array [2];
        self.groupName    =   array [3];
        self.qId          =   array [0];
        self.question     =   array [1];
    }
    return self;
}

@end
