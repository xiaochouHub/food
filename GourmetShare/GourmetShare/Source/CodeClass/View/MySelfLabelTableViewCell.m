//
//  MySelfLabelTableViewCell.m
//  GourmetShare
//
//  Created by lanou3g on 15/10/23.
//  Copyright © 2015年 jang. All rights reserved.
//

#import "MySelfLabelTableViewCell.h"

@implementation MySelfLabelTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self p_setup];
    }
    return self;
}

-(void)p_setup
{
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 15, CGRectGetWidth([[UIScreen mainScreen]bounds]) / 3 - 20, 30)];
//    self.titleLabel.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:_titleLabel];
    
    self.textLabeltext = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.titleLabel.frame), CGRectGetMinY(self.titleLabel.frame), CGRectGetWidth([[UIScreen mainScreen]bounds]) / 3 * 2 - 20, CGRectGetHeight(self.titleLabel.frame))];
//    self.textLabeltext.backgroundColor = [UIColor blueColor];
    [self.contentView addSubview:_textLabeltext];
}


@end
