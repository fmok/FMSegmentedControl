//
//  FMSizeNumMacro.h
//  Sample
//
//  Created by wjy on 2018/3/29.
//  Copyright © 2018年 wjy. All rights reserved.
//

#ifndef FMSizeNumMacro_h
#define FMSizeNumMacro_h

#define IS_IPHONEX                          (([[UIScreen mainScreen] bounds].size.height-812)?NO:YES)

// navBar
#define kNavBarAndStateHeight  ((IS_IPHONEX) ? 88.f :64.f)

// tabBar
#define kTabBarHeight ((IS_IPHONEX) ? (49.f+44.f) :49.f)


#endif /* FMSizeNumMacro_h */
