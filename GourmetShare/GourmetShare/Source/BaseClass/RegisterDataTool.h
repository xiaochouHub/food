//
//  RegisterDataTool.h
//  GourmetShare
//
//  Created by jang on 15/10/20.
//  Copyright © 2015年 jang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVOSCloud/AVOSCloud.h>

@interface RegisterDataTool : NSObject


@property (nonatomic,strong)AVObject *postRegister;
@property (nonatomic,strong)NSString *LoginName;
@property (nonatomic,strong)AVUser *user;

//单例初始化工具类
+(RegisterDataTool *)shareRegisterData;

-(void)podRegisterWith:(RegisterModer *)regist;

-(NSInteger)getRegisterWith:(RegisterModer *)regist;

-(NSString *)getLoginWithName:(NSString *)name;

//用户注册
-(NSInteger)podRegisterWithEmail:(RegisterModer *)regist;

//用户登录
-(BOOL)LoginWithUserName:(NSString *)userName Password:(NSString *)password;

//修改密码
-(BOOL)ChangePasswordWithNewPassword:(NSString *)newPassword;

//忘记密码
-(BOOL)ForgetPasswordWithEmail:(NSString *)aEmail;

@end
