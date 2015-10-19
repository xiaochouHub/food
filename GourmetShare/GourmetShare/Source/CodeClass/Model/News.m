//
//  News.m
//  GourmetShare
//
//  Created by jang on 15/10/18.
//  Copyright © 2015年 jang. All rights reserved.
//

#import "News.h"

@implementation News

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{

}

- (void)setImage:(NSArray *)image
{
    if (image.count == 0) {
        _image = image;
    }
    else{
        NSMutableArray *array = [NSMutableArray array];
        for (NSDictionary *d in image) {
            [array addObject:[d valueForKey:@"url"]];
        }
        _image = array;
    }
}

@end
