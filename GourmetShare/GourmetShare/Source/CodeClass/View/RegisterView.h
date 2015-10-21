//
//  RegisterView.h
//  GourmetShare
//
//  Created by jang on 15/10/20.
//  Copyright © 2015年 jang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterView : UIView
@property (nonatomic,strong) UITextField * userNameText;
@property (nonatomic,strong) UITextField * passWordText;
@property (nonatomic,strong) UITextField * confirmText;
@property (nonatomic,strong) UITextField * emailText;
@property (nonatomic,strong) UITextField * phoneNumberText;
@property (nonatomic,strong) UIButton *registButton;
@end
