//
//  JKLHomeController.m
//  JinAnDemo
//
//  Created by ma c on 15/11/26.
//  Copyright © 2015年 xiayuanquan. All rights reserved.
//


#import "JKLHomeController.h"
#import "const.h"
#import "AFNetworking.h"
#import "JKLScrollShop.h"
#import "MJExtension.h"
#import "UIImageView+WebCache.h"
#import "JKLHeadScrollView.h"
#import "JKLHomeCell.h"
#import "JKLSelecGoods.h"
#import "JKLMoreButton.h"
#import "DY_searchViewController.h"

#import "Macros.h"
#import "AddBookViewController.h"
#import "Book.h"
#import "SVProgressHUD.h"
#import "BookManager.h"
#import "MJRefresh.h"
#import "BookManager.h"
#import "MJRefresh.h"
#import "Macros.h"
#import "Masonry.h"
#import "AddBookViewController.h"
#import "SVProgressHUD.h"
#import "NSArray+Sort.h"
#import "ZFModalTransitionAnimator.h"


#import "LBXScanView.h"
#import <objc/message.h>
#import "LBXScanResult.h"
#import "LBXScanWrapper.h"
#import "SubLBXScanViewController.h"

@interface JKLHomeController()<UITableViewDataSource,UITableViewDelegate>
@property (strong,nonatomic)UITableView *tableView;
@property (strong,nonatomic)NSMutableArray *imageShop;
@property (strong,nonatomic)NSMutableArray *selectedGoods;
@property (strong,nonatomic)JKLHeadScrollView *headView;
@property (strong,nonatomic)JKLHomeCell *cell;
@property (nonatomic, strong) NSArray   *booksArray;
@property (nonatomic, strong) ZFModalTransitionAnimator     *animator;


@end

@implementation JKLHomeController

-(NSMutableArray *)imageShop
{
    if (!_imageShop)
    {
        _imageShop = [NSMutableArray array];
    }
    return _imageShop;
}

-(NSMutableArray *)selectedGoods
{
    if (!_selectedGoods)
    {
        _selectedGoods = [NSMutableArray array];
    }
    return _selectedGoods;
}




//-(void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    
//
//    [self.navigationController.navigationBar setBarTintColor:[UIColor groupTableViewBackgroundColor]];
//    
//    //左按钮
//    UIButton *leftbutton = [[UIButton alloc]initWithFrame:CGRectMake(20, 7, 30, 27)];
//    [leftbutton setImage:[UIImage imageNamed:@"Pulse"] forState:UIControlStateNormal];
//    [leftbutton addTarget:self action:@selector(showAddView) forControlEvents:UIControlEventTouchUpInside];
//    [self.navigationController.navigationBar addSubview:leftbutton];
//    
//    
//    UIButton * serBar = [[UIButton alloc]initWithFrame:CGRectMake(80, 6, 270, 35)];
//    [serBar setImage:[UIImage imageNamed:@"sear.png"] forState:UIControlStateNormal];
//
//    [serBar addTarget:self action:@selector(enterSearchVC) forControlEvents:UIControlEventTouchUpInside];
//    [serBar setShowsTouchWhenHighlighted:YES];
//    [self.navigationController.navigationBar addSubview:serBar];
//    
//    [self.navigationController.navigationBar setAlpha:0.3f];
//    
//    //右按钮
//    UIButton *rightbutton = [[UIButton alloc]initWithFrame:CGRectMake(365, 2, 30, 33)];
//    [rightbutton setImage:[UIImage imageNamed:@"ico_camera_7_gray@2x"] forState:UIControlStateNormal];
//    [rightbutton addTarget:self action:@selector(qqStyle) forControlEvents:UIControlEventTouchUpInside
//     ];
//    [self.navigationController.navigationBar addSubview:rightbutton];
//}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

    
    
-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setNav];
    //创建表格视图
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 47, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        //加载滚动视图图片数据
        [self loadShopImage];
        
        //加载精选商品图片数据
        [self loadSelectedGoods];
        
//        //设置定时器
//        [NSTimer scheduledTimerWithTimeInterval:3.0f target:self selector:@selector(pageChanged) userInfo:nil repeats:YES];
    });
    

}

