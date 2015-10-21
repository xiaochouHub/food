//
//  RegisterDataTool.m
//  GourmetShare
//
//  Created by jang on 15/10/20.
//  Copyright © 2015年 jang. All rights reserved.
//

#import "RegisterDataTool.h"
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
    AVQuery *queryNum = [AVQuery queryWithClassName:@"postRegister"];
    [queryNum whereKey:@"phoneNumberText" equalTo:regist.phoneNumberText];

    if ([[queryNum findObjects] count] != 0) {
        return 1;//手机号存在
    }
    return 2;
}

-(NSString *)getLoginWithName:(NSString *)name
{
    self.LoginName = [NSString string];
    AVQuery *queryName = [AVQuery queryWithClassName:@"postRegister"];
    [queryName whereKey:@"userNameText" equalTo:name];
    if ([[queryName findObjects] count] == 0) {
        
    }
    else
    {
        NSArray *passWord = [[queryName findObjects] valueForKey:@"passWordText"];
        _LoginName = name;
        return passWord[0];
    }
    AVQuery *queryNum = [AVQuery queryWithClassName:@"postRegister"];
    [queryNum whereKey:@"phoneNumberText" equalTo:name];
    if ([[queryNum findObjects] count] == 0) {
        return KisEqual;
    }
    else{
        NSArray *passWord = [[queryName findObjects] valueForKey:@"passWordText"];
        _LoginName = name;
        return passWord[0];
    }
}

@end
