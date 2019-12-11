//
//  BaseHttpClient.h
//  App
//
//  Created by Apple on 2018/4/17.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseHttpClient : NSObject

/**
 开启一个请求

 @param url API接口
 @param params 入参
 @param method GET或POST
 @param success 成功回调
 @param failure 失败回调
 */
- (void)requestURL:(NSString *)url params:(NSDictionary *)params method:(NSString *)method success:(void(^)(id responseObj))success failure:(void(^)(NSError *error))failure;

@end
