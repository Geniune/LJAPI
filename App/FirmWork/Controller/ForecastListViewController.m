//
//  ForecastListViewController.m
//  App
//
//  Created by Apple on 2018/4/18.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "ForecastListViewController.h"
#import "ForecastTableViewCell.h"
#import "NetworkAPI.h"

static NSString *cellIdentfier = @"ForecastTableViewCell";

@interface ForecastListViewController ()<UITableViewDataSource,UITableViewDelegate>{
    
    NSArray *_dataArr;
}

@property (nonatomic, strong) UITableView *mainTableView;

@end

@implementation ForecastListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupTableView];
    [self loadData];
}

- (void)loadData{

[NetworkAPI weatherCity:@"北京" success:^(CityWeatherModel *model) {

    NSArray *dataArr = model.forecast;

} failure:^(HttpException *e) {


}];
}

- (void)setupTableView{
    
    if(!_mainTableView){
        _mainTableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_mainTableView registerNib:[UINib nibWithNibName:cellIdentfier bundle:nil] forCellReuseIdentifier:cellIdentfier];
        [self.view addSubview:_mainTableView];
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [_dataArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ForecastTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentfier];
    
    [cell setCell:_dataArr[indexPath.row]];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return [ForecastTableViewCell getCellHeight:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
