//
//  GetShareDataTool.h
//  GourmetShare
//
//  Created by jang on 15/10/22.
//  Copyright © 2015年 jang. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^PassValue)(NSArray *array);
@interface GetShareDataTool : NSObject

@property (nonatomic,strong)AVObject *postShareite;
@property (nonatomic,strong)NSMutableArray *mutabArray;

//单例初始化工具类
+(GetShareDataTool *)shareShareData;

//用户分享食谱
-(void)podShareWith:(StuffModle *)stuff UserName:(NSString *)userName;

//获取用户分享列表
-(void)getShareWithPassValue:(PassValue)passVallue;

//获取我的用户分享
-(void)getShareWithUserName:(NSString *)userName PassValue:(PassValue)passVallue;
@end