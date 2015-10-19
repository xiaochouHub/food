//
//  DetailMenuTableViewCell.m
//  GourmetShare
//
//  Created by jang on 15/10/15.
//  Copyright © 2015年 jang. All rights reserved.
//

#import "DetailMenuTableViewCell.h"

@implementation DetailMenuTableViewCell

-(UILabel *)menuLabel
{
    
    if (_menuLabel == nil) {
        _menuLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, self.contentView.size.width, self.contentView.size.height)];
        [self.contentView addSubview:_menuLabel];
    }
    return _menuLabel;
}

@end
