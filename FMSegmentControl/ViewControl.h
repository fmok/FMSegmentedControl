//
//  ViewControl.h
//  FMSegmentControl
//
//  Created by fm on 2017/5/19.
//  Copyright © 2017年 wangjiuyin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"

@interface ViewControl : NSObject<
    FMSegmentControlDelegate,
    SwipeViewDelegate,
    SwipeViewDataSource>

@property (nonatomic, weak) ViewController *vc;

@end
