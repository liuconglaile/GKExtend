//
//  UIScrollView+GKRefresh.m
//  xmzmobile_0.0.1
//
//  Created by 凯旋 郭 on 2/24/16.
//  Copyright © 2016 caoxiaobo. All rights reserved.
//

#import "UIScrollView+GKRefresh.h"

@implementation UIScrollView (GKRefresh)

- (void)addRefreshHeader:(MJRefreshHeader *)headerView
{
    self.mj_header = headerView;
}

- (void)addRefreshFooter:(MJRefreshFooter *)footerView
{
    self.mj_footer = footerView;
}

- (void)headerBeginRefreshing
{
    if (!self.mj_header.isRefreshing) {
        [self.mj_header beginRefreshing];
    }
}

- (void)footerBeginRefreshing
{
    if (!self.mj_footer.isRefreshing) {
        [self.mj_footer beginRefreshing];
    }
}

- (void)endAllRefreshWithFooterEnd:(NSInteger)isEnd
{
    [self.mj_header endRefreshing];
    [self.mj_footer endRefreshing];
    
    if (isEnd != 0) [self.mj_footer endRefreshingWithNoMoreData];
}

- (void)endFooterRefreshWithEnd:(NSInteger)isEnd
{
    [self.mj_footer endRefreshing];
    
    if (isEnd != 0) [self.mj_footer endRefreshingWithNoMoreData];
}


@end
