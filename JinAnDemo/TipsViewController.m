//
//  TipsViewController.m
//  JinAnDemo
//
//  Created by 金安健 on 16/9/18.
//  Copyright © 2016年 xiayuanquan. All rights reserved.
//

#import "TipsViewController.h"

@interface TipsViewController ()
{
    UILabel *_titleLabel;

    UIActivityIndicatorView *_activityView;
}
@end

@implementation TipsViewController

//利用生命周期设置是否隐藏 navigationBar

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    
}


- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    
    
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setNav];
}


-(void)setNav{
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 64)];
    backView.backgroundColor = RGB(250, 250, 250);
    [self.view addSubview:backView];
    //下划线
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 63.5, screen_width, 0.5)];
    lineView.backgroundColor = RGB(192, 192, 192);
    [backView addSubview:lineView];
    
    //返回
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(10, 30, 23, 23);
    [backBtn setImage:[UIImage imageNamed:@"btn_backItem"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(OnBackBtn:) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:backBtn];
    //标题
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(screen_width/2-80, 25, 160, 30)];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    //    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.text = @"贴士";
    [backView addSubview:_titleLabel];
    
    
}

-(void)OnBackBtn:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
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
