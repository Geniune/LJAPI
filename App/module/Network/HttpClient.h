//
//  HttpClient.h
//  App
//
//  Created by Apple on 2018/4/17.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseHttpClient.h"

#define  HttpClientMgr [HttpClient sharedInstance]

@interface HttpException : NSObject

@property (nonatomic) NSInteger errorCode;//错误码
@property (nonatomic, strong) NSString *message;//错误信息描述

@end

@interface HttpClient : BaseHttpClient

+ (instancetype)sharedInstance;

- (void)get:(NSString *)url params:(NSDictionary *)params success:(void(^)(id responseObj))success failure:(void(^)(HttpException * e))failure;
- (void)post:(NSString *)url params:(NSDictionary *)params success:(void(^)(id responseObj))success failure:(void(^)(HttpException * e))failure;

@end
