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

//单例初始化工具类
+(RegisterDataTool *)shareRegisterData;

-(void)podRegisterWith:(RegisterModer *)regist;

-(NSInteger)getRegisterWith:(RegisterModer *)regist;

-(NSString *)getLoginWithName:(NSString *)name;

@end
