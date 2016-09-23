//
//  JKLLoginController.m
//  JinAnDemo
//
//  Created by ma c on 15/11/26.
//  Copyright © 2015年 xiayuanquan. All rights reserved.
//

#import "JKLLoginController.h"
#import "const.h"

@interface JKLLoginController()<UITextFieldDelegate>{
    
    __weak  UITextField *txtFieldUsername;
    __weak  UITextField *txtFieldPassword;
    __weak  UIButton *btnLogin;
    __weak  UIButton *btnSignUp;
    
    UIView *viewLoading;
}


@property (strong,nonatomic)UIToolbar   *toolBar;
@property (strong,nonatomic)UIImageView *JKLLogol;
@property (strong,nonatomic)UITextField *userTextField;
@property (strong,nonatomic)UITextField *paswTextField;
@property (strong,nonatomic)UIImageView *userIcon;
@property (strong,nonatomic)UIImageView *lockIcon;
@property (strong,nonatomic)UIButton    *loginIcon;
@end

@implementation JKLLoginController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //创建工具栏
    [self createToolBar];
    
    //创建京客隆图标
    [self createLogol];
    
    //创建文本输入框
    [self createTextField];
    
    //创建登陆按钮
    [self createLoginButton];
}

//创建工具栏
-(void)createToolBar
{
    self.toolBar = [[UIToolbar alloc]init];
    [self.toolBar setBarTintColor:[UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1]];
    self.toolBar.frame = CGRectMake(0, 0, SCREEN_WIDTH, 44);
    [self.view addSubview:self.toolBar];
    //创建分割线
    UIButton *split=[[UIButton alloc]initWithFrame:CGRectMake(0,44,SCREEN_WIDTH, 1)];
    [split setImage:[UIImage imageNamed:@"load_cross"]forState:UIControlStateNormal];
    [self.view addSubview:split];
    
    //左边按钮
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(5, 5, 20, 20)];
    [button setImage:[[UIImage imageNamed:@"btn_backItem"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(backLoginView:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    
    //中间按钮
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(160, 7, 60, 40)];
    label.text = @"登陆";
    label.textColor = [UIColor brownColor];
    label.font = [UIFont systemFontOfSize:18];
    UIBarButtonItem *centerItem = [[UIBarButtonItem alloc]initWithCustomView:label];
    
    
    //右边按钮
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"注册" style:UIBarButtonItemStylePlain target:self action:@selector(showRegesterView:)];
    [rightItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor brownColor]} forState:UIControlStateNormal];
    
    
    //调节按钮
    UIBarButtonItem *flexiItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    self.toolBar.items = @[leftItem,flexiItem,centerItem,flexiItem,rightItem];
}

#pragma mark - backLoginView事件处理
-(void)backLoginView:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - showRegesterView事件处理
-(void)showRegesterView:(UIBarButtonItem *)sender
{
    
}

//创建京客隆图标
-(void)createLogol
{
    self.JKLLogol = [[UIImageView alloc]initWithFrame:CGRectMake(135,100,120,70)];
    [self.JKLLogol setImage:[UIImage imageNamed:@"load_logo"]];
    [self.view addSubview:self.JKLLogol];
}

