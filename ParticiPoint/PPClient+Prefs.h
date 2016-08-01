//
//  PPClient+Prefs.h
//  ParticiPoint
//
//  Created by PTG on 26/07/16.
//  Copyright © 2016 People Tech Group. All rights reserved.
//

#import "PPClient.h"

@interface PPClient (Prefs)

#pragma mark - GET
- (NSDictionary *)isLoggedIn;
- (NSString *) userId;
- (NSArray *)userGroups;

#pragma mark - SET
- (void)setIsLogged:(BOOL)isloggedIn;
- (void) setUserGroups:(NSArray *)groupsArray;
- (void) setUserId:(NSString *)userId;
@end
