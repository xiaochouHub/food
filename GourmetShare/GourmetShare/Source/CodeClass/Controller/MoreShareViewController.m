//
//  MoreShareViewController.m
//  GourmetShare
//
//  Created by lanou3g on 15/10/24.
//  Copyright © 2015年 jang. All rights reserved.
//

#import "MoreShareViewController.h"
#import "MoreShareView.h"

@interface MoreShareViewController ()

@property (nonatomic,strong)MoreShareView *more;

@end

@implementation MoreShareViewController
-(void)loadView
{
    self.more = [[MoreShareView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.view = _more;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
