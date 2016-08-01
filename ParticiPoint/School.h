//
//  School.h
//  ParticiPoint
//
//  Created by PTG on 28/07/16.
//  Copyright © 2016 People Tech Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface School : NSObject
@property (nonatomic) NSString *schoolId;
@property (nonatomic) NSString *schoolName;
@property (nonatomic) NSString *status;

- (id)initWithDictionary:(NSDictionary *)dict;
@end
