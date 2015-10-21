//
//  RegisterView.m
//  GourmetShare
//
//  Created by jang on 15/10/20.
//  Copyright © 2015年 jang. All rights reserved.
//

#import "RegisterView.h"

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
    self.userNameText = [[UITextField alloc]initWithFrame:CGRectMake(kScreenWidth/6, kScreenHeight/6, kScreenWidth/3*2, kScreenHeight/15)];
    self.userNameText.backgroundColor = [UIColor redColor];
    self.userNameText.placeholder = @"用  户  名";
    self.userNameText.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_userNameText];
    
    self.passWordText = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.userNameText.frame), CGRectGetMaxY(self.userNameText.frame)+30, CGRectGetWidth(self.userNameText.frame), CGRectGetHeight(self.userNameText.frame))];
    self.passWordText.backgroundColor = [UIColor redColor];
    self.passWordText.placeholder = @"密     码";
    self.passWordText.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_passWordText];
    
    self.confirmText = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.passWordText.frame), CGRectGetMaxY(self.passWordText.frame)+30, CGRectGetWidth(self.passWordText.frame), CGRectGetHeight(self.passWordText.frame))];
    self.confirmText.backgroundColor = [UIColor redColor];
    self.confirmText.placeholder = @"确认密码";
    self.confirmText.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_confirmText];
    
    self.emailText = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.confirmText.frame), CGRectGetMaxY(self.confirmText.frame)+30, CGRectGetWidth(self.confirmText.frame), CGRectGetHeight(self.confirmText.frame))];
    self.emailText.backgroundColor = [UIColor redColor];
    self.emailText.placeholder = @"邮     箱";
    self.emailText.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_emailText];
    
    self.phoneNumberText = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.emailText.frame), CGRectGetMaxY(self.emailText.frame)+30, CGRectGetWidth(self.emailText.frame), CGRectGetHeight(self.emailText.frame))];
    self.phoneNumberText.backgroundColor = [UIColor redColor];
    self.phoneNumberText.placeholder = @"手机号码";
    self.phoneNumberText.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_phoneNumberText];
    
    
    self.registButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.registButton.frame = CGRectMake(CGRectGetMinX(self.phoneNumberText.frame)+50, CGRectGetMaxY(self.phoneNumberText.frame) + 40, CGRectGetWidth(self.phoneNumberText.frame) -100, CGRectGetHeight(self.phoneNumberText.frame));
    [_registButton setImage:[[UIImage imageNamed:@"register_button"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    self.registButton.backgroundColor = [UIColor blueColor];
    [self addSubview:_registButton];
}
@end
