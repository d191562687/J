//
//  AddBookViewController.m
//  BookManager
//
//  Created by SuperMan on 16/5/13.
//  Copyright © 2016年 SuperMan. All rights reserved.
//

#import "AddBookViewController.h"
#import "Macros.h"
#import "Masonry.h"
#import "SVProgressHUD.h"
#import "BookManager.h"
#import "Book.h"

@interface AddBookViewController ()

@property (nonatomic, strong) UITextField *IDTextField;

@property (nonatomic, strong) UITextField *nameTextField;

@property (nonatomic, strong) UITextField *phTextField;

@property (nonatomic, strong) UITextField *authorTextField;
//最小包装单位
@property (nonatomic, strong) UITextField *smallTextField;
//批号
@property (nonatomic, strong) UITextField *numberTextField;
//生产日期
@property (nonatomic, strong) UITextField *dayTextField;
//有效日期至
@property (nonatomic, strong) UITextField *endDayTextField;
//往来单位编号
@property (nonatomic, strong) UITextField *contNumberTextField;
//往来单位名称
@property (nonatomic, strong) UITextField *contNameTextField;
//购进设置
@property (nonatomic, strong) UITextField *paySetTextField;

@property (nonatomic, strong) UITextView  *textView;


@end

@implementation AddBookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"添加药食";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    //添加图书入口
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithTitle:@"添加" style:UIBarButtonItemStyleDone target:self action:@selector(addBook)];
    self.navigationItem.rightBarButtonItem = addItem;
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem = backItem;
    
    [self showSubviews];
}


- (void)showSubviews{
    //布局参数
    CGFloat leftSpace = 10.0;
    CGFloat rightSpace = 10.0;
    CGFloat vSpace = 20.0;
    CGFloat labelWidth = 100.0;
    CGFloat height = 20.0;
    
    UILabel *IDLabel = [[UILabel alloc] init];
    IDLabel.text = @"商品编码：";
    [self.view addSubview:IDLabel];
    [IDLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(84.0);
        make.left.equalTo(self.view).offset(leftSpace);
        make.width.mas_equalTo(labelWidth);
        make.height.mas_equalTo(height);
    }];
    
    self.IDTextField = [[UITextField alloc] init];
    self.IDTextField.keyboardType = UIKeyboardTypeNumberPad;
    self.IDTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.IDTextField];
    [self.IDTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(IDLabel.mas_right);
        make.right.equalTo(self.view).offset(-rightSpace);
        make.height.and.top.equalTo(IDLabel);
    }];
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.text = @"药品名称：";
    [self.view addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(IDLabel.mas_bottom).offset(vSpace);
        make.left.and.width.and.height.equalTo(IDLabel);
    }];
    
    self.nameTextField = [[UITextField alloc] init];
    self.nameTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.nameTextField];
    [self.nameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.IDTextField);
        make.height.and.top.equalTo(nameLabel);
    }];
    
    UILabel *phLabel = [[UILabel alloc] init];
    phLabel.text = @"规格：";
    [self.view addSubview:phLabel];
    [phLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nameLabel.mas_bottom).offset(vSpace);
        make.left.and.width.and.height.equalTo(IDLabel);
    }];
    
    self.phTextField = [[UITextField alloc] init];
    self.phTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.phTextField];
    [self.phTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.IDTextField);
        make.height.and.top.equalTo(phLabel);
    }];
    
    UILabel *authorLabel = [[UILabel alloc] init];
    authorLabel.text = @"药剂类型：";
    [self.view addSubview:authorLabel];
    [authorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(phLabel.mas_bottom).offset(vSpace);
        make.left.and.width.and.height.equalTo(IDLabel);
    }];
    
    self.authorTextField = [[UITextField alloc] init];
    self.authorTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.authorTextField];
    [self.authorTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.IDTextField);
        make.height.and.top.equalTo(authorLabel);
    }];
    
    
    //最小包装单位
//    @property (nonatomic, strong) UITextField *smallTextField;
    
    UILabel * smallLabel = [[UILabel alloc] init];
    smallLabel.text = @"药剂类型：";
    [self.view addSubview:smallLabel];
    [smallLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(authorLabel.mas_bottom).offset(vSpace);
        make.left.and.width.and.height.equalTo(IDLabel);
    }];
    
    self.smallTextField = [[UITextField alloc] init];
    self.smallTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.smallTextField];
    [self.smallTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.IDTextField);
        make.height.and.top.equalTo(smallLabel);
    }];

    
//    //批号
//    @property (nonatomic, strong) UITextField *numberTextField;
    UILabel * numberLabel = [[UILabel alloc] init];
    numberLabel.text = @"批号：";
    [self.view addSubview:numberLabel];
    [numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(smallLabel.mas_bottom).offset(vSpace);
        make.left.and.width.and.height.equalTo(IDLabel);
    }];
    
    self.numberTextField = [[UITextField alloc] init];
    self.numberTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.numberTextField];
    [self.numberTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.IDTextField);
        make.height.and.top.equalTo(numberLabel);
    }];
    
