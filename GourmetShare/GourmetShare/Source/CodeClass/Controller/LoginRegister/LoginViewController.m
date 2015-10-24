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
@interface LoginViewController ()<UIAlertViewDelegate> 
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
    [_lv.changeButton addTarget:self action:@selector(changeButton:) forControlEvents:UIControlEventTouchUpInside];
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
    NSString *name = [_lv.userNameLT inputFieldText];
    NSString *password = [_lv.passWordLT inputFieldText];
    //登录时，用户名和密码不能为空
    if ([name isEqualToString:@""] || [password isEqualToString:@""]) {
        
        [self p_showAlertView:@"提示" message:@"用户名和密码不能为空"];
        return;
    }
    /*
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
     */
    if ([[RegisterDataTool shareRegisterData]LoginWithUserName:name Password:password]) {
        MainPageViewController *mvc = [[MainPageViewController alloc]init];
        [self.navigationController pushViewController:mvc animated:YES];
    }
    else
    {
        [self p_showAlertView:@"提示" message:@"登录名或密码错误"];
    }
    
}
-(void)changeButton:(UIButton *)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@" " delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"修改",nil];
    UITextField * txt = [[UITextField alloc] init];
    txt.backgroundColor = [UIColor whiteColor];
    txt.frame = CGRectMake(alert.center.x+65,alert.center.y+48, 150,23);
    [alert addSubview:txt];
    [alert show];
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
