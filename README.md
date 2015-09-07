# LBPersonalPageDemo

> [点击此--->更多开发技巧](http://allluckly.cf/) <br>

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
