//
//  QueryFourViewController.m
//  JinAnDemo
//
//  Created by 金安健 on 16/9/18.
//  Copyright © 2016年 xiayuanquan. All rights reserved.
//

#import "QueryFourViewController.h"

@interface QueryFourViewController ()
{
    UILabel *_titleLabel;
    int _isFirstIn;
    
    //
    UIActivityIndicatorView *_activityView;
}
@end

@implementation QueryFourViewController

////利用生命周期设置是否隐藏 navigationBar
//
//- (void)viewWillAppear:(BOOL)animated {
//    
//    [super viewWillAppear:animated];
//    
//    
//    
//    [self.navigationController setNavigationBarHidden:YES animated:animated];
//    
//}
//
//
//- (void)viewWillDisappear:(BOOL)animated {
//    
//    [super viewWillDisappear:animated];
//    
//    
//    
//    [self.navigationController setNavigationBarHidden:NO animated:animated];
//    
//}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];


    [self.navigationController.navigationBar setBarTintColor:[UIColor groupTableViewBackgroundColor]];

    //标题
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 6, 270, 35)];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    //    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.text = @"四品一械查询";
    [self.navigationController.navigationBar addSubview:_titleLabel];




}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    [self setNav];
}


-(void)setNav{
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 54)];
    backView.backgroundColor = RGB(250, 250, 250);
    [self.view addSubview:backView];
    //下划线
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 53.5, screen_width, 0.5)];
    lineView.backgroundColor = RGB(192, 192, 192);
    [backView addSubview:lineView];
    
    //返回
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(10, 20, 23, 23);
    [backBtn setImage:[UIImage imageNamed:@"btn_backItem"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(OnBackBtn:) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:backBtn];
    //标题
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(screen_width/2-80, 17, 160, 30)];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    //    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.text = @"四品一械查询";
    [backView addSubview:_titleLabel];

    
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


-(void)OnBackBtn:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}



@end
