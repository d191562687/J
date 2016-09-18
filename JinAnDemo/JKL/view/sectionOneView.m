//
//  sectionOneView.m
//  JinAnDemo
//
//  Created by ma c on 15/11/26.
//  Copyright © 2015年 xiayuanquan. All rights reserved.
//

#import "sectionOneView.h"
#import "const.h"

#import "QueryFourViewController.h"
#import "CompanyViewController.h"
#import "FeedbackViewController.h"
#import "CloudViewController.h"
#import "MapViewController.h"
#import "TipsViewController.h"


@interface sectionOneView()
@property (strong,nonatomic)UIButton *imageButton;
@property (strong,nonatomic)UILabel *nameLabel;
@property (strong,nonatomic)NSArray *images;
@property (strong,nonatomic)NSArray *labels;

@property (strong,nonatomic)UIImageView *imgView;
@property (strong,nonatomic)UILabel *titleLabel;

@property (nonatomic,strong) UIViewController *superVC;
@end

static const CGFloat gap = 20;
static const NSInteger col = 3;

@implementation sectionOneView
-(NSArray *)images
{
    if (!_images)
    {
        _images = @[[UIImage imageNamed:@"jkl_tag"],
                    [UIImage imageNamed:@"jkl_special"],
                    [UIImage imageNamed:@"jkl_shape"],
                    [UIImage imageNamed:@"jkl_sheriff_badge"],
                    [UIImage imageNamed:@"jkl_award_ribbon"],
                    [UIImage imageNamed:@"jkl_truck"]];
    }
    return _images;
}

-(NSArray *)labels
{
    if (!_labels)
    {
        _labels = @[@"企业信息查询",@"地图定位",@"四品一械查询",@"贴士",
                    @"食药风险反馈",@"云助手"
                    ];
    }
    return _labels;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
        //添加分割线
        [self createSplitLine:CGRectMake(145, 5, 1, 280) andImage:[UIImage imageNamed:@"jkl_vertical_line"]];
        //添加分割线
        [self createSplitLine:CGRectMake(275, 5, 1, 280) andImage:[UIImage imageNamed:@"jkl_vertical_line"]];
        
        
        //添加分割线
        [self createSplitLine:CGRectMake(0, 148, SCREEN_WIDTH, 1) andImage:[UIImage imageNamed:@"jkl_horizontal_line"]];

        
        
        CGFloat x = gap;
        CGFloat y = gap/4;
        CGFloat imageButtonWidth = (SCREEN_WIDTH - gap * (col+1))/col;
        CGFloat imageButtonHeight = imageButtonWidth;
        for (int i=0; i<self.images.count; i++)
        {
            _imageButton = [[UIButton alloc]init];
            _imageButton.frame = CGRectMake(x, y, imageButtonWidth,imageButtonHeight);
            _imageButton.tag = 10 +i;
            [_imageButton setImage:self.images[i] forState:UIControlStateNormal];
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(OnTapBtnView:)];
            [_imageButton addGestureRecognizer:tap];
            
            
            
            _nameLabel = [[UILabel alloc]init];
            _nameLabel.textAlignment = NSTextAlignmentCenter;
            _nameLabel.font = [UIFont systemFontOfSize:13];
            _nameLabel.frame = CGRectMake(x, y+imageButtonHeight,imageButtonWidth,20);
            _nameLabel.text = self.labels[i];
            
            
            
            
            
            if ((i+1) % col == 0 && i !=0)
            {
                x = gap;
                y += imageButtonHeight + gap;
            }
            else
            {
                x += imageButtonWidth + gap;
            }
            
            [self addSubview:_imageButton];
            [self addSubview:_nameLabel];
        }
    }
    return self;
}

- (UIViewController *)viewController:(UIView *)view{
    
    
    
    UIResponder *responder = view;
    
    while ((responder = [responder nextResponder]))
        
        if ([responder isKindOfClass: [UIViewController class]])
            
            return (UIViewController *)responder;
    
    
    
    return nil;
    
}



//添加分割线
-(void)createSplitLine:(CGRect)frame andImage:(UIImage *)image
{
    _imgView = [[UIImageView alloc]initWithFrame:frame];
    [_imgView setImage:image];
    [self addSubview:_imgView];
}


-(void)OnTapBtnView:(UITapGestureRecognizer *)sender{
    NSLog(@"tag:%d",sender.view.tag);
    switch (sender.view.tag) {
        case 10:
        {
            CompanyViewController * companyVC = [[CompanyViewController alloc]init];
            _superVC = [self viewController:self];
            [_superVC.navigationController pushViewController:companyVC animated:YES];
     
        }
            break;
            
        case 11:
        {
            _superVC = nil;
            MapViewController * mapVC = [[MapViewController alloc]init];
            _superVC = [self viewController:self];
            [_superVC.navigationController pushViewController:mapVC animated:YES];
            
        }
            break;
            
        case 12:
        {
            _superVC = nil;
            QueryFourViewController * queryFVC = [[QueryFourViewController alloc]init];
            _superVC = [self viewController:self];
            [_superVC.navigationController pushViewController:queryFVC animated:YES];
            
        }
            break;
            
        case 13:
        {
            _superVC = nil;
            TipsViewController * tipsVC = [[TipsViewController alloc]init];
            _superVC = [self viewController:self];
            [_superVC.navigationController pushViewController:tipsVC animated:YES];
            
        }
            break;
            
        case 14:
        {
            _superVC = nil;
            FeedbackViewController * feedbackVC = [[FeedbackViewController alloc]init];
            _superVC = [self viewController:self];
            [_superVC.navigationController pushViewController:feedbackVC animated:YES];
            
        }
            break;
            
        case 15:
        {
            _superVC = nil;
            CloudViewController * cloudVC = [[CloudViewController alloc]init];
            _superVC = [self viewController:self];
            [_superVC.navigationController pushViewController:cloudVC animated:YES];
            
        }
            break;
            

        default:
            break;
    }
}
@end
