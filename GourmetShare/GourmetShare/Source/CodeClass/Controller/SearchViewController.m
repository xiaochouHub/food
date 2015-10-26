//
//  SearchViewController.m
//  GourmetShare
//
//  Created by 马文豪 on 15/10/26.
//  Copyright © 2015年 jang. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchvView.h"
@interface SearchViewController ()<UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
@property(nonatomic,strong)SearchvView *sv;
@property(nonatomic,strong)NSMutableArray *dataArr;
@end

@implementation SearchViewController
-(void)loadView
{
    self.sv = [[SearchvView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.view = _sv;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArr = [NSMutableArray array];
    self.sv.searchList.delegate = self;
    self.sv.searchList.dataSource = self;
    UIApplication *app = [UIApplication sharedApplication];
    [app setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
    self.sv.search.delegate = self;
    //UITextField *searchfield  = [[self.sv.search subviews] lastObject];
    //[searchfield setReturnKeyType:UIReturnKeyDone];
    self.sv.search.keyboardType = UIKeyboardAppearanceDefault;
    
    UIToolbar * topView = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 30)];
    [topView setBarStyle:UIBarStyleBlackTranslucent];
    
    UIBarButtonItem * btnSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(2, 5, CGRectGetWidth([[UIScreen mainScreen]bounds]), 25);
    [btn addTarget:self action:@selector(dismissKeyBoard) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"   ↓收起↓" forState:UIControlStateNormal];
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc]initWithCustomView:btn];
    NSArray * buttonsArray = [NSArray arrayWithObjects:btnSpace,doneBtn,nil];
    [topView setItems:buttonsArray];
   
}
-(void)dismissKeyBoard
{
    [self.sv.search resignFirstResponder];
    [self.sv.searchList resignFirstResponder];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    StuffModle *model = self.dataArr[indexPath.row];
    cell.textLabel.text = model.title;
    
    return cell;
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.sv.search resignFirstResponder];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.sv.search resignFirstResponder];
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    
    [tempAppDelegate.LeftSlideVC closeLeftView];

    StuffModle *modle = self.dataArr[indexPath.row];
    
    DetailTableViewController *detail = [[DetailTableViewController alloc]init];
    
    detail.stuffmodel = [[GetFoodDataTool shareGetFoodData]getPopFoodInfoWithSid:modle.sid];
    [tempAppDelegate.mainNavigationController pushViewController:detail animated:YES];
    
}
-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    NSLog(@"momo");
    [self.sv.search resignFirstResponder];//键盘回收
}
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"haha");
    
}
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"hehe");
    [[SearchDataTool shareSearchData]searchWithKeyword:self.sv.search.text PassValue:^(NSArray *array) {
      
        self.dataArr = (NSMutableArray *)array;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.sv.searchList reloadData];
        });
    }];
    [self.sv.search resignFirstResponder];//键盘回收
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
