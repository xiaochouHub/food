//
//  StepTableViewCell.m
//  GourmetShare
//
//  Created by lanou3g on 15/10/16.
//  Copyright © 2015年 jang. All rights reserved.
//

#import "StepTableViewCell.h"

@implementation StepTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self p_setup];
    }
    return self;
}

-(void)p_setup
{
    
    self.stepImage = [[UIImageView alloc]initWithFrame:CGRectMake(5, 50, CGRectGetWidth([[UIScreen mainScreen]bounds]) / 2 - 5, 110)];
    self.stepImage.image = [UIImage imageNamed:@"ceshi.jpg"];
    [self.contentView addSubview:_stepImage];
    
    self.stepLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.stepImage.frame), CGRectGetMinY(self.stepImage.frame), CGRectGetWidth([[UIScreen mainScreen]bounds]) / 2 - 5, CGRectGetHeight(self.stepImage.frame))];
    self.stepLabel.text = @"2.柠檬2-3个，生姜一小块，大蒜头，香菜，辣辣的红椒六个";
    self.stepLabel.numberOfLines = 0;
    [self.contentView addSubview:_stepLabel];
}

@end
