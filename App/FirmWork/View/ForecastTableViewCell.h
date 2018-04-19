//
//  ForecastTableViewCell.h
//  App
//
//  Created by Apple on 2018/4/18.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetworkModel.h"

@interface ForecastTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UILabel *highTempLabel;
@property (weak, nonatomic) IBOutlet UILabel *lowTempLabel;
@property (weak, nonatomic) IBOutlet UILabel *fLabel;

- (void)setCell:(WeatherModel *)model;

+ (CGFloat)getCellHeight:(id)data;

@end
