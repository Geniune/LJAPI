//
//  NetworkAPI.m
//  App
//
//  Created by Apple on 2018/4/17.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "NetworkAPI.h"

@implementation NetworkAPI

+ (void)weatherCity:(NSString *)city success:(void(^)(CityWeatherModel *model))success failure:(void(^)(HttpException * e))failure{
    
    NSString *urlStr = @"https://www.sojson.com/open/api/weather/json.shtml";
    
    NSDictionary *requestDic = @{@"city":city};//入参数据
    
    [HttpClientMgr get:urlStr params:requestDic success:^(id responseObj) {
        
        NSMutableArray *keyArray = [NSMutableArray array];
        [keyArray addObject:NSStringFromClass([WeatherModel  class])];
        [keyArray addObject:NSStringFromClass([WeatherModel  class])];
        
        NSMutableArray *valueArray = [NSMutableArray array];
        [valueArray addObject:@"yesterday"];
        [valueArray addObject:@"forecast"];

        CityWeatherModel *model = [CityWeatherModel parse:responseObj ClassArr:keyArray Elements:valueArray]; //NSDictionary -> Model
        
        if(success){
            success(model);
        }
        
    } failure:^(HttpException *e) {
        
        if(failure){
            failure(e);
        }
    }];
}

@end
