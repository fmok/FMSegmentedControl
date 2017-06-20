//
//  LeftControl.m
//  FMSegmentControl
//
//  Created by fm on 2017/6/20.
//  Copyright © 2017年 wangjiuyin. All rights reserved.
//

#import "LeftControl.h"

NSString *const LeftCellIdentifier = @"LeftCell";

@implementation LeftControl

#pragma mark - Public methods
- (void)registerCell
{
    [self.cascadeView.leftTableView registerClass:[LeftCell class] forCellReuseIdentifier:LeftCellIdentifier];
}

- (void)loadData
{
    
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"did selected at : %@ - %@", @(indexPath.section), @(indexPath.row));
    NSIndexPath *index = [NSIndexPath indexPathForRow:0 inSection:indexPath.row];
    [self.cascadeView.rightTableView scrollToRowAtIndexPath:index atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LeftCell *cell = [tableView dequeueReusableCellWithIdentifier:LeftCellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"* sec %@ *", @(indexPath.row)];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


@end
