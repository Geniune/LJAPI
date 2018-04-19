//
//  AFHTTPSessionManager+ReactiveExtension.m
//  App
//
//  Created by Apple on 2018/4/17.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "AFHTTPSessionManager+ReactiveExtension.h"

@implementation AFHTTPSessionManager (ReactiveExtension)

- (RACSignal *)signalForRequest:(NSString *)url method:(NSString *)method parameters:(NSDictionary *)params {
    
    return [[RACSignal createSignal:^RACDisposable *(id <RACSubscriber> subscriber) {//创建一个RACSignal
        
        NSURLSessionDataTask *dataTask = [self dataTaskWithHTTPMethod:method URLString:url parameters:params uploadProgress:^(NSProgress *uploadProgress) {
        } downloadProgress:^(NSProgress *downloadProgress) {
        } success:^(NSURLSessionDataTask *task, id responseObject) {

            [subscriber sendNext:responseObject];//成功回调
            [subscriber sendCompleted];
            
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            
            [subscriber sendError:error];//失败回调
            [subscriber sendCompleted];
        }];
        
        [dataTask resume];
        
        return [RACDisposable disposableWithBlock:^{
            //当信号销毁，请求也取消
            [dataTask cancel];
        }];
    }] replayLazily];
}

@end
