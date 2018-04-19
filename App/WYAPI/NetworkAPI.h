//
//  NetworkAPI.h
//  App
//
//  Created by Apple on 2018/4/17.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkModel.h"

@interface NetworkAPI : NSObject

/**
 天气预报

 @param city 城市名称
 @param success CityWeatherModel
 @param failure HttpException
 */
+ (void)weatherCity:(NSString *)city success:(void(^)(CityWeatherModel *model))success failure:(void(^)(HttpException * e))failure;

@end
