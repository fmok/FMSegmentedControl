//
//  ViewControl.m
//  FMSegmentControl
//
//  Created by fm on 2017/5/19.
//  Copyright © 2017年 wangjiuyin. All rights reserved.
//

#import "ViewControl.h"

@implementation ViewControl

#pragma mark - FMSegmentControlDelegate
- (void)segmentedControl:(FMSegmentControl *)segment didSeletedItemAtIndex:(NSInteger)index
{
    [self.vc.swipeView scrollToItemAtIndex:index duration:0];
}

#pragma mark - SwipeViewDataSource
- (NSInteger)numberOfItemsInSwipeView:(SwipeView *)swipeView
{
    return 3;
}

- (UIView *)swipeView:(SwipeView *)swipeView viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    UIView *v = self.vc.ViewArr[index];
    return v;
}

#pragma mark - SwipeViewDelegate
- (CGSize)swipeViewItemSize:(SwipeView *)swipeView
{
    return CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64.f);
}

- (void)swipeViewDidScroll:(SwipeView *)swipeView
{
    [self.vc.segmentControl scrollByProgress:swipeView.scrollOffset];
}

- (void)swipeViewCurrentItemIndexDidChange:(SwipeView *)swipeView
{
    
}

- (void)swipeViewWillBeginDragging:(SwipeView *)swipeView
{
    
}

- (void)swipeViewDidEndDragging:(SwipeView *)swipeView willDecelerate:(BOOL)decelerate
{
    
}

- (void)swipeViewWillBeginDecelerating:(SwipeView *)swipeView
{
    
}

- (void)swipeViewDidEndDecelerating:(SwipeView *)swipeView
{
    
}

- (void)swipeViewDidEndScrollingAnimation:(SwipeView *)swipeView
{
    
}

- (BOOL)swipeView:(SwipeView *)swipeView shouldSelectItemAtIndex:(NSInteger)index
{
    return YES;
}

- (void)swipeView:(SwipeView *)swipeView didSelectItemAtIndex:(NSInteger)index
{
    
}

@end
