//
//  FMSegmentControl.h
//  FMSegmentControl
//
//  Created by fm on 2017/5/19.
//  Copyright © 2017年 wangjiuyin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FMSegmentControl;
@protocol FMSegmentControlDelegate <NSObject>

- (void)segmentedControl:(FMSegmentControl *)segment didSeletedItemAtIndex:(NSInteger)index;

@end

@interface FMSegmentControl : UIControl

- (instancetype)initWithItems:(NSArray *)items;

@property (nonatomic, weak) id<FMSegmentControlDelegate> delegate;

@property (nonatomic, assign) NSInteger currentIndex;

@property (nonatomic, strong) NSArray *items;

- (void)scrollToIndex:(NSInteger)index;

- (void)scrollByProgress:(CGFloat)progress;  // 0.0 - index.progress  if you want to scroll to index 2, set progress 0.0 - 2.0;

@end
