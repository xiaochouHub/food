//
//  RegisterView.h
//  GourmetShare
//
//  Created by jang on 15/10/20.
//  Copyright © 2015年 jang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LTView;
@interface RegisterView : UIView
@property (nonatomic,strong) LTView * userNameText;
@property (nonatomic,strong) LTView * passWordText;
@property (nonatomic,strong) LTView * confirmText;
@property (nonatomic,strong) LTView * emailText;
@property (nonatomic,strong) LTView * phoneNumberText;
@property (nonatomic,strong) UIButton *registButton;
@end
