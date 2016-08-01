//
//  Group.h
//  ParticiPoint
//
//  Created by PTG on 28/07/16.
//  Copyright © 2016 People Tech Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Group : NSObject

@property (nonatomic, strong) NSString *groupId;
@property (nonatomic, strong) NSString *groupName;
@property (nonatomic, strong) NSString *qId;
@property (nonatomic, strong) NSString *question;

+ (Group *)groupsGuestionWithDictionary:(NSDictionary *)dict;
@end
