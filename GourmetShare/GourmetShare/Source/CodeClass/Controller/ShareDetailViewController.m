//
//  ShareDetailViewController.m
//  GourmetShare
//
//  Created by lanou3g on 15/10/23.
//  Copyright © 2015年 jang. All rights reserved.
//

#import "ShareDetailViewController.h"
#import "ShareDetailView.h"

@interface ShareDetailViewController ()<UITextViewDelegate>

@property (nonatomic,strong)ShareDetailView *share;

@end

@implementation ShareDetailViewController
-(void)loadView
{
    self.share = [[ShareDetailView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.view = _share;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.share.backScroll.contentSize = CGSizeMake(CGRectGetWidth([[UIScreen mainScreen]bounds]), CGRectGetHeight([[UIScreen mainScreen]bounds]) + 200);
    self.share.stepText.delegate = self;
    self.share.materialText.delegate = self;
    self.share.nameText.delegate = self;
    // Do any additional setup after loading the view.
    UIToolbar * topView = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 30)];
    [topView setBarStyle:UIBarStyleBlackTranslucent];
    
    UIBarButtonItem * btnSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(2, 5, CGRectGetWidth([[UIScreen mainScreen]bounds]), 25);
    [btn addTarget:self action:@selector(dismissKeyBoard) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"   ↓收起↓" forState:UIControlStateNormal];
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc]initWithCustomView:btn];
    NSArray * buttonsArray = [NSArray arrayWithObjects:btnSpace,doneBtn,nil];
    [topView setItems:buttonsArray];
    [self.share.stepText setInputAccessoryView:topView];
    [self.share.materialText setInputAccessoryView:topView];
    [self.share.nameText setInputAccessoryView:topView];
}
-(void)dismissKeyBoard
{
    [self.share.stepText resignFirstResponder];
    [self.share.materialText resignFirstResponder];
    [self.share.nameText resignFirstResponder];
}

// 防止键盘遮挡
-(BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    CGFloat offset = self.view.frame.size.height - (textView.frame.origin.y + textView.frame.size.height + 210);
    if (offset <= 0) {
        [UIView animateWithDuration:0.3 animations:^{
            CGRect frame = self.view.frame;
            frame.origin.y = offset;
            self.view.frame = frame;
        }];
    }
    return YES;
}

-(BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    [UIView animateWithDuration:0.3 animations:^{
        CGRect frame = self.view.frame;
        frame.origin.y = 0.0;
        self.view.frame = frame;
    }];
    return YES;
}

-(void)ba
{
    [self.share.stepText resignFirstResponder];
    [self.share.materialText resignFirstResponder];
    [self.share.nameText resignFirstResponder];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