//    //生产日期
//    @property (nonatomic, strong) UITextField *dayTextField;
    UILabel * dayLabel = [[UILabel alloc] init];
    dayLabel.text = @"生产日期：";
    [self.view addSubview:dayLabel];
    [dayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(numberLabel.mas_bottom).offset(vSpace);
        make.left.and.width.and.height.equalTo(IDLabel);
    }];
    
    self.dayTextField = [[UITextField alloc] init];
    self.dayTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.dayTextField];
    [self.dayTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.IDTextField);
        make.height.and.top.equalTo(dayLabel);
    }];

//    //有效日期至
//    @property (nonatomic, strong) UITextField *endDayTextField;
    UILabel * endDayLabel = [[UILabel alloc] init];
    endDayLabel.text = @"有效期至：";
    [self.view addSubview:endDayLabel];
    [endDayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(dayLabel.mas_bottom).offset(vSpace);
        make.left.and.width.and.height.equalTo(IDLabel);
    }];
    
    self.endDayTextField = [[UITextField alloc] init];
    self.endDayTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.endDayTextField];
    [self.endDayTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.IDTextField);
        make.height.and.top.equalTo(endDayLabel);
    }];
    
//    //往来单位编号
//    @property (nonatomic, strong) UITextField *contNumberTextField;
    UILabel * contNumberLabel = [[UILabel alloc] init];
    contNumberLabel.text = @"单位编号：";
    [self.view addSubview:contNumberLabel];
    [contNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(endDayLabel.mas_bottom).offset(vSpace);
        make.left.and.width.and.height.equalTo(IDLabel);
    }];
    
    self.contNumberTextField = [[UITextField alloc] init];
    self.contNumberTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.contNumberTextField];
    [self.contNumberTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.IDTextField);
        make.height.and.top.equalTo(contNumberLabel);
    }];
//    //往来单位名称
//    @property (nonatomic, strong) UITextField *contNameTextField;
    UILabel * contNameLabel = [[UILabel alloc] init];
    contNameLabel.text = @"单位名称：";
    [self.view addSubview:contNameLabel];
    [contNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(contNumberLabel.mas_bottom).offset(vSpace);
        make.left.and.width.and.height.equalTo(IDLabel);
    }];
    
    self.contNameTextField = [[UITextField alloc] init];
    self.contNameTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.contNameTextField];
    [self.contNameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.IDTextField);
        make.height.and.top.equalTo(contNameLabel);
     }];
    
//    //购进设置
//    @property (nonatomic, strong) UITextField *paySetTextField;
    UILabel * paySetLabel = [[UILabel alloc] init];
    paySetLabel.text = @"购进设置：";
    [self.view addSubview:paySetLabel];
    [paySetLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(contNameLabel.mas_bottom).offset(vSpace);
        make.left.and.width.and.height.equalTo(IDLabel);
    }];
    
    self.paySetTextField = [[UITextField alloc] init];
    self.paySetTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.paySetTextField];
    [self.paySetTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.IDTextField);
        make.height.and.top.equalTo(paySetLabel);
    }];
    
    
    
    
    
    UILabel *introducationLabel = [[UILabel alloc] init];
    introducationLabel.text = @"药品介绍：";
    [self.view addSubview:introducationLabel];
    [introducationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(paySetLabel.mas_bottom).offset(vSpace);
        make.left.and.width.and.height.equalTo(IDLabel);
    }];
    
    self.textView = [[UITextView alloc] init];
    self.textView.font = [UIFont systemFontOfSize:16.0];
    self.textView.layer.borderColor = [self getColorFromHex:@"#EAEAEA"].CGColor;
    self.textView.layer.borderWidth = 1.0;
    self.textView.layer.cornerRadius = 10.0;
    [self.view addSubview:self.textView];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(introducationLabel.mas_right);
        make.right.equalTo(self.view).offset(-rightSpace);
        make.top.equalTo(introducationLabel);
        make.height.equalTo(@100.0);
    }];
}

- (UIColor *) getColorFromHex:(NSString *)hexColor {
    NSString *hexString = hexColor;
    if (hexColor.length == 6 && ![hexColor hasPrefix:@"#"]) {
        hexString = [NSString stringWithFormat:@"#%@",hexColor];
    }
    
    unsigned int red, green, blue;
    NSRange range;
    range.length = 2;
    
    range.location = 1;
    [[NSScanner scannerWithString:[hexString substringWithRange:range]] scanHexInt:&red];
    range.location = 3;
    [[NSScanner scannerWithString:[hexString substringWithRange:range]] scanHexInt:&green];
    range.location = 5;
    [[NSScanner scannerWithString:[hexString substringWithRange:range]] scanHexInt:&blue];
    
    return [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green/255.0f) blue:(float)(blue/255.0f) alpha:1.0f];
}

- (void) addBook{
    if (IsAvailableString(self.IDTextField.text) && IsAvailableString(self.nameTextField.text) && IsAvailableString(self.phTextField.text) && IsAvailableString(self.authorTextField.text) && IsAvailableString(self.textView.text)) {
        [self saveBookToDatabase];
    }else {
        [SVProgressHUD showErrorWithStatus:@"信息输入不完整。"];
    }
}

- (void)back {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)saveBookToDatabase {
    Book *book = [[Book alloc] initWithID:self.IDTextField.text name:self.nameTextField.text publishHouse:self.phTextField.text author:self.authorTextField.text saveDate:[NSDate date] introducation:self.textView.text];
    if (self.willAddBlock) {
        self.willAddBlock(book, self);
    }
}
@end
