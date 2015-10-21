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
//    self.backImage = [[UIImageView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
//    self.backImage.image = [UIImage imageNamed:@"back.jpg"];
//    _lv.backgroundColor = [UIColor colorWithPatternImage:self.backImage.image];
    // Do any additional setup after loading the view.
    
    [_lv.registButton addTarget:self action:@selector(registButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_lv.loginButton addTarget:self action:@selector(loginButtonAction:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)registButtonAction:(UIButton *)sender
{
    RegisterViewController *rv = [[RegisterViewController alloc]init];
    
    [self.navigationController pushViewController:rv animated:YES];
}

-(void)loginButtonAction:(UIButton *)sender
{
    NSString *passWord = [[RegisterDataTool shareRegisterData]getLoginWithName:_lv.userNameText.text];
    if ([_lv.passWordText.text isEqualToString:passWord]) {
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
