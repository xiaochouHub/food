//
//  PopInfoListViewController.m
//  GourmetShare
//
//  Created by jang on 15/10/15.
//  Copyright © 2015年 jang. All rights reserved.
//

#import "PopInfoListViewController.h"
#import "NewsTableViewCell.h"

@interface PopInfoListViewController ()
@property(nonatomic,strong)NSMutableArray *dataArr;
@end

@implementation PopInfoListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    self.dataArr = [NSMutableArray array];
    [self.tableView registerClass:[NewsTableViewCell class] forCellReuseIdentifier:@"news"];
    [[GetNewsDataTool shareGetNewsData]getNewsDataWithPassValue:^(NSArray *array) {
        self.dataArr = (NSMutableArray *)array;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
        
    }];
    [self setupRefresh];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)setupRefresh
{
    //1.添加刷新控件
    UIRefreshControl *control=[[UIRefreshControl alloc]init];
    [control addTarget:self action:@selector(refreshStateChange:) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:control];
    
    //2.马上进入刷新状态，并不会触发UIControlEventValueChanged事件
    [control beginRefreshing];
    
    // 3.加载数据
    [self refreshStateChange:control];
    
}
-(void)refreshStateChange:(UIRefreshControl *)control
{
    
    [[GetNewsDataTool shareGetNewsData]getNewsDataWithPassValue:^(NSArray *array) {
        self.dataArr = (NSMutableArray *)array;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
        
    }];
    // 3. 结束刷新
        [control endRefreshing];
        
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.dataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"news" forIndexPath:indexPath];
    
    News *new = [[News alloc]init];
    new = self.dataArr[indexPath.row];
    cell.titleLabel.text = new.title;
    // 有图片加载,没图片不加载
    if (new.image.count<1) {
        
    }
    else
    {
        NSMutableString *picStr = new.image[0];
        NSLog(@"%@",picStr);
        [cell.titleImage sd_setImageWithURL:[NSURL URLWithString:picStr]];
    }
   
    //[cell.titleImage sd_setImageWithURL:[NSURL URLWithString:new.image[0]]];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
