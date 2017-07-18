//
//  ViewController.m
//  YTAnimationPopViewDemo
//
//  Created by TonyAng on 2017/7/18.
//  Copyright © 2017年 TonyAng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIButton *btn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"YTAnimationPopViewDemo";
    self.view.backgroundColor = [UIColor whiteColor];
    [self createYTAnimationPopView];
}

-(void)createYTAnimationPopView{
    self.btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:self.btn];
    self.btn.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
    self.btn.frame = CGRectMake(0, 0, 120, 120);
    self.btn.center = self.view.center;
    [self.btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
}

-(void)btnAction{
    NSLog(@"跳");
    Class class = NSClassFromString(@"YTViewController");
    if (class) {
        UIViewController *vc = [class new];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
