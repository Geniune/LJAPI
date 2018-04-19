//
//  HttpClient.m
//  App
//
//  Created by Apple on 2018/4/17.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "HttpClient.h"

@implementation HttpException
@end

@implementation HttpClient

+ (instancetype)sharedInstance {
    static HttpClient *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[HttpClient alloc]init];
    });
    
    return _sharedInstance;
}

- (void)get:(NSString *)url params:(NSDictionary *)params success:(void(^)(id responseObj))success failure:(void(^)(HttpException * e))failure{
    
    [self requestWithPath:url params:params method:@"GET" success:^(id responseObj) {
        
        if(success){
            success (responseObj);
        }
    } failure:^(HttpException *e) {
        
        if(failure){
            failure(e);
        }
    }];
}

- (void)post:(NSString *)url params:(NSDictionary *)params success:(void(^)(id responseObj))success failure:(void(^)(HttpException * e))failure{
    
    [self requestWithPath:url params:params method:@"POST" success:^(id responseObj) {
        
        if(success){
            success (responseObj);
        }
    } failure:^(HttpException *e) {
        
        if(failure){
            failure(e);
        }
    }];
}

//入参加密
//- (NSDictionary *)secretBuild:(NSDictionary *)params{
//
//    return params;
//}

//URL拼接
//- (NSString *)urlWithPath:(NSString *)url{
//
//    return [NSString stringWithFormat:@"%@%@", BaseURL, url];
//}

- (void)requestWithPath:(NSString *)path params:(NSDictionary *)params method:(NSString *)method success:(void(^)(id responseObj))success failure:(void(^)(HttpException * e))failure{
    
    [self requestURL:path params:params method:method success:^(id responseObj) {
        
        NSInteger status = [[responseObj objectForKey:@"status"] integerValue];
        
        if(status == 200){
            //说明业务逻辑正常
            if(success){
                success(responseObj[@"data"]);
            }
        }else{
            //业务逻辑异常处理
            HttpException *e = [HttpException new];
            e.errorCode = status;
            e.message = [responseObj objectForKey:@"message"];
            
            if (failure) {
                failure(e);
            }
        }
        
    } failure:^(NSError *error) {
        
        HttpException *e = [HttpException new];
        e.errorCode = error.code;
        e.message = error.description;
        
        if (failure) {
            failure(e);
        }
    }];
}

@end
