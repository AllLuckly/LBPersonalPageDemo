//
//  LBPersonalPage_VC.m
//  LBPersonalPage
//
//  Created by chenlei_mac on 15/8/31.
//  Copyright (c) 2015年 Bison. All rights reserved.
//

#define KScreen_Width [UIScreen mainScreen].bounds.size.width
#define KScreen_Height [UIScreen mainScreen].bounds.size.height



#import "LBPersonalPage_VC.h"

const CGFloat BackGroupHeight = 200;
const CGFloat HeadImageHeight= 80;

@interface LBPersonalPage_VC ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

@end

@implementation LBPersonalPage_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
}

- (void)createUI{
    self.automaticallyAdjustsScrollViewInsets=NO;
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    
    _tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];

    _tableView.contentInset = UIEdgeInsetsMake(BackGroupHeight, 0, 0, 0);
    
    [self.view addSubview:_tableView];
    
    [_tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    _imageBG = [[UIImageView alloc]init];
    _imageBG.frame = CGRectMake(0, -BackGroupHeight, KScreen_Width, BackGroupHeight);
    _imageBG.image = [UIImage imageNamed:@"BG.jpg"];
    
    [_tableView addSubview:_imageBG];
    //
    _BGView = [[UIView alloc]init];
    _BGView.backgroundColor=[UIColor clearColor];
    _BGView.frame=CGRectMake(0, -BackGroupHeight, KScreen_Width, BackGroupHeight);
    
    [_tableView addSubview:_BGView];
    
    //
    _headImageView=[[UIImageView alloc]init];
    _headImageView.image=[UIImage imageNamed:@"myheadimage.jpeg"];
    _headImageView.frame=CGRectMake((KScreen_Width-HeadImageHeight)/2, 40, HeadImageHeight, HeadImageHeight);
    _headImageView.layer.cornerRadius = HeadImageHeight/2;
    _headImageView.clipsToBounds = YES;
    
    
    [_BGView addSubview:_headImageView];
    
    //
    
    _nameLabel=[[UILabel alloc]init];
    _nameLabel.text=@"BISON";
    _nameLabel.textAlignment=NSTextAlignmentCenter;
    _nameLabel.frame=CGRectMake((KScreen_Width-HeadImageHeight)/2, CGRectGetMaxY(_headImageView.frame)+5, HeadImageHeight, 20);
    
    [_BGView addSubview:_nameLabel];
    _titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
    _titleLabel.textColor=[UIColor whiteColor];
    _titleLabel.text=@"title";
    
    _titleLabel.textAlignment=NSTextAlignmentCenter;
    
    self.navigationItem.titleView=_titleLabel;
    _titleLabel.alpha=0;
    
    _leftBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 25)];
    [_leftBtn setTitle:@"left" forState:UIControlStateNormal];
    //    [leftBtn setBackgroundImage:[UIImage imageNamed:@"lift"] forState:UIControlStateNormal];
    [_leftBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_leftBtn addTarget:self action:@selector(leftBtnAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftItem=[[UIBarButtonItem alloc]initWithCustomView:_leftBtn];
    self.navigationItem.leftBarButtonItem=leftItem;
    
    _rightBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 25)];
    [_rightBtn setTitle:@"right" forState:UIControlStateNormal];
    [_rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_rightBtn addTarget:self action:@selector(rightBtnAction) forControlEvents:UIControlEventTouchUpInside];
    //    [rightBtn setBackgroundImage:[UIImage imageNamed:@"rig"] forState:UIControlStateNormal];
    
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithCustomView:_rightBtn];
    self.navigationItem.rightBarButtonItem=rightItem;
}
-(void)leftBtnAction
{
    NSLog(@"leftClick");
}
- (void)setTableView:(UITableView *)tableView{
    _tableView = tableView;
}
- (void)setHeadImageView:(UIImageView *)headImageView{
    _headImageView = headImageView;
}
- (void)setNameLabel:(UILabel *)nameLabel{
    _nameLabel = nameLabel;
}
- (void)setImageBG:(UIImageView *)imageBG{
    _imageBG = imageBG;
}

-(void)rightBtnAction
{
    NSLog(@"rightClick");
}

