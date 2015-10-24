//
//  GetShareDataTool.m
//  GourmetShare
//
//  Created by jang on 15/10/22.
//  Copyright © 2015年 jang. All rights reserved.
//

#import "GetShareDataTool.h"
static GetShareDataTool *gs;
@implementation GetShareDataTool
//单例初始化工具类
+(GetShareDataTool *)shareShareData
{
    static dispatch_once_t once_token;
    if (gs == nil) {
        dispatch_once(&once_token, ^{
            gs = [[GetShareDataTool alloc]init];
        });
    }
    return gs;
}

//用户分享食谱
-(BOOL)podShareWith:(StuffModle *)stuff UserName:(NSString *)userName Image:(UIImage *)image
{
    self.postShareite = [AVObject objectWithClassName:@"postShare"];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    NSDate *date = [NSDate  dateWithTimeIntervalSinceNow:3600*2];
    [formatter setDateFormat:@"yyyy-MM-dd-HH-mm-ss"];
    NSString * strdate = [formatter stringFromDate:date];
    NSString *sid = [NSString stringWithFormat:@"%@-%@",userName,strdate];
    NSString *fileName = [NSString stringWithFormat:@"%@-%@.JPEG",userName,strdate];
    NSData *imageData = UIImageJPEGRepresentation(image, 0.05);
    AVFile *file = [AVFile fileWithName:fileName data:imageData];
    [file save];
    [_postShareite setObject:sid forKey:@"sid"];
    [_postShareite setObject:userName forKey:@"userName"];
    [_postShareite setObject:file forKey:@"albums"];
    
    
    [_postShareite setObject:stuff.burden forKey:@"burden"];
    [_postShareite setObject:stuff.imtro forKey:@"imtro"];
    [_postShareite setObject:stuff.ingredients forKey:@"ingredients"];
    [_postShareite setObject:stuff.tags forKey:@"tags"];
    [_postShareite setObject:stuff.title forKey:@"title"];
    
    NSError *error = [[NSError alloc]init];
    return [_postShareite save:&error];
}

//获取用户分享列表
-(void)getShareWithPassValue:(PassValue)passVallue
{
    NSMutableArray *tempArr = [NSMutableArray array];
    AVQuery *query = [AVQuery queryWithClassName:@"postShare"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // 检索成功
            NSLog(@"%ld",objects.count);
            for (AVQuery *q in objects) {
                StuffModle *s = [[StuffModle alloc]init];
                s.albums = [q valueForKey:@"albums"];
                s.burden = [q valueForKey:@"burden"];
                s.sid = [q valueForKey:@"sid"];
                s.imtro = [q valueForKey:@"imtro"];
                s.ingredients = [q valueForKey:@"ingredients"];
                s.tags = [q valueForKey:@"tags"];
                s.title = [q valueForKey:@"title"];
                self.mutabArray = [NSMutableArray array];
                [_mutabArray addObject:s];
                [_mutabArray addObject:[q valueForKey:@"userName"]];
                [tempArr addObject:_mutabArray];
            }
            passVallue(tempArr);
        } else {
            // 输出错误信息
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}


//获取我的用户分享
-(void)getShareWithUserName:(NSString *)userName PassValue:(PassValue)passVallue
{
    NSMutableArray *tempArr = [NSMutableArray array];
    AVQuery *query = [AVQuery queryWithClassName:@"postShare"];
    [query whereKey:@"userName" equalTo:userName];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // 检索成功
            NSLog(@"%ld",objects.count);
            for (AVQuery *q in objects) {
                StuffModle *s = [[StuffModle alloc]init];
                s.albums = [q valueForKey:@"albums"];
                s.burden = [q valueForKey:@"burden"];
                s.sid = [q valueForKey:@"sid"];
                s.imtro = [q valueForKey:@"imtro"];
                s.ingredients = [q valueForKey:@"ingredients"];
                NSMutableArray *stArr = [NSMutableArray array];
                for (StepModle *st in [q valueForKey:@"steps"]) {
                    [stArr addObject:st];
                }
                s.steps = stArr;
                s.tags = [q valueForKey:@"tags"];
                s.title = [q valueForKey:@"title"];
                [tempArr addObject:s];
            }
            passVallue(tempArr);
        } else {
            // 输出错误信息
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}
@end
