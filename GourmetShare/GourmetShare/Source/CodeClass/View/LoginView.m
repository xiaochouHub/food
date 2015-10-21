//
//  LoginView.m
//  GourmetShare
//
//  Created by jang on 15/10/20.
//  Copyright © 2015年 jang. All rights reserved.
//

#import "LoginView.h"

@implementation LoginView

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
    self.userNameText = [[UITextField alloc]initWithFrame:CGRectMake(kScreenWidth/6, kScreenHeight/4, kScreenWidth/3*2, kScreenHeight/15)];
    self.userNameText.backgroundColor = [UIColor redColor];
    self.userNameText.placeholder = @"用户名";
    self.userNameText.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_userNameText];
    
    self.passWordText = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.userNameText.frame), CGRectGetMaxY(self.userNameText.frame)+30, CGRectGetWidth(self.userNameText.frame), CGRectGetHeight(self.userNameText.frame))];
    self.passWordText.backgroundColor = [UIColor redColor];
    self.passWordText.placeholder = @"密     码";
    self.passWordText.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_passWordText];
    
    self.loginButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.loginButton.frame = CGRectMake(CGRectGetMinX(self.passWordText.frame), CGRectGetMaxY(self.passWordText.frame)+30,  CGRectGetWidth(self.bounds)/2 - CGRectGetMinX(self.passWordText.frame) -20, 40);
    [_loginButton setImage:[[UIImage imageNamed:@"login_button"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    self.loginButton.backgroundColor = [UIColor blueColor];
    [self addSubview:_loginButton];
    
    self.registButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.registButton.frame = CGRectMake(CGRectGetMaxX(self.loginButton.frame)+40, CGRectGetMinY(self.loginButton.frame), CGRectGetWidth(self.loginButton.frame), CGRectGetHeight(self.loginButton.frame));
    [_registButton setImage:[[UIImage imageNamed:@"register_button"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    self.registButton.backgroundColor = [UIColor blueColor];
    [self.registButton setTitle:@"注册" forState:UIControlStateNormal];
    [self addSubview:_registButton];
}

@end