#pragma mark - tableViewDelegate&DataSource


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Bison%d",(int)indexPath.row];
    return cell;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat yOffset  = scrollView.contentOffset.y;
    CGFloat xOffset = (yOffset + BackGroupHeight)/2;
    
    if (yOffset < -BackGroupHeight) {
        
        CGRect rect = _imageBG.frame;
        rect.origin.y = yOffset;
        rect.size.height =  -yOffset ;
        rect.origin.x = xOffset;
        rect.size.width = KScreen_Width + fabs(xOffset)*2;
        _imageBG.frame = rect;
        CGRect HeadImageRect = CGRectMake((KScreen_Width-HeadImageHeight)/2, 40, HeadImageHeight, HeadImageHeight);
        HeadImageRect.origin.y = _headImageView.frame.origin.y;
        HeadImageRect.size.height =  HeadImageHeight + fabs(xOffset)*0.5 ;
        HeadImageRect.origin.x = self.view.center.x - HeadImageRect.size.height/2;
        HeadImageRect.size.width = HeadImageHeight + fabs(xOffset)*0.5;
        _headImageView.frame = HeadImageRect;
        _headImageView.layer.cornerRadius = HeadImageRect.size.height/2;
        _headImageView.clipsToBounds = YES;
        
        CGRect NameRect = CGRectMake((KScreen_Width-HeadImageHeight)/2, CGRectGetMaxY(_headImageView.frame)+5, HeadImageHeight, 20);
        NameRect.origin.y = CGRectGetMaxY(_headImageView.frame)+5;
        NameRect.size.height =  20 + fabs(xOffset)*0.5 ;
        NameRect.size.width = HeadImageHeight + fabs(xOffset)*0.5;
        NameRect.origin.x = self.view.center.x - NameRect.size.width/2;
        
        _nameLabel.font=[UIFont systemFontOfSize:17+fabs(xOffset)*0.2];
        
        _nameLabel.frame = NameRect;
        
        
    }else{
        CGRect HeadImageRect = CGRectMake((KScreen_Width-HeadImageHeight)/2, 40, HeadImageHeight, HeadImageHeight);
        HeadImageRect.origin.y = _headImageView.frame.origin.y;
        HeadImageRect.size.height =  HeadImageHeight - fabs(xOffset)*0.5 ;
        HeadImageRect.origin.x = self.view.center.x - HeadImageRect.size.height/2;
        HeadImageRect.size.width = HeadImageHeight - fabs(xOffset)*0.5;
        _headImageView.frame = HeadImageRect;
        _headImageView.layer.cornerRadius = HeadImageRect.size.height/2;
        _headImageView.clipsToBounds = YES;
        
        CGRect NameRect = CGRectMake((KScreen_Width-HeadImageHeight)/2, CGRectGetMaxY(_headImageView.frame)+5, HeadImageHeight, 20);
        NameRect.origin.y = CGRectGetMaxY(_headImageView.frame)+5;
        NameRect.size.height =  20;
        NameRect.size.width = HeadImageHeight - fabs(xOffset)*0.5;
        NameRect.origin.x = self.view.center.x - NameRect.size.width/2;
        
        _nameLabel.font=[UIFont systemFontOfSize:17-fabs(xOffset)*0.2];
        
        _nameLabel.frame = NameRect;
        
    }
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"BGimage.jpg"] forBarMetrics:UIBarMetricsDefault];
    //    CGFloat alpha = (yOffset+BackGroupHeight)/BackGroupHeight;
    CGFloat alpha = 0;
    [self.navigationController.navigationBar setBackgroundImage:[self imageWithColor:[[UIColor clearColor]colorWithAlphaComponent:alpha]] forBarMetrics:UIBarMetricsDefault];
    //    titleLabel.alpha=alpha;
    //    alpha=fabs(alpha);
    //    alpha=fabs(1-alpha);
    //    alpha=alpha<0.2? 0:alpha-0.2;
    //    BGView.alpha=alpha;

}


- (UIImage *)imageWithColor:(UIColor *)color
{
    // 描述矩形
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    // 获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);
    
    // 渲染上下文
    CGContextFillRect(context, rect);
    // 从上下文中获取图片
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    
    return theImage;
}


@end
