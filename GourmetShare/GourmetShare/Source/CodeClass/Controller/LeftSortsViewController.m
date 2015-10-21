//
//  LeftSortsViewController.m
//  GourmetShare
//
//  Created by jang on 15/10/15.
//  Copyright © 2015年 jang. All rights reserved.
//

#import "LeftSortsViewController.h"
#import "LeftSortsView.h"

@interface LeftSortsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableview;
@property (nonatomic,strong) UIImageView *backImage;
@property (nonatomic,strong) LeftSortsView *lv;
@end

@implementation LeftSortsViewController

-(void)loadView
{
    self.lv = [[LeftSortsView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.view = _lv;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.backImage = [[UIImageView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.backImage.image = [UIImage imageNamed:@"back.jpg"];
    _lv.backgroundColor = [UIColor colorWithPatternImage:self.backImage.image];
    
    _lv.tableview.dataSource = self;
    _lv.tableview.delegate  = self;
    _lv.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [_lv.headButton addTarget:self action:@selector(headButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    //button置为顶层view，不然事件不能触发
    [_lv bringSubviewToFront:_lv.headButton];
    
}

- (void)headButtonAction:(UIButton *)sender
{
    if ([RegisterDataTool shareRegisterData].LoginName == nil) {
        LoginViewController *lv = [[LoginViewController alloc]init];
        AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        [tempAppDelegate.LeftSlideVC closeLeftView];//关闭左侧抽屉
        
        [tempAppDelegate.mainNavigationController pushViewController:lv animated:NO];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Identifier = @"Identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.font = [UIFont systemFontOfSize:18.0];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"首  页";
    } else if (indexPath.row == 1) {
        cell.textLabel.text = @"个人信息";
    } else if (indexPath.row == 2) {
        cell.textLabel.text = @"我的收藏";
    } else if (indexPath.row == 3) {
        cell.textLabel.text = @"我的分享";
    } else if (indexPath.row == 4) {
        cell.textLabel.text = @"本地下载";
    } else if (indexPath.row == 5) {
        cell.textLabel.text = @"清除缓存";
    } else if (indexPath.row == 6) {
        cell.textLabel.text = @"注  销";
    }else if (indexPath.row == 7) {
        cell.textLabel.text = @"退  出";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//    otherViewController *vc = [[otherViewController alloc] init];
//    [tempAppDelegate.LeftSlideVC closeLeftView];//关闭左侧抽屉
//    
//    [tempAppDelegate.mainNavigationController pushViewController:vc animated:NO];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 180;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableview.bounds.size.width, 180)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

@end
