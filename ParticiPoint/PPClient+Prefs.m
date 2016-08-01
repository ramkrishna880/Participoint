//
//  PPClient+Prefs.m
//  ParticiPoint
//
//  Created by PTG on 26/07/16.
//  Copyright © 2016 People Tech Group. All rights reserved.
//

#import "PPClient+Prefs.h"

static NSString *const LOGGED_KEY = @"ISLOGGED";
static NSString *const GROUPS_KEY = @"GROUPS";
static NSString *const USERID_KEY = @"USERID";

@implementation PPClient (Prefs)
#pragma mark - get
- (NSDictionary *)isLoggedIn {
    return [self.defaults valueForKey:LOGGED_KEY];
}

- (NSString *) userId {
    return  [self.defaults valueForKey:USERID_KEY]?  [self.defaults valueForKey:USERID_KEY] : nil;
}

- (NSArray *)userGroups {
    return [self.defaults valueForKey:GROUPS_KEY] ? [self.defaults valueForKey:GROUPS_KEY] : nil;
}

#pragma mark set

- (void)setIsLogged:(BOOL)isloggedIn {
    [self.defaults setBool:isloggedIn forKey:LOGGED_KEY];
    [self.defaults synchronize];
}
- (void) setUserGroups:(NSArray *)groupsArray {
    if (groupsArray) {
        [self.defaults setValue:groupsArray forKey:GROUPS_KEY];
    } else {
        [self.defaults removeObjectForKey:GROUPS_KEY];
    }
    [self.defaults synchronize];
}
- (void) setUserId:(NSString *)userId {
    if (userId) {
        [self.defaults setValue:userId forKey:USERID_KEY];
    } else {
        [self.defaults removeObjectForKey:USERID_KEY];
    }
}

@end
