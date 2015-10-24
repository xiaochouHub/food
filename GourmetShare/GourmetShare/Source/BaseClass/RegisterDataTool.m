//
//  RegisterDataTool.m
//  GourmetShare
//
//  Created by jang on 15/10/20.
//  Copyright © 2015年 jang. All rights reserved.
//

#import "RegisterDataTool.h"
#import "UserInfoModle.h"
static RegisterDataTool *rd;
//static NSString *LoginName = nil;
@implementation RegisterDataTool

+(RegisterDataTool *)shareRegisterData
{

    static dispatch_once_t once_token;
    if (rd == nil) {
        dispatch_once(&once_token, ^{
            rd = [[RegisterDataTool alloc]init];
        });
    }
    return rd;
}

-(void)podRegisterWith:(RegisterModer *)regist
{
    self.postRegister = [AVObject objectWithClassName:@"postRegister"];
    [_postRegister setObject:regist.userNameText forKey:@"userNameText"];
    [_postRegister setObject:regist.passWordText forKey:@"passWordText"];
    [_postRegister setObject:regist.emailText forKey:@"emailText"];
    [_postRegister setObject:regist.phoneNumberText forKey:@"phoneNumberText"];
    [_postRegister save];
}


-(NSInteger)getRegisterWith:(RegisterModer *)regist
{
    AVQuery *queryName = [AVQuery queryWithClassName:@"postRegister"];
    [queryName whereKey:@"userNameText" equalTo:regist.userNameText];

    if ([[queryName findObjects] count] != 0) {
        return 0;//用户名存在
    }
    return 2;
}

//用户使用用户名或邮箱登录
-(NSString *)getLoginWithName:(NSString *)name
{
    self.LoginName = [NSString string];
    AVQuery *queryName = [AVQuery queryWithClassName:@"postRegister"];
    //用户名登录
    [queryName whereKey:@"userNameText" equalTo:name];
    if ([[queryName findObjects] count] == 0) {
        
    }
    else
    {
        NSArray *passWord = [[queryName findObjects] valueForKey:@"passWordText"];
        _LoginName = name;
        return passWord[0];
    }
    //邮箱登录
    AVQuery *queryNum = [AVQuery queryWithClassName:@"postRegister"];
    [queryNum whereKey:@"emailText" equalTo:name];
    if ([[queryNum findObjects] count] == 0) {
        return KisEqual;
    }
    else{
        NSArray *passWord = [[queryName findObjects] valueForKey:@"passWordText"];
        _LoginName = name;
        return passWord[0];
    }
}
//用户注册
-(NSInteger)podRegisterWithEmail:(RegisterModer *)regist
{
    AVQuery *query = [AVUser query];
    [query whereKey:@"nickname" equalTo:regist.userNameText];
    if ([query findObjects].count != 0) {
       return 0;//用户名存在
    }
    
    self.user = [AVUser user];
    _user.username = regist.emailText;
    _user.password = regist.passWordText;
    _user.email = regist.emailText;
    [_user setObject:regist.userNameText forKey:@"nickname"];//昵称
    [_user setObject:nil forKey:@"headImage"];//头像
    [_user setObject:nil forKey:@"gender"];//性别
    [_user setObject:nil forKey:@"hobby"];//爱好
    [_user setObject:nil forKey:@"likeFood"];//喜欢的菜
    [_user setObject:nil forKey:@"skill"];//会做的菜
    NSError *error = [[NSError alloc]init];
    if ([_user signUp:&error]) {
        return 2;//注册成功
    }
    
    return 1;//邮箱存在
}

//用户登录
-(BOOL)LoginWithUserName:(NSString *)userName Password:(NSString *)password
{
    self.LoginName = [NSString string];
    NSError *error = [[NSError alloc]init];
    self.userInfo= [[UserInfoModle alloc]init];
    //邮箱登陆
    if ([AVUser logInWithUsername:userName password:password error:&error]) {
        _LoginName = userName;
        AVQuery *queryemail = [AVUser query];
        [queryemail whereKey:@"email" equalTo:userName];
        NSLog(@"%ld",[queryemail findObjects].count);
        if ([queryemail findObjects].count > 0) {
            
            AVObject *q = [queryemail findObjects][0];

            _userInfo.headImage = [q valueForKey:@"headImage"];
            _userInfo.nickname = [q valueForKey:@"nickname"];
            _userInfo.email = [q valueForKey:@"email"];
            _userInfo.gender = [q valueForKey:@"gender"];
            _userInfo.hobby = [q valueForKey:@"hobby"];
            _userInfo.likeFood = [q valueForKey:@"likeFood"];
            _userInfo.skill = [q valueForKey:@"skill"];
        }

        return YES;
    }
    AVQuery *query = [AVUser query];
    [query whereKey:@"nickname" equalTo:userName];
    //用户名登陆
    if ([query findObjects].count >0) {
        AVQuery *q = [query findObjects][0];
        NSString *email = [q valueForKey:@"email"];
        if ([AVUser logInWithUsername:email password:password error:&error]) {
            
            _LoginName = email;
            
            _userInfo.headImage = [q valueForKey:@"headImage"];
            _userInfo.nickname = [q valueForKey:@"nickname"];
            _userInfo.email = [q valueForKey:@"email"];
            _userInfo.gender = [q valueForKey:@"gender"];
            _userInfo.hobby = [q valueForKey:@"hobby"];
            _userInfo.likeFood = [q valueForKey:@"likeFood"];
            _userInfo.skill = [q valueForKey:@"skill"];
            
            return YES;
        }
    }
    
    return NO;
}

//修改密码
-(BOOL)ChangePasswordWithNewPassword:(NSString *)newPassword
{
    AVQuery *queryName = [AVQuery queryWithClassName:@"postRegister"];
    
    [queryName whereKey:@"userNameText" equalTo:_LoginName];
    
    NSError *error = [[NSError alloc]init];
    
    return [AVUser requestPasswordResetForEmail:[[queryName findObjects] valueForKey:@"emailText"] error:&error];
}

//忘记密码
-(BOOL)ForgetPasswordWithEmail:(NSString *)aEmail
{
    NSError *error = [[NSError alloc]init];
    
    return [AVUser requestPasswordResetForEmail:aEmail error:&error];
}

//修改资料
-(BOOL)ChangeUserInfoWith:(UserInfoModle *)userInfo
{
    AVQuery *query = [AVUser query];
    [query whereKey:@"username" equalTo:_LoginName];
    
    NSLog(@"%ld",[query findObjects].count);
    
    NSString *objectId = [[query findObjects][0] valueForKey:@"objectId"];
    
    AVObject *post = [AVObject objectWithoutDataWithClassName:@"_User" objectId:objectId];
    [post setObject:userInfo.nickname forKey:@"nickname"];
    [post setObject:userInfo.email forKey:@"email"];
    [post setObject:userInfo.gender forKey:@"gender"];
    [post setObject:userInfo.hobby forKey:@"hobby"];
    [post setObject:userInfo.likeFood forKey:@"likeFood"];
    [post setObject:userInfo.skill forKey:@"skill"];
    NSError *error = [[NSError alloc]init];
    if ([post save:&error]) {
        _userInfo = userInfo;
        return YES;
    }else
    {
        return NO;
    }
    
}

@end
