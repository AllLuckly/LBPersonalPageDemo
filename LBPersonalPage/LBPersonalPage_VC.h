//
//  LBPersonalPage_VC.h
//  LBPersonalPage
//
//  Created by chenlei_mac on 15/8/31.
//  Copyright (c) 2015年 Bison. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import <Foundation/Foundation.h>

@interface LBPersonalPage_VC : UIViewController

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *imageBG;
@property (nonatomic, strong) UIView *BGView;
@property (nonatomic, strong) UIImageView *headImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) UIButton *rightBtn;

-(void)leftBtnAction;

-(void)rightBtnAction;

@end
