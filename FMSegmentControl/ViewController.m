//
//  ViewController.m
//  FMSegmentControl
//
//  Created by fm on 2017/5/19.
//  Copyright © 2017年 wangjiuyin. All rights reserved.
//

#import "ViewController.h"
#import "ViewControl.h"

@interface ViewController ()

@property (nonatomic, strong) ViewControl *control;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    [self combineView];
    [self customNav];
    [self customSwipe];
    [self.cascadeView loadData];
}

#pragma mark - Private methods
- (void)customNav
{
    self.navigationItem.titleView = self.segmentControl;
    self.segmentControl.items = @[@"呵呵", @"哈哈", @"嘿嘿"];
}

- (void)customSwipe
{
    __weak typeof(self) weakSelf = self;
    [self.view addSubview:self.swipeView];
    [self.swipeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view);
    }];
}

- (void)combineView
{
    [self.ViewArr addObject:self.cascadeView];
    for (NSInteger i = 1; i < 3; i++) {
        UIView *view = [[UIView alloc] init];
        view.tag = 100+i;
        view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.f green:arc4random_uniform(255)/255.f blue:arc4random_uniform(255)/255.f alpha:1];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
        label.text = [NSString stringWithFormat:@"*** %@ ***", @(i+1)];
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:30.f];
        label.textAlignment = NSTextAlignmentCenter;
        [view addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(view);
            make.size.mas_equalTo(CGSizeMake(200, 100));
        }];
        [self.ViewArr addObject:view];
    }
}

#pragma mark - getter & setter
- (ViewControl *)control
{
    if (!_control) {
        _control = [[ViewControl alloc] init];
        _control.vc = self;
    }
    return _control;
}

- (FMSegmentControl *)segmentControl
{
    if (!_segmentControl) {
        _segmentControl = [[FMSegmentControl alloc] initWithFrame:CGRectMake(0, 0, 240, 30)];
        _segmentControl.delegate = self.control;
    }
    return _segmentControl;
}

- (SwipeView *)swipeView
{
    if (!_swipeView) {
        _swipeView = [[SwipeView alloc] initWithFrame:CGRectZero];
        _swipeView.delegate = self.control;
        _swipeView.dataSource = self.control;
    }
    return _swipeView;
}

- (NSMutableArray *)ViewArr
{
    if (!_ViewArr) {
        _ViewArr = [[NSMutableArray alloc] init];
    }
    return _ViewArr;
}

- (FMCascadeView *)cascadeView
{
    if (!_cascadeView) {
        _cascadeView = [[FMCascadeView alloc] initWithFrame:CGRectZero];
        _cascadeView.backgroundColor = [UIColor yellowColor];
    }
    return _cascadeView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
