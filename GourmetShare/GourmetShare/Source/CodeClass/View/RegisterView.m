//
//  RegisterView.m
//  GourmetShare
//
//  Created by jang on 15/10/20.
//  Copyright © 2015年 jang. All rights reserved.
//

#import "RegisterView.h"
#import "LTView.h"
@implementation RegisterView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self p_setupView];
    }
    return self;
}

-(void)p_setupView
{
    self.backgroundColor = [UIColor whiteColor];
    self.userNameText = [[LTView alloc]initWithFrame:CGRectMake(kScreenWidth/6, kScreenHeight/6, kScreenWidth/3*2, kScreenHeight/15) placeholder:@"用  户  名" imageName:@""];
    [self addSubview:_userNameText];
    
    self.passWordText = [[LTView alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.userNameText.frame), CGRectGetMaxY(self.userNameText.frame)+30, CGRectGetWidth(self.userNameText.frame), CGRectGetHeight(self.userNameText.frame))  placeholder:@"密     码" imageName:@""];
    [_passWordText setSecureTextEnabled:YES];
    [self addSubview:_passWordText];
    
    self.confirmText = [[LTView alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.passWordText.frame), CGRectGetMaxY(self.passWordText.frame)+30, CGRectGetWidth(self.passWordText.frame), CGRectGetHeight(self.passWordText.frame)) placeholder:@"确认密码" imageName:@""];
    [_confirmText setSecureTextEnabled:YES];
    [self addSubview:_confirmText];
    
    self.emailText = [[LTView alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.confirmText.frame), CGRectGetMaxY(self.confirmText.frame)+30, CGRectGetWidth(self.confirmText.frame), CGRectGetHeight(self.confirmText.frame)) placeholder:@"邮     箱" imageName:@""];
    [self addSubview:_emailText];
    
    self.phoneNumberText = [[LTView alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.emailText.frame), CGRectGetMaxY(self.emailText.frame)+30, CGRectGetWidth(self.emailText.frame), CGRectGetHeight(self.emailText.frame)) placeholder:@"手机号码" imageName:@""];
    [self addSubview:_phoneNumberText];
    
    
    self.registButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.registButton.frame = CGRectMake(CGRectGetMinX(self.phoneNumberText.frame)+60, CGRectGetMaxY(self.phoneNumberText.frame) + 40, CGRectGetWidth(self.bounds) - CGRectGetMinX(_phoneNumberText.frame) *2-120, CGRectGetHeight(self.phoneNumberText.frame));
    [self.registButton setTitle:@"登 录" forState:UIControlStateNormal];
    _registButton.titleLabel.font = [UIFont systemFontOfSize: 17.0];
    [_registButton.layer setMasksToBounds:YES];
    [_registButton.layer setCornerRadius:10.0]; //设置矩形四个圆角半径
    [_registButton.layer setBorderWidth:1.0]; //边框宽度
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 1, 0, 0, 1 });
    
    [_registButton.layer setBorderColor:colorref];//边框颜色
    
    [self addSubview:_registButton];
}
@end
