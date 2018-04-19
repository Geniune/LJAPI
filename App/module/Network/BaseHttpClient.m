//
//  BaseHttpClient.m
//  App
//
//  Created by Apple on 2018/4/17.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "BaseHttpClient.h"
#import "AFHTTPSessionManager+ReactiveExtension.h"

@interface BaseHttpClient ()

@property (nonatomic, strong, readwrite) AFHTTPSessionManager * http;

@property (nonatomic, strong) RACDisposable *disposable;

@end

@implementation BaseHttpClient

- (id)init{
    
    if(self == [super init]){
        [self process];
    }
    
    return self;
}

- (void)requestURL:(NSString *)url params:(NSDictionary *)params method:(NSString *)method success:(void(^)(id responseObj))success failure:(void(^)(NSError *error))failure{
    
    //发起一个HTTP请求
    [[_http signalForRequest:url method:method parameters:params] subscribeNext:^(id  _Nullable x) {
        
        if(success){
            success(x);
        }
    } error:^(NSError * _Nullable error) {
        
        if (failure) {
            failure(error);
        }
    }];
}

//取消上一个请求
- (void)cancleLastRequest{
    
    if(_disposable){
        [_disposable dispose];
        _disposable = nil;
    }
}

- (void)process{
    
    if (_http) {
        _http = nil;
    }
    _http = [AFHTTPSessionManager manager];
    _http.requestSerializer.timeoutInterval = 10.0f;
    
//    _http.securityPolicy = [self policy];
    
    //申明请求的方式是text/html格式
    _http.requestSerializer = [AFHTTPRequestSerializer serializer];
    //申明返回的结果是JSON格式
    _http.responseSerializer = [AFJSONResponseSerializer serializer];
    
//    [_http.requestSerializer setValue:@"text/plain" forHTTPHeaderField:@"Content-Type"];
}

- (AFSecurityPolicy *)policy{
    
    //根证书路径
    NSString * path = [[NSBundle mainBundle] pathForResource:@"ssl" ofType:@"cer"];
    NSData * cerData = [NSData dataWithContentsOfFile:path];
    
    //AFNetworking验证证书的object,AFSSLPinningModeCertificate参数决定了验证证书的方式
    AFSecurityPolicy * securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate withPinnedCertificates:[NSSet setWithObject:cerData]];
    //使用自建证书
    securityPolicy.allowInvalidCertificates=YES;
    //验证域名（一般不验证）
    securityPolicy.validatesDomainName=NO;
    
    return securityPolicy;
}

@end
