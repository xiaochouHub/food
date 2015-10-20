//
//  MainView.m
//  GourmetShare
//
//  Created by lanou3g on 15/10/15.
//  Copyright (c) 2015年 jang. All rights reserved.
//

#import "MainView.h"

@implementation MainView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self p_setView];
    }
    return self;
}

-(void)p_setView
{
    // 主循环滚动图
    NSArray *arr = @[[UIImage imageNamed:@"1.jpg"],[UIImage imageNamed:@"2.jpg"],[UIImage imageNamed:@"3.jpg"],[UIImage imageNamed:@"4.jpg"],[UIImage imageNamed:@"5.jpg"]];
    _mainCycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, self.bounds.size.width, 200) imagesGroup:arr];
    [self addSubview:_mainCycleScrollView];
    
    // 分组名
    _titleLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.mainCycleScrollView.frame) + 10, CGRectGetMaxY(self.mainCycleScrollView.frame) + 5, 50, 30)];
//    _titleLabel1.backgroundColor = [UIColor grayColor];
    _titleLabel1.text = @"美食";
    [self addSubview:_titleLabel1];
    
    // "更多"按钮
    _moreButton1 = [UIButton buttonWithType:UIButtonTypeSystem];
    _moreButton1.frame = CGRectMake(CGRectGetMaxX(self.bounds) - 60, CGRectGetMinY(self.titleLabel1.frame), 50, 30);
//    _moreButton1.backgroundColor = [UIColor grayColor];
    [_moreButton1 setTitle:@"更多＞" forState:UIControlStateNormal];
    [self addSubview:_moreButton1];
    
    // 三组图片及图片标题
    // 1
    _oneImageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.titleLabel1.frame) - 5, CGRectGetMaxY(self.titleLabel1.frame) + 5, (self.bounds.size.width-20) / 3, (self.bounds.size.width-20) / 3)];
    _oneImageView1.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:_oneImageView1];
    _oneLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.oneImageView1.frame), CGRectGetMaxY(self.oneImageView1.frame) + 5, CGRectGetWidth(self.oneImageView1.frame), 50)];
    _oneLabel1.backgroundColor = [UIColor cyanColor];
    _oneLabel1.numberOfLines = 0;
    [self addSubview:_oneLabel1];
    
    // 2
    _twoImageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.oneImageView1.frame) + 5, CGRectGetMinY(self.oneImageView1.frame), (self.bounds.size.width-20) / 3, (self.bounds.size.width-20) / 3)];
    _twoImageView1.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:_twoImageView1];
    _twoLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.twoImageView1.frame), CGRectGetMaxY(self.twoImageView1.frame) + 5, CGRectGetWidth(self.twoImageView1.frame), 50)];
    _twoLabel1.backgroundColor = [UIColor cyanColor];
    _twoLabel1.numberOfLines = 0;
    [self addSubview:_twoLabel1];
    
    // 3
    _threeImageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.twoImageView1.frame) + 5, CGRectGetMinY(self.twoImageView1.frame), (self.bounds.size.width-20) / 3, (self.bounds.size.width-20) / 3)];
    _threeImageView1.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:_threeImageView1];
    _threeLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.threeImageView1.frame), CGRectGetMaxY(self.threeImageView1.frame) + 5, CGRectGetWidth(self.threeImageView1.frame), 50)];
    _threeLabel1.backgroundColor = [UIColor cyanColor];
    _threeLabel1.numberOfLines = 0;
    [self addSubview:_threeLabel1];
    
    
    
    // 分组名
    _titleLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.mainCycleScrollView.frame) + 10, CGRectGetMaxY(self.threeLabel1.frame) + 5, 50, 30)];
    _titleLabel2.backgroundColor = [UIColor grayColor];
    _titleLabel2.text = @"其他";
    [self addSubview:_titleLabel2];
    
    // "更多"按钮
    _moreButton2 = [UIButton buttonWithType:UIButtonTypeSystem];
    _moreButton2.frame = CGRectMake(CGRectGetMaxX(self.bounds) - 60, CGRectGetMinY(self.titleLabel2.frame), 50, 30);
    _moreButton2.backgroundColor = [UIColor grayColor];
    [_moreButton2 setTitle:@"更多＞" forState:UIControlStateNormal];
    [self addSubview:_moreButton2];
    
    // 三组图片及图片标题
    // 1
    _oneImageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.titleLabel2.frame) - 5, CGRectGetMaxY(self.titleLabel2.frame) + 5, (self.bounds.size.width-20) / 3, (self.bounds.size.width-20) / 3)];
    _oneImageView2.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:_oneImageView2];
    _oneLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.oneImageView2.frame), CGRectGetMaxY(self.oneImageView2.frame) + 5, CGRectGetWidth(self.oneImageView2.frame), 50)];
    _oneLabel2.backgroundColor = [UIColor cyanColor];
    _oneLabel2.numberOfLines = 0;
    [self addSubview:_oneLabel2];
    
    // 2
    _twoImageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.oneImageView2.frame) + 5, CGRectGetMinY(self.oneImageView2.frame), (self.bounds.size.width-20) / 3, (self.bounds.size.width-20) / 3)];
    _twoImageView2.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:_twoImageView2];
    _twoLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.twoImageView2.frame), CGRectGetMaxY(self.twoImageView2.frame) + 5, CGRectGetWidth(self.twoImageView2.frame), 50)];
    _twoLabel2.backgroundColor = [UIColor cyanColor];
    _twoLabel2.numberOfLines = 0;
    [self addSubview:_twoLabel2];
    
    // 3
    _threeImageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.twoImageView2.frame) + 5, CGRectGetMinY(self.twoImageView2.frame), (self.bounds.size.width-20) / 3, (self.bounds.size.width-20) / 3)];
    _threeImageView2.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:_threeImageView2];
    _threeLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.threeImageView2.frame), CGRectGetMaxY(self.threeImageView2.frame) + 5, CGRectGetWidth(self.threeImageView2.frame), 50)];
    _threeLabel2.backgroundColor = [UIColor cyanColor];
    _threeLabel2.numberOfLines = 0;
    [self addSubview:_threeLabel2];
    

    
    
    
    
}

//-(SDCycleScrollView *)mainCycleScrollView
//{
//    if (_mainCycleScrollView == nil) {
//        NSArray *arr = @[[UIImage imageNamed:@"1.jpg"],[UIImage imageNamed:@"2.jpg"],[UIImage imageNamed:@"3.jpg"],[UIImage imageNamed:@"4.jpg"],[UIImage imageNamed:@"5.jpg"]];
//        _mainCycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, self.bounds.size.width, 200) imagesGroup:arr];
//        [self addSubview:_mainCycleScrollView];
//    }
//    return _mainCycleScrollView;
//}
@end
