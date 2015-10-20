//
//  GourmetMainViewController.m
//  GourmetShare
//
//  Created by jang on 15/10/15.
//  Copyright © 2015年 jang. All rights reserved.
//

#import "GourmetMainViewController.h"
#import "MainView.h"

@interface GourmetMainViewController ()<SDCycleScrollViewDelegate>

@property (nonatomic,strong)MainView *mView;
@property(nonatomic,strong)NSMutableArray *dataArr;
@end

@implementation GourmetMainViewController
-(void)loadView
{
    self.mView = [[MainView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.view = _mView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArr = [NSMutableArray array];
//    [[GetFoodDataTool shareGetFoodData] 
//        dispatch_async(dispatch_get_main_queue(), ^{
//            FoodCategoryModel *model1  = self.dataArr[0];
//            [self.mView.oneImageView1 sd_setImageWithURL:[NSURL URLWithString:model1.]];
//            
//            
//            FoodCategoryModel *model2  = self.dataArr[1];
//            [self.mView.twoImageView1 sd_setImageWithURL:[NSURL URLWithString:model2.parentId]];
//            
//            
//            FoodCategoryModel *model3  = self.dataArr[2];
//            [self.mView.threeImageView1 sd_setImageWithURL:[NSURL URLWithString:model3.parentId]];
//        });
//        
//    }];
   
    self.mView.contentSize = CGSizeMake(self.mView.bounds.size.width, self.mView.bounds.size.height * 2);
    
    // 设置轮播图
    NSArray *title = @[@"1",@"2",@"3",@"4",@"5"];
    self.mView.mainCycleScrollView.titlesGroup = title;
    self.mView.mainCycleScrollView.delegate = self;
    self.mView.mainCycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    
    // 添加"更多"事件
    [self.mView.moreButton1 addTarget:self action:@selector(moreButton1Action:) forControlEvents:UIControlEventTouchUpInside];
    
//    self.mView.backgroundColor = [UIColor clearColor];
    

    
    
//    self.view.backgroundColor = [UIColor orangeColor];
    
    // Do any additional setup after loading the view.
}
// "更多"点击事件
-(void)moreButton1Action:(UIButton *)sender
{
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    AllCategoryTableViewController *all = [[AllCategoryTableViewController alloc]init];
    
    [tempAppDelegate.LeftSlideVC closeLeftView];
    
    [tempAppDelegate.mainNavigationController pushViewController:all animated:YES];
    
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
