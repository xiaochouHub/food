//
//  NewsDetailTableViewCell.m
//  GourmetShare
//
//  Created by lanou3g on 15/10/19.
//  Copyright © 2015年 jang. All rights reserved.
//

#import "NewsDetailTableViewCell.h"

@implementation NewsDetailTableViewCell
// 内容
-(UILabel *)newsLabel
{
    if (_newsLabel == nil) {
        _newsLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, CGRectGetWidth([[UIScreen mainScreen]bounds]) - 40, 50)];
        _newsLabel.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:_newsLabel];
    }
    return _newsLabel;
}
@end
