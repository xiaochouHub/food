//
//  SearchViewController.m
//  GourmetShare
//
//  Created by 马文豪 on 15/10/26.
//  Copyright © 2015年 jang. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchvView.h"
@interface SearchViewController ()
@property(nonatomic,strong)SearchvView *sv;
@end

@implementation SearchViewController
-(void)loadView
{
    self.sv = [[SearchvView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.view = _sv;
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