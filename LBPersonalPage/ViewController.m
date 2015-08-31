//
//  ViewController.m
//  LBPersonalPage
//
//  Created by chenlei_mac on 15/8/31.
//  Copyright (c) 2015年 Bison. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //头像设置
    self.headImageView.image = [UIImage imageNamed:@"myheadimage.jpeg"];
    //背景设置
    self.imageBG.image = [UIImage imageNamed:@"BG.jpg"];
    //昵称设置
    self.nameLabel.text = @"BISON";
}

//右边按钮
- (void)rightBtnAction{
    NSLog(@"hello-rig");
}
//左边按钮
- (void)leftBtnAction{
    NSLog(@"hello-left");
}


@end
