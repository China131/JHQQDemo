//
//  JHMainLeftView.m
//  QQDemo
//
//  Created by 简豪 on 16/7/18.
//  Copyright © 2016年 codingMan. All rights reserved.
//

#import "JHMainLeftView.h"

@interface JHMainLeftView ()<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic,strong)NSArray * titleArr;
@property (nonatomic,strong)NSArray * imageArr;


@end

@implementation JHMainLeftView


-(instancetype)init{
    
    if (self = [super init]) {
        [self configBaseView];
    }
    return self;
}


-(instancetype)initWithFrame:(CGRect)frame{
    
    
    if (self = [super initWithFrame:frame]) {
        [self configBaseView];
    }
    return self;
}




#pragma mark---------------------->基本视图构建
- (void)configBaseView{
    self.backgroundColor = [UIColor colorWithRed:243/256.0 green:243/256.0 blue:243/256.0 alpha:1];
    self.frame = CGRectMake(0, 0, KIOS_WIDTH * 3.0/ 4.0  , KIOS_HEIGHT);
    UIImageView *bgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 30, self.frame.size.width, self.frame.size.width / 620.0 * 537.0)];
    bgView.image = [UIImage imageNamed:@"sidebar_bg.jpg"];
    bgView.contentMode = UIViewContentModeScaleToFill;
    [self addSubview:bgView];
    
    UIImageView *headImg = [[UIImageView alloc] initWithFrame:CGRectMake(20, 70, 50, 50)];
    headImg.layer.cornerRadius = 25;
    headImg.layer.masksToBounds = YES;
    headImg.layer.borderWidth = 2.0;
    headImg.layer.borderColor = [UIColor whiteColor].CGColor;
    headImg.image = [UIImage imageNamed:@"headimg.jpg"];
    [self addSubview:headImg];
    
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(headImg.frame)+5, CGRectGetMinY(headImg.frame)+5, CGRectGetWidth(self.frame) - CGRectGetMaxX(headImg.frame) - 5, 20)];
    nameLabel.text = @"Creepin up on you";
    nameLabel.font = [UIFont systemFontOfSize:17 weight:0.3];
    [self addSubview:nameLabel];
    
    UIButton *codeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [codeBtn setImage:[UIImage imageNamed:@"code"] forState:UIControlStateNormal];
    codeBtn.frame = CGRectMake(CGRectGetWidth(self.frame)-40, CGRectGetMinY(headImg.frame), 25, 25);
    [self addSubview:codeBtn];
    
    UIView *bottomBgView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(bgView.frame) - 10, CGRectGetWidth(self.frame), KIOS_HEIGHT - CGRectGetMaxY(bgView.frame) +10)];
    
    bottomBgView.backgroundColor = [UIColor colorWithRed:11/256.0 green:185.0/256.0 blue:246/256.0 alpha:1];
    [self addSubview:bottomBgView];
    
    
    _titleArr = @[@"我的超级会员",@"QQ钱包",@"个性装扮",@"我的收藏",@"我的相册",@"我的文件",@"我的名片夹"];
//    _imageArr = @[@"",@"",@"",@"",@"",@"",@""];
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(30, CGRectGetMaxY(bgView.frame)-80, CGRectGetWidth(self.frame)-30, CGRectGetHeight(self.frame))];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.backgroundColor  = [UIColor clearColor];
    tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self addSubview:tableView];
    
}










- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return _titleArr.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 45;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = _titleArr[indexPath.row];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.backgroundColor = [UIColor clearColor];
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.textLabel.font = [UIFont systemFontOfSize:16];
    return cell;
}



















@end