//创建文本输入框
-(void)createTextField
{
    //用户图标
    self.userIcon = [[UIImageView alloc]initWithFrame:CGRectMake(10, 265, 20, 20)];
    [self.userIcon setImage:[UIImage imageNamed:@"load_user"]];
    [self.view addSubview:self.userIcon];
    
    //创建分割线
    UIButton *split1 = [[UIButton alloc]initWithFrame:CGRectMake(0,261,SCREEN_WIDTH, 1)];
    [split1 setImage:[UIImage imageNamed:@"load_cross"] forState:UIControlStateNormal];
    [self.view addSubview:split1];
    
    //手机号文本框
    self.userTextField = [[UITextField alloc]initWithFrame:CGRectMake(40, 260, SCREEN_WIDTH-43, 30)];
    self.userTextField.placeholder = @"请输账号";
    [self.view addSubview:self.userTextField];
    
    
    //创建分割线
    UIButton *split2 = [[UIButton alloc]initWithFrame:CGRectMake(0, 295, SCREEN_WIDTH, 1)];
    [split2 setImage:[UIImage imageNamed:@"load_cross"] forState:UIControlStateNormal];
    [self.view addSubview:split2];
    
    //密码锁图标
    self.lockIcon = [[UIImageView alloc]initWithFrame:CGRectMake(10, 303, 20, 20)];
    [self.lockIcon setImage:[UIImage imageNamed:@"load_lock"]];
    [self.view addSubview:self.lockIcon];
    
    //手机号文本框
    self.paswTextField = [[UITextField alloc]initWithFrame:CGRectMake(40, 300, SCREEN_WIDTH-43, 30)];
    self.paswTextField.placeholder = @"请输入密码";
    [self.view addSubview:self.paswTextField];
    
    //创建分割线
    UIButton *split3 = [[UIButton alloc]initWithFrame:CGRectMake(0, 329, SCREEN_WIDTH, 1)];
    [split3 setImage:[UIImage imageNamed:@"load_cross"] forState:UIControlStateNormal];
    [self.view addSubview:split3];
}

//创建登陆按钮
-(void)createLoginButton
{
    self.loginIcon = [[UIButton alloc]initWithFrame:CGRectMake(115, 450, 150, 35)];
    self.loginIcon.layer.borderColor = [[UIColor grayColor]CGColor];
    self.loginIcon.layer.borderWidth = 1;
    self.loginIcon.layer.cornerRadius = 5;
    [self.loginIcon setTitle:@"登陆" forState:UIControlStateNormal];
    [self.loginIcon setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    //设置按钮点击
    [self.loginIcon addTarget:self action:@selector(buttonLoginTouched:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.loginIcon];
}

#pragma mark - check user details
-(NSString *)checkUserDetails {
    NSCharacterSet *whiteNewChars = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    
    NSString *username = [self.userTextField.text stringByTrimmingCharactersInSet:whiteNewChars];
    NSString *password = [self.paswTextField.text stringByTrimmingCharactersInSet:whiteNewChars];
    
    NSString *message = @"";
    
    if ([username length] < 3){
        message = [NSString stringWithFormat:@"用户名太短啦"];
    }
    if ([password length] < 1){
        if ([message length]) message = [NSString stringWithFormat:@"%@, ",message];
        message = [NSString stringWithFormat:@"%@请谨慎设置密码",message];
    }
    
    return message;
}

#pragma mark - UITextField Delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if (textField == self.userTextField)
        [self.userTextField becomeFirstResponder];
    else{
        [textField resignFirstResponder];
        [self buttonLoginTouched:btnLogin];
    }
    
    return (textField == self.paswTextField);
}

-(void)buttonLoginTouched:(UIButton *)sender {
    
     NSString *errorMessage = [self checkUserDetails];
    
    NSLog(@"-----errorMessage------  %@",errorMessage);
    
    if (![errorMessage length]) {
        NSCharacterSet *whiteNewChars = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        NSString *username = [self.userTextField.text stringByTrimmingCharactersInSet:whiteNewChars];
        NSString *password = [self.paswTextField.text stringByTrimmingCharactersInSet:whiteNewChars];
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        
        
        NSDictionary *p1Info = @{
                                 @"USERNAME" : username,
                                 @"PASSWORD" : password
                                 };
        NSString *p1Str = [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:p1Info options:0 error:nil] encoding:NSUTF8StringEncoding];
        
        NSDictionary *params = @{@"json":p1Str};
        
        [manager POST:@"http://192.168.1.70:8098/SYAQ/appLogin/login_app.do?"
           parameters:params
              success:^(AFHTTPRequestOperation *operation,id responseObject){
                  NSLog(@"成功: ");
//                  NSLog(@"-------responseObject---------  %@",responseObject);
                  
                  NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
                  NSString * str = dic[@"code"];
                  
                    NSLog(@"-------str---------  %@",str);
                  
                      }
              failure:^(AFHTTPRequestOperation *operation,NSError *error){
                  NSLog(@"失败: %@", error);
              }];

        
    }
    
    
    
}


@end
