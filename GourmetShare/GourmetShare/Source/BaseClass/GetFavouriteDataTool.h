//
//  GetFavouriteDataTool.h
//  GourmetShare
//
//  Created by jang on 15/10/22.
//  Copyright © 2015年 jang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVOSCloud/AVOSCloud.h>
typedef void(^PassValue)(NSArray *array);
@interface GetFavouriteDataTool : NSObject

@property (nonatomic,strong)AVObject *postFavourite;

//单例初始化工具类
+(GetFavouriteDataTool *)shareFavouriteData;

-(BOOL)podFavouriteWith:(StuffModle *)stuff UserName:(NSString *)userName;

-(void)getFavouriteWithUserName:(NSString *)userName PassValue:(PassValue)passVallue;

@end
