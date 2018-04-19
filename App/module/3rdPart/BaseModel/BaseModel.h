//
//  BaseModel.h
//  App
//
//  Created by Geniune on 16/8/5.
//  Copyright © 2016年 Geniune. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject<NSCopying>

/*!
 @method
 @brief 将对象参数转NSDictionary
 @result 返回对象
 */
- (NSDictionary*)dictionaryModel;

/*!
 @method
 @brief 将json数据转换成对象
 @param json 数据
 @result 返回对象
 */
+(id)parse:(id)json;

/*!
 @method
 @brief 将json数据转换成对象数据
 @param json 数据
 @param classA 要数组内所包含的对象的数组
 @param elements 包含多多对象多属性的数据
 @result 返回对象
 */
+(id)parse:(id)json ClassArr:(NSMutableArray *)classA Elements:(NSMutableArray *)elements;

@end
