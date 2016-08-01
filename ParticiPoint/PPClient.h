//
//  PPClient.h
//  ParticiPoint
//
//  Created by PTG on 20/07/16.
//  Copyright © 2016 People Tech Group. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

NS_ASSUME_NONNULL_BEGIN
@interface PPClient : AFHTTPSessionManager
+ (instancetype) sharedClient;

//@-- Var
@property (nonatomic, strong) NSUserDefaults *defaults;

//Methods
- (BOOL) offline;
@end



//@@@@@@@@@@@--------------- URLS -------------------@@@@@@@@@@@@@@@

static NSString *const LOGINURL = @"http://183.82.48.194:5552/api-participoint/v1/security/listOfSignDetails";
static NSString *const FORGETPWDURL = @"http://183.82.48.194:5552/api-participoint/v1/security/forgotPassword";
static NSString *const CHECKEMAILAVALIABILITYURL = @"http://183.82.48.194:5552/api-participoint/v1/security/emailIdCheckAvailability";
static NSString *const GET_SCHOOLS = @"http://183.82.48.194:5552/api-participoint/v1/security/schoolDetails";
static NSString *const GET_QUESTIONS = @"http://183.82.48.194:5552/api-participoint/v1/security/getListOfQuestionForReg";


//@@@@@@@@@@@--------------- Data Web Op -------------------@@@@@@@@@@@@@@@

@interface PPClient (data)
- (void)loginWithUrl:(NSString *)urlString params:(NSDictionary *)params withCompletionHandler:(void (^) (id responseObject))completionHandler  failure:(void (^) (NSError* __nullable connectionError))failure;
- (void)forgetPwdWithUrl:(NSString *)urlString params:(NSDictionary *)params withCompletionHandler:(void (^) (id responseObject))completionHandler  failure:(void (^) (NSError* __nullable connectionError))failure;
- (void)checkEmailAvaliabilityWithUrl:(NSString *)urlString params:(NSDictionary *)params withCompletionHandler:(void (^) (id responseObject))completionHandler  failure:(void (^) (NSError* __nullable connectionError))failure;
- (void)fetchGroupsWithParams:(NSDictionary *)params withCompletionHandler:(void (^) (id responseObject))completionHandler  failure:(void (^) (NSError* __nullable connectionError))failure;
- (void)getSchoolsWithCompletionHandler:(void (^) (id responseObject))completionHandler  failure:(void (^) (NSError* __nullable connectionError))failure;

NS_ASSUME_NONNULL_END
@end
//@@@@@@@@@@@-------------- END -----------------------@@@@@@@@@@@@@