//
//  DetailMenuTableViewController.m
//  GourmetShare
//
//  Created by lanou3g on 15/10/15.
//  Copyright (c) 2015年 jang. All rights reserved.
//

#import "DetailMenuTableViewController.h"
#import "DetailMenuTableViewCell.h"

@interface DetailMenuTableViewController ()
@property(nonatomic,strong)NSMutableArray *dataArr;
@end

@implementation DetailMenuTableViewController
/////  第三层分类
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[DetailMenuTableViewCell class] forCellReuseIdentifier:@"cell"];
    self.dataArr = [NSMutableArray array];
    if (self.lastid == nil) {
        [[GetFoodDataTool shareGetFoodData]getFoodListInfoWithName:self.lastname PassValue:^(NSArray *array) {
            self.dataArr = (NSMutableArray *)array;
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self.tableView reloadData];
            });
        }];
    }
    else{
        [[GetFoodDataTool shareGetFoodData]getFoodListInfoWithId:self.lastid PassValue:^(NSArray *array) {
            self.dataArr = (NSMutableArray *)array;
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self.tableView reloadData];
            });
        }];
    }
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"redback.jpg"]];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)viewWillAppear:(BOOL)animated
{
    
//    [[GetFoodDataTool shareGetFoodData]getFoodListInfoWithId:self.lastid PassValues:^(NSMutableArray *arr) {
//        
//        
//        self.dataArr = [[NSMutableArray alloc]init];
//        self.dataArr = arr;
//        dispatch_async(dispatch_get_main_queue(), ^{
//            
//            [self.tableView reloadData];
//        });
//    }];
    
    
    
    

}
-(void)viewDidDisappear:(BOOL)animated
{
    [self.tableView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailTableViewController *detail = [[DetailTableViewController alloc]init];
    StuffModle *model = self.dataArr[indexPath.row];
    detail.stuffmodel = model;
    [self.navigationController pushViewController:detail animated:YES];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.dataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    StuffModle *model = self.dataArr[indexPath.row];
    cell.menuLabel.text = model.title;
    cell.backgroundColor = [UIColor colorWithRed:240 / 255.0 green:240 / 255.0 blue:240 / 255.0 alpha:0.5];
    //cell.menuLabel.text = @"菜单";
    // Configure the cell...
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
