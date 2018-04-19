//
//  AFHTTPSessionManager+ReactiveExtension.h
//  App
//
//  Created by Apple on 2018/4/17.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface AFHTTPSessionManager (ReactiveExtension)

- (RACSignal *)signalForRequest:(NSString *)url method:(NSString *)method parameters:(NSDictionary *)params;

@end
