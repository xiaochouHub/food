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
@property(nonatomic,strong)NSMutableString *pic_url;
@property(nonatomic,strong)UITapGestureRecognizer *tap;
@property(nonatomic,strong)UITapGestureRecognizer *tap1;
@property(nonatomic,strong)UITapGestureRecognizer *tap2;
@property(nonatomic,assign)NSInteger number;
@property(nonatomic,strong)NSMutableArray *fdataArr;
@end

@implementation GourmetMainViewController
-(void)loadView
{
    self.mView = [[MainView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.view = _mView;
}

-(NSInteger)randomnum
{
    NSInteger num = arc4random()%28+10001;
    return num;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // 给imageview添加点击手势
    self.tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
    self.mView.oneImageView1.userInteractionEnabled = YES;
    [self.mView.oneImageView1 addGestureRecognizer:_tap];

    self.tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction1)];
    self.mView.twoImageView1.userInteractionEnabled = YES;
    [self.mView.twoImageView1 addGestureRecognizer:_tap1];

    
    self.tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction2)];
    self.mView.threeImageView1.userInteractionEnabled = YES;
    [self.mView.threeImageView1 addGestureRecognizer:_tap2];

    self.fdataArr = [NSMutableArray array];
    self.dataArr = [NSMutableArray array];
    self.number = [self randomnum];
    [[GetFoodDataTool shareGetFoodData]getListWithParentId:[NSMutableString stringWithFormat:@"%ld",self.number] PassValue:^(NSArray *array) {
        self.fdataArr = (NSMutableArray *)array;
        FoodListModle *model = self.fdataArr[0];
        [[GetFoodDataTool shareGetFoodData]getFoodListInfoWithId:model.lid PassValue:^(NSArray *array) {
          
            self.dataArr = (NSMutableArray *)array;
            dispatch_async(dispatch_get_main_queue(), ^{
                
                StuffModle *model = [[StuffModle alloc]init];
                model =self.dataArr[1];
                for (NSMutableString *str in model.albums) {
                    self.pic_url = str;
                }
                
                [self.mView.oneImageView1 sd_setImageWithURL:[NSURL URLWithString:self.pic_url]];
                self.mView.oneLabel1.text = model.title;
                
                
                StuffModle *model1 = [[StuffModle alloc]init];
                model1 =self.dataArr[2];
                for (NSMutableString *str in model1.albums) {
                    self.pic_url = str;
                }
                
                [self.mView.twoImageView1 sd_setImageWithURL:[NSURL URLWithString:self.pic_url]];
                self.mView.twoLabel1.text = model1.title;
                
                
                StuffModle *model2 = [[StuffModle alloc]init];
                model2 =self.dataArr[3];
                for (NSMutableString *str in model2.albums) {
                    self.pic_url = str;
                }
                
                [self.mView.threeImageView1 sd_setImageWithURL:[NSURL URLWithString:self.pic_url]];
                self.mView.threeLabel1.text = model2.title;
            });
            
                

        }];
        
        
    }];
//    [[GetFoodDataTool shareGetFoodData]getFoodListInfoWithId:[NSMutableString stringWithFormat:@"%ld",self.number] PassValue:^(NSArray *array) {
//        self.dataArr = (NSMutableArray *)array;
//        dispatch_async(dispatch_get_main_queue(), ^{
//            
//            StuffModle *model = [[StuffModle alloc]init];
//            model =self.dataArr[1];
//            for (NSMutableString *str in model.albums) {
//                self.pic_url = str;
//            }
//
//            [self.mView.oneImageView1 sd_setImageWithURL:[NSURL URLWithString:self.pic_url]];
//            self.mView.oneLabel1.text = model.title;
//            
//            
//            StuffModle *model1 = [[StuffModle alloc]init];
//            model1 =self.dataArr[2];
//            for (NSMutableString *str in model1.albums) {
//                self.pic_url = str;
//            }
//            
//            [self.mView.twoImageView1 sd_setImageWithURL:[NSURL URLWithString:self.pic_url]];
//            self.mView.twoLabel1.text = model1.title;
//            
//            
//            StuffModle *model2 = [[StuffModle alloc]init];
//            model2 =self.dataArr[3];
//            for (NSMutableString *str in model2.albums) {
//                self.pic_url = str;
//            }
//            
//            [self.mView.threeImageView1 sd_setImageWithURL:[NSURL URLWithString:self.pic_url]];
//            self.mView.threeLabel1.text = model2.title;
//            
//            
//            
//        });
//    }];
    
    self.mView.contentSize = CGSizeMake(self.mView.bounds.size.width, self.mView.bounds.size.height + 50);
    
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

// 手势点击事件
-(void)tapAction
{
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];

    DetailTableViewController *detail =[[DetailTableViewController alloc]init];
    detail.stuffmodel = self.dataArr[1];
    [tempAppDelegate.LeftSlideVC closeLeftView];
    [tempAppDelegate.mainNavigationController pushViewController:detail animated:YES];
}


-(void)tapAction1
{
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    DetailTableViewController *detail =[[DetailTableViewController alloc]init];
    detail.stuffmodel = self.dataArr[2];
    [tempAppDelegate.LeftSlideVC closeLeftView];
    [tempAppDelegate.mainNavigationController pushViewController:detail animated:YES];
}


-(void)tapAction2
{
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    DetailTableViewController *detail =[[DetailTableViewController alloc]init];
    detail.stuffmodel = self.dataArr[3];
    [tempAppDelegate.LeftSlideVC closeLeftView];
    [tempAppDelegate.mainNavigationController pushViewController:detail animated:YES];
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
