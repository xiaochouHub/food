//
//  ShareDetailViewController.m
//  GourmetShare
//
//  Created by lanou3g on 15/10/23.
//  Copyright © 2015年 jang. All rights reserved.
//

#import "ShareDetailViewController.h"
#import "ShareDetailView.h"

@interface ShareDetailViewController ()

@property (nonatomic,strong)ShareDetailView *share;

@end

@implementation ShareDetailViewController
-(void)loadView
{
    self.share = [[ShareDetailView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.view = _share;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.share.backScroll.contentSize = CGSizeMake(CGRectGetWidth([[UIScreen mainScreen]bounds]), CGRectGetHeight([[UIScreen mainScreen]bounds]) * 2);
    
    
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
