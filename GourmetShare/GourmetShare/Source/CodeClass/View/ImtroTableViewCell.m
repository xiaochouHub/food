//
//  ImtroTableViewCell.m
//  GourmetShare
//
//  Created by lanou3g on 15/10/16.
//  Copyright © 2015年 jang. All rights reserved.
//

#import "ImtroTableViewCell.h"

@implementation ImtroTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self p_setup];
    }
    return self;
}

-(void)p_setup
{
    
    self.imtroLabel.backgroundColor = [UIColor blueColor];
    
    self.imtroLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, CGRectGetWidth([[UIScreen mainScreen]bounds]) - 20, 200)];
    self.imtroLabel.text = @"菜谱来自电视节目：中华美食频道的《千味坊》 JIMMY老师教的菜，都是一些简单又美味的家常菜，这几天每天中午12点都会收看他的节目。 JIMMY老师教大家怎么看鱼是否新鲜,如果蒸出来后鱼的眼珠是鼓出来的就是新鲜 的.相反眼珠藏在里面就代表不新鲜了";
    self.imtroLabel.numberOfLines = 0;
    [self.contentView addSubview:_imtroLabel];
    }

@end
