//
//  ViewController.h
//  FMSegmentControl
//
//  Created by fm on 2017/5/19.
//  Copyright © 2017年 wangjiuyin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMCascadeView.h"

#define SECTION_COUNT 10

@interface ViewController : UIViewController

@property (nonatomic, strong) FMSegmentControl *segmentControl;
@property (nonatomic, strong) SwipeView *swipeView;
@property (nonatomic, strong) NSMutableArray *ViewArr;
@property (nonatomic, strong) FMCascadeView *cascadeView;

@end

