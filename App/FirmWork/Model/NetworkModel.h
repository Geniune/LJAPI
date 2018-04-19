//
//  NetworkModel.h
//  App
//
//  Created by Apple on 2018/4/17.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "BaseModel.h"

@interface NetworkModel : NSObject

@end

@interface WeatherModel : BaseModel

@property (nonatomic, strong) NSString *api;//161
@property (nonatomic, strong) NSString *date;//19日星期四
@property (nonatomic, strong) NSString *sunrise;//05:33
@property (nonatomic, strong) NSString *sunset;//18:56
@property (nonatomic, strong) NSString *high;//高温 26.0℃
@property (nonatomic, strong) NSString *low;//低温 13.0℃
@property (nonatomic, strong) NSString *type;//多云
@property (nonatomic, strong) NSString *fx;//东南风
@property (nonatomic, strong) NSString *fl;//4-5级
@property (nonatomic, strong) NSString *notice;//阴晴之间，谨防紫外线侵扰

@end


@interface CityWeatherModel : BaseModel

@property (nonatomic, strong) NSString *shidu;//73%
@property (nonatomic, strong) NSString *wendu;//17
@property (nonatomic, strong) NSString *pm25;//150
@property (nonatomic, strong) NSString *pm10;//232
@property (nonatomic, strong) NSString *quality;//中度污染

@property (nonatomic, strong) WeatherModel *yesterday;//注意对象类型
@property (nonatomic, strong) NSArray *forecast;//注意对象类型

@end

