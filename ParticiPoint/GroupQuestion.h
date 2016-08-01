//
//  GroupQuestion.h
//  ParticiPoint
//
//  Created by PTG on 28/07/16.
//  Copyright © 2016 People Tech Group. All rights reserved.
//

#import <Foundation/Foundation.h>
//@class Group;

@interface GroupQuestion : NSObject
@property (nonatomic, strong) NSString *questionId;
@property (nonatomic, strong) NSString *question;
@property (nonatomic, strong) NSString *schoolId;
@property (nonatomic, strong) NSMutableArray *groups;

+ (GroupQuestion *)groupsGuestionWithDictionary:(NSDictionary *)dict;
@end
