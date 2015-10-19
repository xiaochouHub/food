//
//  DetailTableViewController.m
//  GourmetShare
//
//  Created by lanou3g on 15/10/15.
//  Copyright (c) 2015年 jang. All rights reserved.
//

#import "DetailTableViewController.h"
#import "TitleTableViewCell.h"
#import "ImtroTableViewCell.h"
#import "TagsTableViewCell.h"
#import "IngredientsTableViewCell.h"
#import "StepTableViewCell.h"
#import "BurdenTableViewCell.h"

@interface DetailTableViewController ()
@property(nonatomic,strong)NSMutableArray *groupArr;
@property(nonatomic,strong)NSMutableDictionary *dataDic;
@property(nonatomic,strong)NSMutableArray *stepArr;// 步骤数组
@property(nonatomic,strong)NSMutableString *pic_url;// 标题图片


@property(nonatomic,strong)NSMutableArray *ingreArr;// 食材数组
@property(nonatomic,strong)NSMutableArray *burdenArr;// 配料数组
@property(nonatomic,strong)NSMutableString *s;
@property(nonatomic,strong)ImtroTableViewCell *ic;// 简介cell

@property(nonatomic,assign)BOOL flag;
@property(nonatomic,assign)CGFloat height; // 返回简介的高度
@property(nonatomic,assign)CGFloat stepheight;// 步骤的高度


@end

@implementation DetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[TitleTableViewCell class] forCellReuseIdentifier:@"title"];
    
    [self.tableView registerClass:[ImtroTableViewCell class] forCellReuseIdentifier:@"imtro"];
    
    [self.tableView registerClass:[TagsTableViewCell class] forCellReuseIdentifier:@"tags"];
    
    [self.tableView registerClass:[IngredientsTableViewCell class] forCellReuseIdentifier:@"ingredients"];
    
    [self.tableView registerClass:[StepTableViewCell class] forCellReuseIdentifier:@"step"];
    [self.tableView registerClass:[BurdenTableViewCell class] forCellReuseIdentifier:@"burden"];
    [self p_data];
    self.flag = YES;
    self.height = 230;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"back.jpg"]]];
    

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
// 简介字符串截取高度
-(CGFloat)heightforstring:(NSString *)string
{
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:18.0]};
    CGRect rect = [string boundingRectWithSize:CGSizeMake(CGRectGetWidth([[UIScreen mainScreen]bounds]) - 20, 5000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    
    return rect.size.height;
    
}

// stepcell的截取字符串高度
-(CGFloat)heightforstring1:(NSString *)string
{
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:18.0]};
    CGRect rect = [string boundingRectWithSize:CGSizeMake(CGRectGetWidth([[UIScreen mainScreen]bounds]) / 2 - 5 , 5000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    
    return rect.size.height;
    
}
-(void)p_data
{
    self.dataDic = [NSMutableDictionary dictionary];
    self.groupArr = [NSMutableArray array];
    self.ingreArr = [NSMutableArray array];
    self.burdenArr = [NSMutableArray array];
    self.stepArr = self.stuffmodel.steps;
    self.ingreArr = (NSMutableArray *)[self.stuffmodel.ingredients componentsSeparatedByString:@";"];
    self.burdenArr = (NSMutableArray *)[self.stuffmodel.burden componentsSeparatedByString:@";"];
    
    
    NSLog(@"%@",self.stepArr);
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
// 返回cell的高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 220;
    }
    else if(indexPath.section == 1)
    {
        return self.height+30;
    }
    else if(indexPath.section == 2)
    {
        return 200;
    }
    else if(indexPath.section == 3)
    {
        return 30;
    }
    else if(indexPath.section == 4)
    {
        return 30;
    }
    else
    {
        if (self.stepheight >200) {
            return self.stepheight+40;
        }
        else{
            return 200;
        }
        
    }
}
// 分组头部的高
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 30;
}


