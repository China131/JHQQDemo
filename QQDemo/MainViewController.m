//
//  MainViewController.m
//  QQDemo
//
//  Created by 简豪 on 16/7/18.
//  Copyright © 2016年 codingMan. All rights reserved.
//

#import "MainViewController.h"
#import "JHMainLeftView.h"
@interface MainViewController ()<UIScrollViewDelegate>

@property (nonatomic,strong)UIScrollView *scrollView;
@property (nonatomic,strong)JHMainLeftView * leftView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configBaseView];
    // Do any additional setup after loading the view.
}



- (void)configBaseView{
    _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    _scrollView.contentSize = CGSizeMake(KIOS_WIDTH+KIOS_WIDTH/4*3, KIOS_HEIGHT);
    _scrollView.bounces = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    [self.view addSubview:_scrollView];
    
    
    JHMainLeftView *leftView = [[JHMainLeftView alloc] initWithFrame:CGRectMake(0, 0,KIOS_WIDTH *535.0/640.0, KIOS_HEIGHT)];
//    leftView.backgroundColor = [UIColor whiteColor];
    _leftView = leftView;
    [self.view addSubview:leftView];
    
     [self.view addSubview:_scrollView];
    UIView *centerView = [[UIView alloc] initWithFrame:CGRectMake( CGRectGetWidth(leftView.frame), 0, KIOS_WIDTH, KIOS_HEIGHT)];
    centerView.backgroundColor = [UIColor blueColor];
    [_scrollView addSubview:centerView];
    [_scrollView setContentOffset:CGPointMake(CGRectGetWidth(leftView.frame), 0) animated:NO];
    
}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    
    if (scrollView.contentOffset.x<=KIOS_WIDTH *535.0/640.0) {
        
        [self.view bringSubviewToFront:_leftView];
        
    }
    
    
    
}


//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    
//    UITouch *t = [touches anyObject];
//    CGPoint p = [t locationInView:self.view];
//    
//    if (p.x>=KIOS_WIDTH *535.0/640.0) {
//        [self.view bringSubviewToFront:_scrollView];
//    }
//    
//}


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
