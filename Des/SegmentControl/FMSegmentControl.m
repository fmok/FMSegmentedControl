//
//  FMSegmentControl.m
//  FMSegmentControl
//
//  Created by fm on 2017/5/19.
//  Copyright © 2017年 wangjiuyin. All rights reserved.
//

#import "FMSegmentControl.h"

#define kFontTitleLabel [UIFont systemFontOfSize:14.0]
#define kFontColorTitleNormal [UIColor blueColor]
#define kFontColorTitleSelected [UIColor whiteColor]

@interface FMMaskView : UIView

@property (nonatomic, strong) CAShapeLayer *maskView;
@end

@implementation FMMaskView

- (CAShapeLayer *)maskView
{
    if (!_maskView) {
        _maskView = [[CAShapeLayer alloc] init];
    }
    return _maskView;
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    self.maskView.path = [UIBezierPath bezierPathWithRect:frame].CGPath;
}
@end

@interface FMSegmentControl()

@property (nonatomic, strong) FMMaskView *indicatorView;
@property (nonatomic, strong) UIView *titleLabelsView;
@property (nonatomic, strong) UIView *selectedTitlesLabelView;
@property (nonatomic, assign) CGRect firstItemFrame;

@end

@implementation FMSegmentControl

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (instancetype)initWithItems:(NSArray *)items
{
    self = [super init];
    if (self) {
        self.items = items;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.layer.cornerRadius = self.bounds.size.height * 0.5;
    self.layer.borderWidth = 1;
    self.layer.borderColor = kFontColorTitleNormal.CGColor;
    _titleLabelsView.frame = self.bounds;
    _selectedTitlesLabelView.frame = self.bounds;
    
    CGFloat width = CGRectGetWidth(self.bounds)/self.items.count;
    
    for (int i = 0; i < self.items.count; i ++) {
        _titleLabelsView.subviews[i].frame = CGRectMake(width * i, 0, width, CGRectGetHeight(self.bounds));
        _selectedTitlesLabelView.subviews[i].frame = CGRectMake(width * i, 0, width, CGRectGetHeight(self.bounds));
    }
    
    _indicatorView.frame = [self elementFrameAtIndex:self.currentIndex];
    _indicatorView.layer.cornerRadius = self.bounds.size.height * 0.5;
}

#pragma mark - Publice methods
- (void)scrollToIndex:(NSInteger)index
{
    if (self.currentIndex == index) {
        return;
    }
    [self moveIndicatorViewToIndex:index];
}

- (void)scrollByProgress:(CGFloat)progress
{
    [self moveIndicatorViewByProgress:progress];
}

#pragma mark - Private methods
- (void)setUp
{
    self.layer.masksToBounds = YES;
    
    [self addSubview:self.titleLabelsView];
    [self addSubview:self.indicatorView];
    
    [self addSubview:self.selectedTitlesLabelView];
    _selectedTitlesLabelView.layer.mask = self.indicatorView.maskView;
    
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self addGestureRecognizer:tapGR];
    
    UIPanGestureRecognizer *panGR = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [self addGestureRecognizer:panGR];
}

- (void)addLabels
{
    for (int i = 0; i < self.items.count; i ++) {
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.text = self.items[i];
        titleLabel.font = kFontTitleLabel;
        titleLabel.textColor = kFontColorTitleNormal;
        titleLabel.textAlignment = NSTextAlignmentCenter;
        [_titleLabelsView addSubview:titleLabel];
        
        UILabel *selectedTitleLabel = [[UILabel alloc] init];
        selectedTitleLabel.text = self.items[i];
        selectedTitleLabel.font = kFontTitleLabel;
        selectedTitleLabel.textColor = kFontColorTitleSelected;
        selectedTitleLabel.textAlignment = NSTextAlignmentCenter;
        [_selectedTitlesLabelView addSubview:selectedTitleLabel];
    }
    [self setNeedsLayout];
}

- (CGRect)elementFrameAtIndex:(NSInteger)index
{
    return ((UILabel *)self.titleLabels[index]).frame;
}

- (NSInteger)nearestElementIndex:(CGPoint)postion
{
    NSArray *temp = self.titleLabelsView.subviews;
    postion.y = self.frame.size.height * 0.5;
    for (int i = 0; i < temp.count; i ++) {
        UIView *view = temp[i];
        CGRect frame = view.frame;
        if (CGRectContainsPoint(frame, postion)) {
            return i;
        }
    }
    return 0;
}

- (void)moveIndicatorViewToIndex:(NSInteger)index
{
    _currentIndex = index;
    if (self.delegate && [self.delegate respondsToSelector:@selector(segmentedControl:didSeletedItemAtIndex:)]) {
        [self.delegate segmentedControl:self didSeletedItemAtIndex:index];
    }
    [self moveIndicatorView];
}

- (void)moveIndicatorViewByProgress:(CGFloat)progress
{
    self.currentIndex = (int)progress;
    CGRect frame = self.firstItemFrame;
    CGFloat width = CGRectGetWidth(self.bounds)/self.items.count;
    frame.origin.x += width * progress;
    self.indicatorView.frame = frame;
}

- (void)moveIndicatorView
{
    self.indicatorView.frame = ((UILabel *)self.titleLabels[self.currentIndex]).frame;
    [self layoutIfNeeded];
}

#pragma mark - Action handlers
- (void)handleTap:(UITapGestureRecognizer *)gestureRecognizer
{
    CGPoint loaction = [gestureRecognizer locationInView:self];
    NSInteger index = [self nearestElementIndex:loaction];
    [self moveIndicatorViewToIndex:index];
}

- (void)handlePan:(UIPanGestureRecognizer *)gestureRecognizer
{
    
}

#pragma mark - getter & setter
- (CGRect)firstItemFrame
{
    return [self.titleLabels[0] frame];
}

- (void)setItems:(NSArray *)items
{
    _items = items;
    [self addLabels];
}

- (void)setCurrentIndex:(NSInteger)currentIndex
{
    _currentIndex = currentIndex;
    [self moveIndicatorView];
}

- (UIView *)titleLabelsView
{
    if (!_titleLabelsView) {
        _titleLabelsView = [[UIView alloc] init];
    }
    return _titleLabelsView;
}

- (NSArray *)titleLabels
{
    return self.titleLabelsView.subviews;
}

- (UIView *)selectedTitlesLabelView
{
    if (!_selectedTitlesLabelView) {
        _selectedTitlesLabelView = [[UIView alloc] init];
    }
    return _selectedTitlesLabelView;
}

- (FMMaskView *)indicatorView
{
    if (!_indicatorView) {
        _indicatorView = [[FMMaskView alloc] init];
        _indicatorView.backgroundColor = kFontColorTitleNormal;
        _indicatorView.layer.masksToBounds = YES;
    }
    return _indicatorView;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
