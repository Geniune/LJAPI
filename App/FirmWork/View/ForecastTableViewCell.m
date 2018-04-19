//
//  ForecastTableViewCell.m
//  App
//
//  Created by Apple on 2018/4/18.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "ForecastTableViewCell.h"

@implementation ForecastTableViewCell

+ (CGFloat)getCellHeight:(id)data{
    
    return 90.0f;
}

- (void)setCell:(WeatherModel *)model{
    
    _dateLabel.text = model.date;
    _typeLabel.text = model.type;
    _highTempLabel.text = model.high;
    _lowTempLabel.text = model.low;
    _fLabel.text = [NSString stringWithFormat:@"%@ %@", model.fx, model.fl];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