-(void)setNav{
    
    //左按钮
    UIButton *leftbutton = [[UIButton alloc]initWithFrame:CGRectMake(20, 7, 30, 27)];
    [leftbutton setImage:[UIImage imageNamed:@"Pulse"] forState:UIControlStateNormal];
    [leftbutton addTarget:self action:@selector(showAddView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:leftbutton];
    
    
    UIButton * serBar = [[UIButton alloc]initWithFrame:CGRectMake(80, 6, 270, 35)];
    [serBar setImage:[UIImage imageNamed:@"sear.png"] forState:UIControlStateNormal];
    [serBar addTarget:self action:@selector(enterSearchVC) forControlEvents:UIControlEventTouchUpInside];
    [serBar setShowsTouchWhenHighlighted:YES];
    [self.view addSubview:serBar];
    

    
    //右按钮
    UIButton *rightbutton = [[UIButton alloc]initWithFrame:CGRectMake(365, 2, 30, 33)];
    [rightbutton setImage:[UIImage imageNamed:@"ico_camera_7_gray@2x"] forState:UIControlStateNormal];
    [rightbutton addTarget:self action:@selector(qqStyle) forControlEvents:UIControlEventTouchUpInside
     ];
    [self.view addSubview:rightbutton];

    
}

//点击进入搜索界面
- (void)enterSearchVC{
    
    DY_searchViewController *searchVC = [[DY_searchViewController alloc]init];
    [self presentViewController:searchVC animated:YES completion:
     ^{
         
     }];
}

- (void)refreshBookList {
    self.booksArray = [[BookManager sharedManager] findAllBooks];
    [self.tableView reloadData];
    
    [self.tableView.mj_header endRefreshing];
}
//添加按钮
- (void)showAddView {
    
    WS(ws);
    AddBookViewController *viewController = [[AddBookViewController alloc] init];
    viewController.willAddBlock = ^(Book *book, AddBookViewController *viewController){
        
        __block BOOL canAdd = YES;
        [ws.booksArray enumerateObjectsUsingBlock:^(Book *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj.bookID isEqualToString:book.bookID]) {
                [SVProgressHUD showErrorWithStatus:@"添加失败,ID不能重复"];
                
                canAdd = NO;
                *stop = YES;
            }
        }];
        
        if (canAdd) {
            BOOL success = [[BookManager sharedManager] addBook:book];
            if (success) {
                [SVProgressHUD showSuccessWithStatus:@"添加成功。"];
                [viewController dismissViewControllerAnimated:YES completion:nil];
                [self refreshBookList];
            }else {
                [SVProgressHUD showErrorWithStatus:@"添加失败。"];
            }
        }
        
    };
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:viewController];
    navController.modalPresentationStyle = UIModalPresentationCustom;
    
    self.animator = [[ZFModalTransitionAnimator alloc] initWithModalViewController:viewController];
    self.animator.dragable = NO;
    self.animator.bounces = YES;
    self.animator.behindViewAlpha = 0.7;
    self.animator.behindViewScale = 0.9;
    self.animator.direction = ZFModalTransitonDirectionBottom;
    navController.transitioningDelegate = self.animator;
    [self presentViewController:navController animated:YES completion:nil];
}

#pragma mark - 加载滚动视图数据
-(void)loadShopImage
{
    NSArray *testArr = @[@"http://img4.duitang.com/uploads/item/201303/17/20130317090104_jF8iH.jpeg",@"http://imgsrc.baidu.com/forum/pic/item/0e2442a7d933c895d8064c31d11373f08202007b.jpg",@"http://d.3987.com/Qhyrz_130520/004.jpg"];
    
    
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [[AFJSONResponseSerializer alloc]init];
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setObject:@"Goods" forKey:@"app"];
    [parameters setObject:@"AppIndex" forKey:@"class"];
    [parameters setObject:@"1" forKey:@"page_id"];
    
    [manager POST:@"http://platform.jkl.com.cn/api" parameters:parameters
    
    success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject)
    {
        
        NSArray *data = @[@"http://img4.duitang.com/uploads/item/201303/17/20130317090104_jF8iH.jpeg",@"http://imgsrc.baidu.com/forum/pic/item/0e2442a7d933c895d8064c31d11373f08202007b.jpg",@"http://d.3987.com/Qhyrz_130520/004.jpg"];
        
        [data enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL *stop) {
            
            //创建图片实体并保存起来
            JKLScrollShop *shop = [JKLScrollShop mj_objectWithKeyValues:obj];
            [self.imageShop addObject:shop];
        }];
        
        [self.tableView reloadData];
    }
    failure:^(AFHTTPRequestOperation *operation, NSError *error)
    {
        NSLog(@"%@",error);
    }];
}

