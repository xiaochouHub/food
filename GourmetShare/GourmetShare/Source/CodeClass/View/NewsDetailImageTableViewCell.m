//
//  NewsDetailImageTableViewCell.m
//  GourmetShare
//
//  Created by lanou3g on 15/10/19.
//  Copyright © 2015年 jang. All rights reserved.
//

#import "NewsDetailImageTableViewCell.h"

@implementation NewsDetailImageTableViewCell

-(UIImageView *)newsImage
{
    if (_newsImage == nil) {
        _newsImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, kScreenWidth-20, 180)];
        //_newsImage.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_newsImage];
//        self.newsImage.contentMode = UIViewContentModeScaleAspectFit
//        ;
    }
    return _newsImage;
}
@end
