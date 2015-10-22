//
//  DataBaseHandler.h
//  GourmetShare
//
//  Created by jang on 15/10/16.
//  Copyright © 2015年 jang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataBaseHandler : NSObject


@property (nonatomic,strong)FMDatabase *db;


//新建一个单例类
+(DataBaseHandler *)shareGetFoodData;

//创建一个表

- (void)createTable;
- (void)createPostListTable;
- (void)createPostStuffTable;

//添加数据（插入）
- (void)insertFoodCategoryWith:(NSArray *)foodArr;
- (void)insertPostListWith:(NSArray *)listArr;
- (void)insertPostStuffWithStuffArr:(NSArray *)stuff lib:(NSString *)lib;
- (void)insertPostStuffWithStuffModle:(StuffModle *)stuffModle lib:(NSString *)lib;

////删除
//- (void)deleteStudentByNumber:(NSInteger)number;

////修改
//- (void)changeStudentByNumber:(NSInteger)number name:(NSString *)name;

//查询
- (NSArray *)getAllCategory;//显示全部
- (NSArray *)findListByName:(NSString *)name;
- (NSArray *)findListByParentId:(NSString *)parentId;
- (NSArray *)findStuffByLid:(NSString *)lid;
- (StuffModle *)findStuffBySid:(NSString *)sid;

//- (NSArray *)findStudentByNumber:(NSInteger)number;//条件查询

#pragma mark ========================User
//下载菜谱表
- (void)createUserTable;

//下载到本地的菜谱
- (void)insertDownloadWithStuffModle:(StuffModle *)s;

//查询
- (NSArray *)findStuff;

//返回图片文件路径
- (NSString *)imageFilePath:(NSString *)aURL;

@end