#pragma mark - 加载精品商品数据
-(void)loadSelectedGoods
{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [[AFJSONResponseSerializer alloc]init];
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setObject:@"2" forKey:@"order"];
    [parameters setObject:@"" forKey:@"category_id"];
    [parameters setObject:@"" forKey:@"brand_id"];
    [parameters setObject:@"Goods" forKey:@"app"];
    [parameters setObject:@"24" forKey:@"psize"];
    [parameters setObject:@"" forKey:@"key"];
    [parameters setObject:@"GetGoodsList" forKey:@"class"];
    [parameters setObject:@"0" forKey:@"type"];
    [parameters setObject:@"1" forKey:@"p"];
    
    [manager POST:JKL_URL parameters:parameters
     success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject)
     {
         NSDictionary *data = [responseObject objectForKey:@"data"];
         NSArray *info = [data objectForKey:@"info"];
         
         [info enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL *stop) {
             
             JKLSelecGoods *selecShop = [JKLSelecGoods mj_objectWithKeyValues:obj];
             
             [self.selectedGoods addObject:selecShop];
         }];
         [self.tableView reloadData];
     }
     failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",error);
     }];
}



#pragma mark - 数据源方法
//设置组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
//设置每一组行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

//设置每一个单元格的内容
-(JKLHomeCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //1.创建单元格
    self.cell = [[JKLHomeCell alloc]init];
    self.cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    //2.设置单元格对象的内容
    if (indexPath.section == 0)
    {
        [self.cell createSectionOneView];
    }
    else if (indexPath.section == 1)
    {
        [self.cell createSectionSecondView];
    }
    else
    {
        [self.cell createSectionThreeViewWithShops:self.selectedGoods];
    }
    
    return self.cell;
}

#pragma mark - 代理方法
//返回表头高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return SECTION_ONE_HEAD_HEIGHT;
    }
    else if(section == 1)
    {
        return 0.1;
    }
    else
    {
        return 20;
    }
}
//返回表头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        self.headView = [[JKLHeadScrollView alloc]init];
        self.headView.pageControl.numberOfPages = self.imageShop.count;
        self.headView.pageControl.currentPage = 0;
        
        for (int i=0; i< self.imageShop.count; i++)
        {
          [self.headView sendEntityIamge:[self.imageShop objectAtIndex:i] andIndex:i];
        }
        
        [self.tableView addSubview:self.headView.pageControl];
        return self.headView;
    }
    return nil;
}

//返回单元格行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return SECTION_ONE_VIEW_HEIGHT;
    }
    else if (indexPath.section == 1)
    {
        return SECTION_TWO_VIEW_HEIGHT;
    }
    else
    {
        return SECTION_THREE_VIEW_HEIGHT;
    }
}

//返回组间标题
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 2)
    {
        //创建更多按钮
        JKLMoreButton *moreButton = [[JKLMoreButton alloc]init];
        [self.tableView addSubview:moreButton];
        
        return @"贴士";
    }
    return @"";
}
#pragma mark - NSTimer定时器处理
-(void)pageChanged
{
    NSInteger page = self.headView.pageControl.currentPage;
    
    if (page == self.imageShop.count-1)
    {
        page = 0;
    }
    else
    {
        page ++;
    }
    [UIView animateWithDuration:1.0f animations:^{
        CGPoint point = CGPointMake(SCREEN_WIDTH * page, 0);
        self.headView.contentOffset = point;
    }];
}

#pragma mark - 扫一扫
- (void)qqStyle
{
    //设置扫码区域参数设置
    
    //创建参数对象
    LBXScanViewStyle *style = [[LBXScanViewStyle alloc]init];
    
    //矩形区域中心上移，默认中心点为屏幕中心点
    style.centerUpOffset = 44;
    
    //扫码框周围4个角的类型,设置为外挂式
    style.photoframeAngleStyle = LBXScanViewPhotoframeAngleStyle_Outer;
    
    //扫码框周围4个角绘制的线条宽度
    style.photoframeLineW = 6;
    
    //扫码框周围4个角的宽度
    style.photoframeAngleW = 24;
    
    //扫码框周围4个角的高度
    style.photoframeAngleH = 24;
    
    //扫码框内 动画类型 --线条上下移动
    style.anmiationStyle = LBXScanViewAnimationStyle_LineMove;
    
    //线条上下移动图片
    style.animationImage = [UIImage imageNamed:@"CodeScan.bundle/qrcode_scan_light_green"];
    
    //SubLBXScanViewController继承自LBXScanViewController
    //添加一些扫码或相册结果处理
    SubLBXScanViewController *vc = [SubLBXScanViewController new];
    vc.style = style;   
    
    vc.isQQSimulator = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
