//
//  NewsDetail.m
//  GourmetShare
//
//  Created by lanou3g on 15/10/19.
//  Copyright © 2015年 jang. All rights reserved.
//

#import "NewsDetail.h"

@implementation NewsDetail

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"body"]) {
        self.body = value;
    }
    else if ([key isEqualToString:@"dkeys"])
    {
        self.dkeys = value;
    }
}

-(void)setBody:(NSString *)body
{
    NSArray *bodyArray = [body componentsSeparatedByString:@"<"];
    NSMutableArray *tempArr = [NSMutableArray array];
    for (NSString *str in bodyArray) {
        if (str.length == 0 || [str isEqualToString:@"p>"] || [str isEqualToString:@"b>"] || [str isEqualToString:@"/p>"] || [str isEqualToString:@"/b>"]) {
            continue;
        }
        else if ([[str substringToIndex:1] isEqualToString:@"!"]) {
            [tempArr addObject:@"img"];
        }
        else if ([[str substringToIndex:1] isEqualToString:@"p"])
        {
            [tempArr addObject:[str substringFromIndex:2]];
        }
        else if ([[str substringToIndex:1] isEqualToString:@"b"])
        {
            [tempArr addObject:[str substringFromIndex:2]];
        }
    }
//    NSLog(@"%@",tempArr);
    _bodyArr = tempArr;
    NSLog(@"%@",_bodyArr);
}

@end
