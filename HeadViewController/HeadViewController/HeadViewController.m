//
//  HeadViewController.m
//  HeadViewController
//
//  Created by lishaopeng on 16/11/25.
//  Copyright © 2016年 lishaopeng. All rights reserved.
//

#import "HeadViewController.h"
#import "UINavigationController+CLObjcSugar.h"
#import "HeadViewController.h"
#import "UIView+Extension.h"
#import "YYWebImage.h"
#import "ViewController2.h"
#import "UIColor+CLObjcSugar.h"
NSString *const cellId = @"cellId";
#define headHeight 200
@interface HeadViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UIView *_headView;
    UIImageView *_imageView;
    UIView *_lineView;
}
@end

@implementation HeadViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self createTablew];
   
    [self createHeadView];
   
}
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
-(void)createTablew
{
    UITableView *table = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [table registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId];
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];
    table.contentInset = UIEdgeInsetsMake(headHeight, 0, 0, 0);
    table.scrollIndicatorInsets = UIEdgeInsetsMake(headHeight, 0, 0, 0);
}
-(void)createHeadView
{
    _headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, headHeight)];
    //投机取个巧 让其颜色和导航栏颜色一样
    _headView.backgroundColor = [UIColor cl_colorWithHex:0xf8f8f8];
    [self.view addSubview:_headView];

    _imageView = [[UIImageView alloc]initWithFrame:_headView.bounds];
    _headView.contentMode = UIViewContentModeScaleAspectFill;
    _headView.clipsToBounds = YES;
    [_imageView yy_setImageWithURL:[NSURL URLWithString:@"http://img2.niutuku.com/desk/1207/1100/bizhi-1100-17337.jpg"] options:YYWebImageOptionShowNetworkActivity];
    [_headView addSubview:_imageView];
    
    _lineView = [[UIView alloc]initWithFrame:CGRectMake(0, headHeight - (1 / [UIScreen mainScreen].scale), _headView.width, 1 / [UIScreen mainScreen].scale)];
    _lineView.backgroundColor = [UIColor lightGrayColor];
    [_headView addSubview:_lineView];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    cell.textLabel.text = @(indexPath.row).stringValue;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ViewController2 *VC = [[ViewController2 alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offset = scrollView.contentOffset.y + scrollView.contentInset.top;
    if (offset <= 0) {
        _headView.y = 0;
        _headView.height = headHeight - offset;
        _imageView.height = _headView.height;
        _imageView.alpha = 1.0;
    }else{
        _headView.height = headHeight;
        _imageView.height = _headView.height;
        CGFloat min = headHeight - 64;
        _headView.y = -MIN(min, offset);
        _imageView.alpha = 1 - (offset / min);
    }
    
    _lineView.y = _headView.height - _lineView.height;
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
