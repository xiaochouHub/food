//
//  LoginViewController.m
//  GourmetShare
//
//  Created by jang on 15/10/20.
//  Copyright © 2015年 jang. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginView.h"
#import "RegisterViewController.h"
#import "MainPageViewController.h"
#import "LTView.h"
@interface LoginViewController ()
@property (nonatomic,strong) UIImageView *backImage;
@property (nonatomic,strong)LoginView *lv;
@end

@implementation LoginViewController

-(void)loadView
{
    self.lv = [[LoginView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.view = _lv;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.backImage = [[UIImageView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.backImage.image = [UIImage imageNamed:@"whiteback.jpg"];
    _lv.backgroundColor = [UIColor colorWithPatternImage:self.backImage.image];
    
    
    [_lv.registButton addTarget:self action:@selector(registButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_lv.loginButton addTarget:self action:@selector(loginButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    //设置输入框的代理
    [_lv.userNameLT setTextFieldDelegate:self];
    [_lv.passWordLT setTextFieldDelegate:self];
}

-(void)registButtonAction:(UIButton *)sender
{
    RegisterViewController *rv = [[RegisterViewController alloc]init];
    
    [self.navigationController pushViewController:rv animated:YES];
}

-(void)loginButtonAction:(UIButton *)sender
{
    //登录时，用户名和密码不能为空
    if ([[_lv.userNameLT inputFieldText] isEqualToString:@""] || [[_lv.passWordLT inputFieldText]  isEqualToString:@""]) {
        
        [self p_showAlertView:@"提示" message:@"用户名和密码不能为空"];
        return;
    }
    
    NSString *passWord = [[RegisterDataTool shareRegisterData]
                          getLoginWithName:[_lv.userNameLT inputFieldText]];
    if ([[_lv.passWordLT inputFieldText] isEqualToString:passWord]) {
        MainPageViewController *mvc = [[MainPageViewController alloc]init];
        [self.navigationController pushViewController:mvc animated:YES];
    }
    else
    {
        [self p_showAlertView:@"提示" message:@"登录名或密码错误"];
    }
}

//显示提示框
- (void)p_showAlertView:(NSString *)title message:(NSString *)message
{
    UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alertView show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//键盘回收
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

@end
