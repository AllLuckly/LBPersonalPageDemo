# LBPersonalPageDemo

> [点击此--->更多开发技巧](http://allluckly.cn/) <br>

> [博主app上线啦，快点此来围观吧](https://itunes.apple.com/us/app/it-blog-zi-xueios-kai-fa-jin/id1067787090?l=zh&ls=1&mt=8)<br>

##技术交流群：534926022（免费）   511040024(0.8/人付费)


`继承LBPersonalPage_VC`
```
    //头像设置
    self.headImageView.image = [UIImage imageNamed:@"myheadimage.jpeg"];
    //背景设置
    self.imageBG.image = [UIImage imageNamed:@"BG.jpg"];
    //昵称设置
    self.nameLabel.text = @"BISON";
    //右边按钮
- (void)rightBtnAction{
    NSLog(@"hello-rig");
}
//左边按钮
- (void)leftBtnAction{
    NSLog(@"hello-left");
}
```


![(LBPersonalPageDemo)](https://github.com/AllLuckly/LBPersonalPageDemo/blob/master/123.gif?raw=true)

需要Swift版本的点击这里哟[Swift版](https://github.com/AllLuckly/LBSwift_PersonalPageDemo)
