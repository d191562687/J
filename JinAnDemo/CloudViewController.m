//
//  CloudViewController.m
//  JinAnDemo
//
//  Created by 金安健 on 16/9/18.
//  Copyright © 2016年 xiayuanquan. All rights reserved.
//

#import "CloudViewController.h"

@interface CloudViewController ()
{
    UILabel *_titleLabel;
    
    UIActivityIndicatorView *_activityView;
}
@end

@implementation CloudViewController

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
    
    [self setButton];
    
    
    
}

-(void)setButton{
    UIButton *  cloudButton = [[UIButton alloc]initWithFrame:CGRectMake(screen_width / 10, screen_height/7, screen_width/3.0, screen_height/4.0)];
    cloudButton.backgroundColor = [UIColor whiteColor];
    cloudButton.layer.borderWidth = 1.5;
    cloudButton.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    [cloudButton setTitle:@"云知道" forState:UIControlStateNormal];
    [cloudButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [self.view addSubview:cloudButton];
    
    UIButton *  signButton = [[UIButton alloc]initWithFrame:CGRectMake(screen_width / 2.1 + screen_width / 10 ,  screen_height/7, screen_width/3.0, screen_height/4.0)];
    signButton.backgroundColor = [UIColor whiteColor];
    signButton.layer.borderWidth = 1.5;
    signButton.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    [signButton setTitle:@"签到" forState:UIControlStateNormal];
    [signButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [self.view addSubview:signButton];
    
    UIButton *  dynamicButton = [[UIButton alloc]initWithFrame:CGRectMake(screen_width / 10, screen_height/2, screen_width/3.0, screen_height/4.0)];
    dynamicButton.backgroundColor = [UIColor whiteColor];
    dynamicButton.layer.borderWidth = 1.5;
    dynamicButton.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    [dynamicButton setTitle:@"云动态" forState:UIControlStateNormal];
    [dynamicButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [self.view addSubview:dynamicButton];
    
    UIButton *  commentButton = [[UIButton alloc]initWithFrame:CGRectMake(screen_width / 2.1 + screen_width / 10 ,  screen_height/2, screen_width/3.0, screen_height/4.0)];
    commentButton.backgroundColor = [UIColor whiteColor];
    commentButton.layer.borderWidth = 1.5;
    commentButton.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    [commentButton setTitle:@"商家点评" forState:UIControlStateNormal];
    [commentButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [self.view addSubview:commentButton];
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
    _titleLabel.text = @"云助手";
    [backView addSubview:_titleLabel];
    
    
}

//返回
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
