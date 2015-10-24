//
//  MySelfTableViewController.m
//  GourmetShare
//
//  Created by lanou3g on 15/10/23.
//  Copyright © 2015年 jang. All rights reserved.
//

#import "MySelfTableViewController.h"
#import "MySelfImageTableViewCell.h"
#import "MySelfLabelTableViewCell.h"
@interface MySelfTableViewController ()

@end

@implementation MySelfTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[MySelfImageTableViewCell class] forCellReuseIdentifier:@"cell1"];
    [self.tableView registerClass:[MySelfLabelTableViewCell class] forCellReuseIdentifier:@"cell2"];
//    UINavigationBar *bar = self.navigationController.navigationBar;
//    [bar setBackgroundImage:[UIImage imageNamed:@"1.jpg"] forBarMetrics:UIBarMetricsCompactPrompt];
//    self.extendedLayoutIncludesOpaqueBars = YES;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 200;
    }
    else
        return 60;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 7;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        MySelfImageTableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"cell1" ];
        cell1.contentView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"purpleback.jpg"]];
        return cell1;
    }
    else
    {
        MySelfLabelTableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
        cell2.textLabeltext.textAlignment = NSTextAlignmentCenter;
        cell2.titleLabel.textAlignment = NSTextAlignmentRight;
        if (indexPath.row == 1) {
            cell2.titleLabel.text = @"昵称:";
            cell2.textLabeltext.text = @"某某某";
        }
        if (indexPath.row == 2) {
            cell2.titleLabel.text = @"账号:";
            cell2.textLabeltext.text = @"123456";
        }
        if (indexPath.row == 3) {
            cell2.titleLabel.text = @"性别:";
            cell2.textLabeltext.text = @"男";
        }
        if (indexPath.row == 4) {
            cell2.titleLabel.text = @"个人爱好:";
            cell2.textLabeltext.text = @"吃!吃!吃!";
        }
        if (indexPath.row == 5) {
            cell2.titleLabel.text = @"爱吃的菜:";
            cell2.textLabeltext.text = @"红烧鱼 糖醋里脊";
        }
        if (indexPath.row == 6) {
            cell2.titleLabel.text = @"会做的菜:";
            cell2.textLabeltext.text = @"........";
        }
        return cell2;
    }
    // Configure the cell...
    
  
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
