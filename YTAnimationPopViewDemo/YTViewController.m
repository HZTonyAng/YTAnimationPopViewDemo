//
//  YTViewController.m
//  YTAnimationPopViewDemo
//
//  Created by TonyAng on 2017/7/18.
//  Copyright © 2017年 TonyAng. All rights reserved.
//

#import "YTViewController.h"
#import "HWPopTool.h"

@interface YTViewController ()
@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) UIButton *popBtn;
@end

@implementation YTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 200, 100, 50);
    btn.backgroundColor = [UIColor greenColor];
    [btn addTarget:self action:@selector(popViewShow) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 300)];
    _contentView.backgroundColor = [UIColor clearColor];
    
    _popBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _popBtn.frame = CGRectMake(0, 250, 200, 50);
    _popBtn.backgroundColor = [UIColor greenColor];
    [_popBtn addTarget:self action:@selector(closeAndBack) forControlEvents:UIControlEventTouchUpInside];
    [_popBtn setTitle:@"关闭" forState:UIControlStateNormal];
    [_popBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
}

- (void)popViewShow {
    UIImageView *imageV = [[UIImageView alloc]initWithFrame:_contentView.bounds];
    imageV.image = [UIImage imageNamed:@"jei"];
    imageV.backgroundColor = [UIColor redColor];
    [_contentView addSubview:imageV];
    //    看看pop效果把下面这一句加上
    [_contentView addSubview:_popBtn];
    
    [HWPopTool sharedInstance].shadeBackgroundType = ShadeBackgroundTypeSolid;
    [HWPopTool sharedInstance].closeButtonType = ButtonPositionTypeRight;
    [[HWPopTool sharedInstance] showWithPresentView:_contentView animated:YES];
    
}

- (void)closeAndBack {
    [[HWPopTool sharedInstance] closeWithBlcok:^{
        [self.navigationController popViewControllerAnimated:YES];
        
    }];
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
