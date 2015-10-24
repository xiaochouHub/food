//
//  ShareDetailView.h
//  GourmetShare
//
//  Created by lanou3g on 15/10/23.
//  Copyright © 2015年 jang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShareDetailView : UIView

@property (nonatomic,strong)UIScrollView *backScroll;

@property (nonatomic,strong)UIImageView *shareImage; // 分享的图片

@property (nonatomic,strong)UIButton *myButton;

@property (nonatomic,strong)UILabel *nameLabel;

@property (nonatomic,strong)UITextField *nameText; // 菜名

@property (nonatomic,strong)UILabel *materLabel;

@property (nonatomic,strong)UITextField *materialText; // 材料和配料

@property (nonatomic,strong)UILabel *stepLabel;

@property (nonatomic,strong)UITextField *stepText; // 制作步骤

@end
