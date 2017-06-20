//
//  ViewControl.m
//  FMSegmentControl
//
//  Created by fm on 2017/5/19.
//  Copyright © 2017年 wangjiuyin. All rights reserved.
//

#import "ViewControl.h"

@implementation ViewControl

#pragma mark - FMCascadeViewDelegate
- (void)registerLeftCell:(UITableView * _Nullable)tableView identifier:(NSString * _Nullable)identifier
{
    [tableView registerClass:[LeftCell class] forCellReuseIdentifier:identifier];
}

- (CGFloat)fm_left_tableView:(UITableView * _Nullable)tableView heightForRowAtIndexPath:(NSIndexPath * _Nullable)indexPath
{
    return 40.f;
}

- (void)fm_left_tableView:(UITableView * _Nullable)tableView didSelectRowAtIndexPath:(NSIndexPath * _Nullable)indexPath
{
    
}

- (void)registerRightCell:(UITableView * _Nullable)tableView identifier:(NSString * _Nullable)identifier
{
    [tableView registerClass:[RightCell class] forCellReuseIdentifier:identifier];
}

- (CGFloat)fm_right_tableView:(UITableView * _Nullable)tableView heightForRowAtIndexPath:(NSIndexPath * _Nullable)indexPath
{
    return 80.f;
}

- (CGFloat)fm_right_tableView:(UITableView * _Nullable)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30.f;
}

- (void)fm_right_tableView:(UITableView * _Nullable)tableView didSelectRowAtIndexPath:(NSIndexPath * _Nullable)indexPath
{
    
}

#pragma mark - FMCascadeViewDataSource
- (NSInteger)fm_left_tableView:(UITableView * _Nullable)tableView numberOfRowsInSection:(NSInteger)section
{
    return SECTION_COUNT;
}

- (UITableViewCell * _Nullable)fm_left_tableView:(UITableView * _Nullable)tableView cellForRowAtIndexPath:(NSIndexPath * _Nullable)indexPath identifier:(NSString * _Nullable)identifier
{
    LeftCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"* sec %@ *", @(indexPath.row)];
    return cell;
}

- (NSInteger)fm_left_numberOfSectionsInTableView:(UITableView * _Nullable)tableView
{
    return 1;
}

- (NSInteger)fm_right_tableView:(UITableView * _Nullable)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell * _Nullable)fm_right_tableView:(UITableView * _Nullable)tableView cellForRowAtIndexPath:(NSIndexPath * _Nullable)indexPath identifier:(NSString * _Nullable)identifier
{
    RightCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"*** %@ - %@ ***", @(indexPath.section), @(indexPath.row)];
    return cell;
}

- (NSInteger)fm_right_numberOfSectionsInTableView:(UITableView * _Nullable)tableView
{
    return SECTION_COUNT;
}

- (NSString * _Nullable)fm_right_tableView:(UITableView * _Nullable)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"& sec %@ &", @(section)];
}

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
