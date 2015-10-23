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
@property(nonatomic,strong)NSMutableArray *picArr;
@property(nonatomic,strong)NSMutableArray *titleArr;
@property(nonatomic,strong)SDCycleScrollView *view1;
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
    
    
    // 轮播图图片数组
    self.picArr = [NSMutableArray array];
    // 轮播图标题
    self.titleArr = [NSMutableArray array];
    
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
                    model =self.dataArr[4];
                    for (NSMutableString *str in model.albums) {
                        self.pic_url = str;
                    }
                    
                    [self.mView.oneImageView1 sd_setImageWithURL:[NSURL URLWithString:self.pic_url]];
                    self.mView.oneLabel1.text = model.title;
                    
                    
                    StuffModle *model1 = [[StuffModle alloc]init];
                    model1 =self.dataArr[5];
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
                    
                    // 轮播图数据
                    StuffModle *model3 = self.dataArr[0];
                    for (NSMutableString *str in model3.albums) {
                        self.pic_url = str;
                        UIImage *img1 = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.pic_url]]];
                        [self.picArr addObject:img1];
                        [self.titleArr addObject:model3.title];
                        
                        
                    }
                    
                    StuffModle *model4 = self.dataArr[1];
                    for (NSMutableString *str in model4.albums) {
                        self.pic_url = str;
                        UIImage *img2 = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.pic_url]]];
                        [self.picArr addObject:img2];
                        [self.titleArr addObject:model4.title];
                        
                    }
                    
                    StuffModle *model5 = self.dataArr[2];
                    for (NSMutableString *str in model5.albums) {
                        self.pic_url = str;
                        UIImage *img3 = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.pic_url]]];
                        [self.picArr addObject:img3];
                        [self.titleArr addObject:model5.title];
                        
                    }
                    
                    self.view1 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, kScreenWidth, 200) imagesGroup:self.picArr];
                    self.view1.titlesGroup = self.titleArr;
                    self.view1.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
                    self.view1.delegate = self;
                    [self.view addSubview:_view1];
                    // 断网处理
                    [self nethandle];
                });
                
                
                
            }];
        
    }];
    [self nethandle];
    self.mView.contentSize = CGSizeMake(self.mView.bounds.size.width, self.mView.bounds.size.height + 50);
    
    // 设置轮播图
    //NSArray *title = @[@"1",@"2",@"3",@"4",@"5"];
       // self.mView.mainCycleScrollView.titlesGroup = title;
    //self.mView.mainCycleScrollView.delegate = self;
    //self.mView.mainCycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    
    // 添加"更多"事件
    [self.mView.moreButton1 addTarget:self action:@selector(moreButton1Action:) forControlEvents:UIControlEventTouchUpInside];
//    self.mView.backgroundColor = [UIColor clearColor];
    

    
    
//    self.view.backgroundColor = [UIColor orangeColor];
    
    // Do any additional setup after loading the view.
}
// 断网处理
-(void)nethandle
{
    
        if (self.dataArr.count<1) {
            self.mView.oneImageView1.userInteractionEnabled = NO;
            self.mView.twoImageView1.userInteractionEnabled = NO;
            self.mView.threeImageView1.userInteractionEnabled = NO;
            self.view1.delegate = nil;
        }
        else
        {
            self.mView.oneImageView1.userInteractionEnabled = YES;
            self.mView.twoImageView1.userInteractionEnabled = YES;
            self.mView.threeImageView1.userInteractionEnabled = YES;
            self.view1.delegate = self;

        }
   
}

-(void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    if (self.dataArr[index] == nil) {
        
    }
    else
    {
        AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
        
        DetailTableViewController *detail =[[DetailTableViewController alloc]init];
        detail.stuffmodel = self.dataArr[index];
        [tempAppDelegate.LeftSlideVC closeLeftView];
        [tempAppDelegate.mainNavigationController pushViewController:detail animated:YES];
        
    }
   
    
}
// 手势点击事件
-(void)tapAction
{
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];

    DetailTableViewController *detail =[[DetailTableViewController alloc]init];
    detail.stuffmodel = self.dataArr[4];
    [tempAppDelegate.LeftSlideVC closeLeftView];
    [tempAppDelegate.mainNavigationController pushViewController:detail animated:YES];
}


-(void)tapAction1
{
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    DetailTableViewController *detail =[[DetailTableViewController alloc]init];
    detail.stuffmodel = self.dataArr[5];
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
