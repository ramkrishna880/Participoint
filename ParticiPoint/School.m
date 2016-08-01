//
//  School.m
//  ParticiPoint
//
//  Created by PTG on 28/07/16.
//  Copyright © 2016 People Tech Group. All rights reserved.
//

#import "School.h"

@implementation School

- (id)initWithDictionary:(NSDictionary *)dict {
    if (self = [super init]) {
        self.schoolId      =  dict [@"schoolId"];
        self.schoolName    =  dict [@"schoolName"];
        self.status        =  dict [@"status"];
    }
    return self;
}
@end
