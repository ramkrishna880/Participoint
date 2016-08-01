//
//  PPClient.m
//  ParticiPoint
//
//  Created by PTG on 20/07/16.
//  Copyright © 2016 People Tech Group. All rights reserved.
//

#import "PPClient.h"

@implementation PPClient


+ (instancetype) sharedClient {
    static PPClient *sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedClient = [[PPClient alloc] init];
    });
    return sharedClient;
}


- (id) init {
    if(self = [super init]) {
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        self.defaults = [NSUserDefaults standardUserDefaults];
        [self flushRequestQueue];
        
        
        //        [self setDefaultHeader:@"Accept" value:@"application/json"];
        //        @weakify(self);
        //        [self setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        //            @strongify(self);
        //            switch(status) {
        //                case AFNetworkReachabilityStatusNotReachable: {
        //                    [self sendNotification:@"availability" notification:kNetworkDidBecomeUnavailable data:@(status)];
        //                    break;
        //                }
        //                case AFNetworkReachabilityStatusReachableViaWiFi:
        //                case AFNetworkReachabilityStatusReachableViaWWAN: {
        //                    [self sendNotification:@"availability" notification:kNetworkDidBecomeAvailable data:@(status)];
        //                    break;
        //                }
        //                case AFNetworkReachabilityStatusUnknown:
        //                    NSLog(@"Unknown status");
        //                    break;
        //            }
        //        }];
        
    }
    return self;
}



- (void) flushRequestQueue {
    for(NSOperation *operation in self.operationQueue.operations) {
        [operation cancel];
    }
}



- (BOOL) offline
{
#if TARGET_IPHONE_SIMULATOR
    return NO;
#else
    return self.networkReachabilityStatus == AFNetworkReachabilityStatusNotReachable;
#endif
}

@end


@implementation PPClient (data)

- (void)loginWithUrl:(NSString *)urlString params:(NSDictionary *)params withCompletionHandler:(void (^) (id responseObject))completionHandler  failure:(void (^) (NSError* __nullable connectionError))failure {
    if (!self.offline) {
        [self POST:urlString parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            completionHandler (responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error);
        }];
    }
}

- (void)forgetPwdWithUrl:(NSString *)urlString params:(NSDictionary *)params withCompletionHandler:(void (^) (id responseObject))completionHandler  failure:(void (^) (NSError* __nullable connectionError))failure {
    if (!self.offline) {
        [self POST:urlString parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            completionHandler (responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error);
        }];
    }
}

- (void)checkEmailAvaliabilityWithUrl:(NSString *)urlString params:(NSDictionary *)params withCompletionHandler:(void (^) (id responseObject))completionHandler  failure:(void (^) (NSError* __nullable connectionError))failure {
    if (!self.offline) {
        [self POST:urlString parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            completionHandler (responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error);
        }];
    }
}

- (void)fetchGroupsWithParams:(NSDictionary *)params withCompletionHandler:(void (^) (id responseObject))completionHandler  failure:(void (^) (NSError* __nullable connectionError))failure {
    if (!self.offline) {
        [self POST:GET_QUESTIONS parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            completionHandler (responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error);
        }];
    }
}
- (void)getSchoolsWithCompletionHandler:(void (^) (id responseObject))completionHandler  failure:(void (^) (NSError* __nullable connectionError))failure {
    if (!self.offline) {
        [self GET:GET_SCHOOLS parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            completionHandler (responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure (error);
        }];
    }
}

@end
