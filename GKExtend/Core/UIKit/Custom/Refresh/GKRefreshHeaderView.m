//
//  GKRefreshHeaderView.m
//  xmzmobile_0.0.1
//
//  Created by 凯旋 郭 on 2/24/16.
//  Copyright © 2016 caoxiaobo. All rights reserved.
//

#import "GKRefreshHeaderView.h"
#import "GKCircleView.h"
#import "UIView+GKExtend.h"

@interface GKRefreshHeaderView ()

@property(nonatomic, weak) GKCircleView *circleView;

@end

@implementation GKRefreshHeaderView

#pragma mark - 重写方法
#pragma mark 在这里做一些初始化配置（比如添加子控件）
- (void)prepare
{
    [super prepare];
    
    // 设置控件的高度,宽默认为屏宽
    self.mj_h = 50;
    
    GKCircleView *circleView = [[GKCircleView alloc] init];
    [self addSubview:circleView];
    self.circleView = circleView;
}

#pragma mark 在这里设置子控件的位置和尺寸
- (void)placeSubviews
{
    [super placeSubviews];
    
    self.circleView.mj_size = CGSizeMake(30, 30);
    [self.circleView alignCenter];
}

#pragma mark 监听scrollView的contentOffset改变
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change
{
    [super scrollViewContentOffsetDidChange:change];
    
}

#pragma mark 监听scrollView的contentSize改变
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change
{
    [super scrollViewContentSizeDidChange:change];
    
}

#pragma mark 监听scrollView的拖拽状态改变
- (void)scrollViewPanStateDidChange:(NSDictionary *)change
{
    [super scrollViewPanStateDidChange:change];
    
}

#pragma mark 监听控件的刷新状态
- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState;
    
    switch (state) {
        case MJRefreshStateIdle:    /** 普通闲置状态 */
            if (oldState == MJRefreshStatePulling) return;
            self.circleView.progress = 0;
            [self.circleView setNeedsDisplay];
            [self.circleView.layer removeAnimationForKey:@"rotateAnimation"];
            break;
        case MJRefreshStatePulling: /** 松开就可以进行刷新的状态 */
            self.circleView.progress = 1;
            [self.circleView setNeedsDisplay];
            break;
        case MJRefreshStateRefreshing:  /** 正在刷新中的状态 */
            //防止直接进入刷新状态
            self.circleView.progress = 1;
            [self.circleView setNeedsDisplay];
            
            [CATransaction begin];
            [CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions];
            [CATransaction commit];
            CABasicAnimation* rotate =  [CABasicAnimation animationWithKeyPath: @"transform.rotation.z"];
            rotate.removedOnCompletion = FALSE;
            rotate.fillMode = kCAFillModeForwards;
            [rotate setToValue: [NSNumber numberWithFloat: M_PI / 2]];
            rotate.repeatCount = HUGE_VALF;
            rotate.duration = 0.25;
            rotate.cumulative = TRUE;
            rotate.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
            [self.circleView.layer addAnimation:rotate forKey:@"rotateAnimation"];
            break;
    }
    
    //    MJRefreshStateWillRefresh 即将刷新的状态
    //    MJRefreshStateNoMoreData 所有数据加载完毕，没有更多的数据了
}

#pragma mark 监听拖拽比例（控件被拖出来的比例）
- (void)setPullingPercent:(CGFloat)pullingPercent   //下拉的回调
{
    [super setPullingPercent:pullingPercent];
    if (pullingPercent>1.0) return;
    
    self.circleView.progress = pullingPercent;
    [self.circleView setNeedsDisplay];
}


@end
