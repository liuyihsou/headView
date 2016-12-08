//
//  ViewController.m
//  HeadViewController
//
//  Created by lishaopeng on 16/11/25.
//  Copyright © 2016年 lishaopeng. All rights reserved.
//

#import "ViewController.h"
#import "HeadViewController.h"
#import "UIColor+CLObjcSugar.h"
@interface ViewController ()

@end

@implementation ViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = [UIColor cl_colorWithHex:0xf8f8f8];
}

- (IBAction)clickBtn:(id)sender {
    HeadViewController *head = [[HeadViewController alloc]init];
    [self.navigationController pushViewController:head animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
