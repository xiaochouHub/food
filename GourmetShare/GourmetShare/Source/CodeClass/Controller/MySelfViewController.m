//
//  MySelfViewController.m
//  GourmetShare
//
//  Created by jang on 15/10/24.
//  Copyright © 2015年 jang. All rights reserved.
//

#import "MySelfViewController.h"
#import "MySelfView.h"
#import "LTView.h"
#import "UserInfoModle.h"
@interface MySelfViewController ()<UITextFieldDelegate>
@property (nonatomic,strong)MySelfView *mv;
@property (nonatomic,strong)UserInfoModle *userInfo;
@end

@implementation MySelfViewController

-(void)loadView
{
    self.mv = [[MySelfView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.view = _mv;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"whiteback.jpg"]];
    
    UIBarButtonItem *changInfo = [[UIBarButtonItem alloc]initWithTitle:@"修改资料" style:UIBarButtonItemStylePlain target:self action:@selector(changInfo:)];
    self.navigationItem.rightBarButtonItem = changInfo;
    if ([RegisterDataTool shareRegisterData].LoginName != nil) {
        self.userInfo = [[UserInfoModle alloc]init];
        _userInfo = [RegisterDataTool shareRegisterData].userInfo;
        [self p_setupView];
    }


}
-(void)p_setupView
{
    [_mv.nicknameFiled outputFileText:_userInfo.nickname];
    [_mv.emailFiled outputFileText:_userInfo.email];
    [_mv.genderFiled outputFileText:_userInfo.gender];
    [_mv.hobbyFiled outputFileText:_userInfo.hobby];
    [_mv.likeFoodFiled outputFileText:_userInfo.likeFood];
    [_mv.skillFiled outputFileText:_userInfo.skill];
}

//显示提示框
- (void)p_showAlertView:(NSString *)title message:(NSString *)message
{
    UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alertView show];
}

-(void)changInfo:(UIBarButtonItem *)sender
{
    if ([sender.title isEqualToString:@"修改资料"]) {
        if ([RegisterDataTool shareRegisterData].LoginName != nil) {
            sender.title = @"保存资料";
            _mv.nicknameFiled.inputField.userInteractionEnabled = YES;
            _mv.emailFiled.inputField.userInteractionEnabled = YES;
            _mv.genderFiled.inputField.userInteractionEnabled = YES;
            _mv.hobbyFiled.inputField.userInteractionEnabled = YES;
            _mv.likeFoodFiled.inputField.userInteractionEnabled = YES;
            _mv.skillFiled.inputField.userInteractionEnabled = YES;
        }
        else
        {
            [self p_showAlertView:@"提示" message:@"未登录"];
        }
    }else
    {
        UserInfoModle *tempInfo = [[UserInfoModle alloc]init];
        tempInfo.nickname = [_mv.nicknameFiled inputFieldText];
        tempInfo.email = [_mv.emailFiled inputFieldText];
        tempInfo.gender = [_mv.genderFiled inputFieldText];
        tempInfo.hobby = [_mv.hobbyFiled inputFieldText];
        tempInfo.likeFood = [_mv.likeFoodFiled inputFieldText];
        tempInfo.skill = [_mv.skillFiled inputFieldText];
        
        if ([[RegisterDataTool shareRegisterData]ChangeUserInfoWith:tempInfo]) {
            sender.title = @"修改资料";
            _mv.nicknameFiled.inputField.userInteractionEnabled = NO;
            _mv.emailFiled.inputField.userInteractionEnabled = NO;
            _mv.genderFiled.inputField.userInteractionEnabled = NO;
            _mv.hobbyFiled.inputField.userInteractionEnabled = NO;
            _mv.likeFoodFiled.inputField.userInteractionEnabled = NO;
            _mv.skillFiled.inputField.userInteractionEnabled = NO;
            _userInfo = tempInfo;
        }
    }
    
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
