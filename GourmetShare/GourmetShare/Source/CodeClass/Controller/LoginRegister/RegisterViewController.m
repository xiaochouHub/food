//
//  RegisterViewController.m
//  GourmetShare
//
//  Created by jang on 15/10/20.
//  Copyright © 2015年 jang. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterView.h"
@interface RegisterViewController ()
@property (nonatomic,strong)RegisterView *rv;
@end

@implementation RegisterViewController

-(void)loadView
{
    self.rv = [[RegisterView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.view = _rv;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [_rv.registButton addTarget:self action:@selector(registButtonAction:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)registButtonAction:(UIButton *)sender
{
    
    RegisterModer *registUser = [[RegisterModer alloc]init];
    registUser.userNameText = _rv.userNameText.text;
    registUser.passWordText = _rv.passWordText.text;
    registUser.confirmText = _rv.confirmText.text;
    registUser.emailText = _rv.emailText.text;
    registUser.phoneNumberText = _rv.phoneNumberText.text;
    
    //注册时，用户名和密码不能为空
    if ([registUser.userNameText isEqualToString:@""] || [registUser.passWordText  isEqualToString:@""]) {
        
        [self p_showAlertView:@"提示" message:@"用户名和密码不能为空"];
        return;
    }
    
    //注册时，两次输入的密码必须一致
    if (NO == [registUser.passWordText isEqualToString:registUser.confirmText]) {
        
        [self p_showAlertView:@"提示" message:@"两次输入的密码不一致"];
        return;
    }
    NSInteger isRegister = [[RegisterDataTool shareRegisterData]getRegisterWith:registUser];
    if (isRegister == 2) {
        [[RegisterDataTool shareRegisterData]podRegisterWith:registUser];
        if ([[RegisterDataTool shareRegisterData]getRegisterWith:registUser] == 0) {
            [self p_showAlertView:@"提示" message:@"注册成功"];
        }else{
            [self p_showAlertView:@"提示" message:@"注册失败"];
            return;
        }
    }
    if (isRegister == 0) {
        [self p_showAlertView:@"提示" message:@"用户名已存在"];
        return;
    }
    if (isRegister == 1) {
        [self p_showAlertView:@"提示" message:@"手机号存在"];
        return;
    }
    

    
    //注册完成后，返回登陆页面
    [self.navigationController popViewControllerAnimated:YES];
    
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
