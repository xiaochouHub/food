//
//  AllCategoryTableViewController.m
//  GourmetShare
//
//  Created by lanou3g on 15/10/15.
//  Copyright (c) 2015年 jang. All rights reserved.
//

#import "AllCategoryTableViewController.h"
#import "AllCategoryTableViewCell.h"

@interface AllCategoryTableViewController ()

@property(nonatomic,strong)NSMutableArray *dataArr;
@property(nonatomic,strong)NSMutableArray *btnArr;
@end

@implementation AllCategoryTableViewController
//// 第一层分类
- (void)viewDidLoad {
    [super viewDidLoad];
    [[GetFoodDataTool shareGetFoodData]getFoodDataWithPassValue:^(NSArray *array) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.dataArr = (NSMutableArray *)array;
                        [self.tableView reloadData];
            
                    });
    }];
    
    [self.tableView registerClass:[AllCategoryTableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"back.jpg"]]];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)viewWillAppear:(BOOL)animated
{
//    [[GetFoodDataTool shareGetFoodData] getFoodDataWithPassValue:^(NSArray *array) {
//        
//        self.dataArr = (NSMutableArray *)array;
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [self.tableView reloadData];
//            
//        });
//        
//    }];
    

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CategoryDetailTableViewController *detail = [[CategoryDetailTableViewController alloc]init];
    FoodCategoryModel *model = self.dataArr[indexPath.row]; 
    detail.parid = model.parentId;
    NSLog(@"第二个%@",model.parentId);
    [self.navigationController pushViewController:detail animated:YES];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
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
    AllCategoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.categoryLabel.text = @"分类";
    FoodCategoryModel *categorymodel = [[FoodCategoryModel alloc]init];
    categorymodel = self.dataArr[indexPath.row];
    cell.categoryLabel.text = categorymodel.name;
    self.btnArr = [NSMutableArray array];
//    [[GetFoodDataTool shareGetFoodData]getModleWithParentId:categorymodel.parentId PassValue:^(NSArray *array) {
//      
//        self.btnArr = (NSMutableArray *)array;
//        dispatch_async(dispatch_get_main_queue(), ^{
//            
//            [self.tableView reloadData];
//        });
//    }];
    //[cell.categoryButton1 setTitle:self.btnArr[indexPath.row] forState:UIControlStateNormal];
    
    cell.backgroundColor = [UIColor clearColor];
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
