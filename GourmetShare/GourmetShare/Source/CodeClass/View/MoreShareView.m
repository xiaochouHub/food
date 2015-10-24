//
//  MoreShareView.m
//  GourmetShare
//
//  Created by lanou3g on 15/10/24.
//  Copyright © 2015年 jang. All rights reserved.
//

#import "MoreShareView.h"

@implementation MoreShareView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self p_setup];
    }
    return self;
}

-(void)p_setup
{
    self.backgroundColor = [UIColor orangeColor];
    
    self.back = [[UIScrollView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    [self addSubview:_back];
    
    self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX([[UIScreen mainScreen]bounds]) / 2 - 50, 20, 100, 30)];
    self.nameLabel.backgroundColor = [UIColor lightGrayColor];
    self.nameLabel.text = @"菜名";
    self.nameLabel.textAlignment = NSTextAlignmentCenter;
    [self.back addSubview:_nameLabel];
    
    self.myImage = [[UIImageView alloc]initWithFrame:CGRectMake(10 , CGRectGetMaxY(self.nameLabel.frame) + 10, CGRectGetWidth([[UIScreen mainScreen]bounds]) - 20, 200)];
    self.myImage.backgroundColor = [UIColor lightGrayColor];
    [self.back addSubview:_myImage];
    
    self.mater = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.nameLabel.frame), CGRectGetMaxY(self.myImage.frame) + 10, CGRectGetWidth(self.nameLabel.frame), CGRectGetHeight(self.nameLabel.frame))];
    self.mater.text = @"食材和配料";
    self.mater.backgroundColor = [UIColor lightGrayColor];
    self.mater.textAlignment = NSTextAlignmentCenter;
    [self.back addSubview:_mater];
    
    self.materLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.myImage.frame), CGRectGetMaxY(self.mater.frame) + 10, CGRectGetWidth(self.myImage.frame), 100)];
    self.materLabel.backgroundColor = [UIColor lightGrayColor];
    [self.back addSubview:_materLabel];
    
    self.step = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.mater.frame), CGRectGetMaxY(self.materLabel.frame) + 10, CGRectGetWidth(self.mater.frame), CGRectGetHeight(self.mater.frame))];
    self.step.text = @"制作步骤";
    self.step.textAlignment = NSTextAlignmentCenter;
    self.step.backgroundColor = [UIColor lightGrayColor];
    [self.back addSubview:_step];
    
    self.stepLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.materLabel.frame), CGRectGetMaxY(self.step.frame) + 10,CGRectGetWidth(self.materLabel.frame) , 300)];
    self.stepLabel.backgroundColor = [UIColor lightGrayColor];
    [self.back addSubview:_stepLabel];
}
@end
