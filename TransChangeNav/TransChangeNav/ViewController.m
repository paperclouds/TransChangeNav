//
//  ViewController.m
//  TransChangeNav
//
//  Created by paperclouds on 2018/5/29.
//  Copyright © 2018年 hechang. All rights reserved.
//

#import "ViewController.h"

#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height
#define headerHeight 200

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UIView *navView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIButton *rightBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"FaceQ"]];
    imageView.frame = CGRectMake(0, 0, kScreenWidth, kScreenWidth);
    [self.view addSubview:imageView];
    
    self.navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 64)];
    self.navView.backgroundColor = [[UIColor grayColor]colorWithAlphaComponent:0];
    [self.view addSubview:self.navView];
    
    self.rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth-64, 20, 44, 44)];
    [self.rightBtn setTitle:@"测试" forState:UIControlStateNormal];
    [self.rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.rightBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.navView addSubview:self.rightBtn];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-64) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, headerHeight)];
    headView.backgroundColor = [UIColor clearColor];
    self.tableView.tableHeaderView = headView;
}

#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    return cell;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY < headerHeight) {
        self.navView.backgroundColor = [[UIColor grayColor]colorWithAlphaComponent:offsetY/headerHeight];
        [self.rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }else{
        self.navView.backgroundColor = [UIColor grayColor];
        [self.rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
