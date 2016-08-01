//
//  GroupQuestion.m
//  ParticiPoint
//
//  Created by PTG on 28/07/16.
//  Copyright © 2016 People Tech Group. All rights reserved.
//

#import "GroupQuestion.h"
#import "Group.h"

@implementation GroupQuestion

+ (GroupQuestion *)groupsGuestionWithDictionary:(NSDictionary *)dict {
    GroupQuestion *gq = [[GroupQuestion alloc] initWithDictionary:dict];
    return gq;
}

- (id)initWithDictionary:(NSDictionary *)dictionary {
    if (![dictionary isKindOfClass:[NSDictionary class]]) return nil;
    //        @throw [NSException exceptionWithName:@"GroupQuestion - Model Exception" reason:@"Not feeded with Dictioanry" userInfo:nil];
    if (self == [super init]) {
        
        self.questionId  = dictionary [@"questionId"];
        self.question    = dictionary [@"questionName"];
        self.schoolId    = dictionary [@"schoolId"];
        
        NSArray *grups = dictionary [@"names"];
        if (grups.count) {
            self.groups = [NSMutableArray new];
            for (NSDictionary *groupDict in grups) {
                Group *group = [Group groupsGuestionWithDictionary:groupDict];
                [self.groups addObject:group];
            }
        }
    }
    return self;
}

@end
