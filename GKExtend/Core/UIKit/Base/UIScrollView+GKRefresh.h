//
//  UIScrollView+GKRefresh.h
//  xmzmobile_0.0.1
//
//  Created by 凯旋 郭 on 2/24/16.
//  Copyright © 2016 caoxiaobo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GKRefreshHeaderView.h"
#import "GKRefreshBackFooter.h"
#import "GKRefreshAutoFooter.h"

@interface UIScrollView (GKRefresh)

//增加刷新组件
- (void)addRefreshHeader:(MJRefreshHeader *)headerView;
- (void)addRefreshFooter:(MJRefreshFooter *)footerView;

//触发刷新
- (void)headerBeginRefreshing;
- (void)footerBeginRefreshing;

//结束刷新 1YES 0NO
- (void)endAllRefreshWithFooterEnd:(NSInteger)isEnd;
- (void)endFooterRefreshWithEnd:(NSInteger)isEnd;


@end
