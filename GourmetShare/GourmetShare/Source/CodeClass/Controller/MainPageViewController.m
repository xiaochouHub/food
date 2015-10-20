//
//  MainPageViewController.m
//  GourmetShare
//
//  Created by jang on 15/10/15.
//  Copyright © 2015年 jang. All rights reserved.
//

#import "MainPageViewController.h"


@interface MainPageViewController ()<UITabBarControllerDelegate>



@end

@implementation MainPageViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"主界面";
 
//    [[GetFoodDataTool shareGetFoodData] getFoodDataWithPassValue:^(NSArray *array) {
//        
//        
//       
//    }];

    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *menuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    menuBtn.frame = CGRectMake(0, 0, 30, 30);
    menuBtn.layer.cornerRadius = 15;
    menuBtn.layer.masksToBounds = YES;
    [menuBtn setBackgroundImage:[UIImage imageNamed:@"back.jpg"] forState:UIControlStateNormal];
    [menuBtn addTarget:self action:@selector(openOrCloseLeftList) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:menuBtn];
    
    
    PopInfoListViewController *popVC = [[PopInfoListViewController alloc]init];
    
    UINavigationController *popNC = [[UINavigationController alloc]initWithRootViewController:popVC];
    
    popNC.tabBarItem = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemFeatured tag:101];
    
    GourmetMainViewController *gouVC = [[GourmetMainViewController alloc]init];
    
    UINavigationController *gouNC = [[UINavigationController alloc]initWithRootViewController:gouVC];
    
    gouNC.tabBarItem = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemFeatured tag:102];
    
    PrivateListViewController *priVC = [[PrivateListViewController alloc]init];
    
    UINavigationController *priNC = [[UINavigationController alloc]initWithRootViewController:priVC];
    
    priNC.tabBarItem = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemFeatured tag:103];
    
    //放它管理的controller
    self.viewControllers = @[popNC,gouNC,priNC];

    
    self.delegate = self;
    
    
    self.tabBar.tintColor = [UIColor orangeColor];
    
    self.tabBar.barTintColor = [UIColor brownColor];
    
    self.selectedIndex = 1;
    
//    [[UINavigationBar appearance]setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
}
// 点击tabbar刷新
-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    if (viewController.tabBarItem.tag == 101) {
        UINavigationController *navigation =(UINavigationController *)viewController;
        PopInfoListViewController *pop = (PopInfoListViewController *)navigation.topViewController;
        
        //[pop p_data];
        [pop setupRefresh];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) openOrCloseLeftList
{
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if (tempAppDelegate.LeftSlideVC.closed)
    {
        [tempAppDelegate.LeftSlideVC openLeftView];
    }
    else
    {
        [tempAppDelegate.LeftSlideVC closeLeftView];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    //NSLog(@"viewWillDisappear");
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [tempAppDelegate.LeftSlideVC setPanEnabled:NO];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //NSLog(@"viewWillAppear");
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [tempAppDelegate.LeftSlideVC setPanEnabled:YES];
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