// 分区头标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    tableView.backgroundColor = [UIColor colorWithRed:240 / 255.0 green:240 / 255.0 blue:240 / 255.0 alpha:0.5];
    if (section == 0) {
        return @"菜名";
    }
    else if(section == 1)
    {
        return @"简介";
    }
    else if(section == 2)
    {
        return @"食用场景";
    }
    else if(section == 3)
    {
        return @"食材和配料";
    }
    else if (section == 4)
    {
        return @"配料";
    }
    else
    {
        return @"做法和步骤";
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    if (section == 0) {
        
        return 1;
    }
    else if (section == 1)
    {
        return 1;
    }
    else if (section == 2)
    {
        return 1;
    }
    else if (section == 3)
    {
        return self.ingreArr.count;
    }
    else if(section == 4)
    {
        return self.burdenArr.count;
    }
    else if(section == 5)
    {
        NSLog(@"%lu",self.stuffmodel.steps.count);
        return self.stuffmodel.steps.count;
        
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        TitleTableViewCell *title = [tableView dequeueReusableCellWithIdentifier:@"title"];
        title.albumsImage.image = [UIImage imageNamed:@"5.jpg"];

        self.pic_url = [NSMutableString string];
        for (NSMutableString *str in self.stuffmodel.albums) {
            self.pic_url = str;
        }
        [title.albumsImage sd_setImageWithURL:[NSURL URLWithString:_pic_url]];
        title.nameLabel.text = self.stuffmodel.title;

        title.backgroundColor = [UIColor colorWithRed:240 / 255.0 green:240 / 255.0 blue:240 / 255.0 alpha:0.5];

        return title;
    }
    else if(indexPath.section == 1)
    {
        ImtroTableViewCell *imtro = [tableView dequeueReusableCellWithIdentifier:@"imtro"];

        imtro.imtroLabel.text = self.stuffmodel.imtro;
        // 截取字符串,改变label的高度
        CGFloat tempHeight = [self heightforstring:self.stuffmodel.imtro];
        CGRect temprect = imtro.imtroLabel.frame;
        temprect.size.height = tempHeight;
        imtro.imtroLabel.frame = temprect;
        self.height = tempHeight;
            return imtro;

        imtro.backgroundColor = [UIColor colorWithRed:240 / 255.0 green:240 / 255.0 blue:240 / 255.0 alpha:0.5];
        return imtro;

    }
    else if (indexPath.section == 2)
    {
        
        TagsTableViewCell *tags = [tableView dequeueReusableCellWithIdentifier:@"tags"];

        tags.tagsLabel.text = self.stuffmodel.tags;

        tags.backgroundColor = [UIColor colorWithRed:240 / 255.0 green:240 / 255.0 blue:240 / 255.0 alpha:0.5];

        return tags;
    }
    else if (indexPath.section == 3)
    {
        IngredientsTableViewCell *ingredients = [tableView dequeueReusableCellWithIdentifier:@"ingredients"];

        //ingredients.nameLabel.text = self.ingreArr[indexPath.row];
        // 把数组赋给s
        NSString *s = [NSString stringWithFormat:@"%@",self.ingreArr[indexPath.row]];
        // 通过截取s取得数组arr
        NSArray *arr = [s componentsSeparatedByString:@","];
        ingredients.nameLabel.text = [arr objectAtIndex:0];
        ingredients.numLabel.text = [arr objectAtIndex:1];

        ingredients.backgroundColor = [UIColor colorWithRed:240 / 255.0 green:240 / 255.0 blue:240 / 255.0 alpha:0.5];

        return ingredients;
    }
    else if (indexPath.section == 4)
    {
        BurdenTableViewCell *burden = [tableView dequeueReusableCellWithIdentifier:@"burden"];
        NSString *s1 = [NSString stringWithFormat:@"%@",self.burdenArr[indexPath.row]];
        NSArray *arr1 = [s1 componentsSeparatedByString:@","];
        burden.nameLabel.text = [arr1 objectAtIndex:0];
        burden.numLabel.text = [arr1 objectAtIndex:1];
        return burden;
    }
    else if(indexPath.section == 5)
    {
        StepTableViewCell *step = [tableView dequeueReusableCellWithIdentifier:@"step"];

        [step.stepImage sd_setImageWithURL:[NSURL URLWithString:[self.stepArr[indexPath.row] objectForKey:@"img"]]];
        //[NSURL URLWithString:[self.stepArr[indexPath.row] objectForKey:@"img"]]
        //[step.stepImage ];
        step.stepLabel.text = [self.stepArr[indexPath.row] objectForKey:@"step"];
        CGFloat tempHeight = [self heightforstring1:[self.stepArr[indexPath.row] objectForKey:@"step"]];
        CGRect temprect = step.stepLabel.frame;
        temprect.size.height = tempHeight;
        step.stepLabel.frame = temprect;
        self.stepheight = tempHeight;
        
        step.backgroundColor = [UIColor colorWithRed:240 / 255.0 green:240 / 255.0 blue:240 / 255.0 alpha:0.5];
        
        return step;
    }
    return 0;
    
    
    
    
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
