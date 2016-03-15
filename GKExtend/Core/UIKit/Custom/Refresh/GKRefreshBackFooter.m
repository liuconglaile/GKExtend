//
//  GKRefreshBackFooter.m
//  xmzmobile_0.0.1
//
//  Created by 凯旋 郭 on 2/24/16.
//  Copyright © 2016 caoxiaobo. All rights reserved.
//

#import "GKRefreshBackFooter.h"
#import "UIView+GKExtend.h"
#import "GKCircleView.h"
#import "UIColor+GKExtend.h"

@interface GKRefreshBackFooter ()

@property(nonatomic, weak) GKCircleView *circleView;
@property(nonatomic, weak) UILabel *noDataLabel;

@end

@implementation GKRefreshBackFooter

#pragma mark - 重写方法
#pragma mark 在这里做一些初始化配置（比如添加子控件）
- (void)prepare
{
    [super prepare];
    // 设置控件的高度
    self.mj_h = 50;
    
    GKCircleView *circleView = [[GKCircleView alloc] init];
    [self addSubview:circleView];
    self.circleView = circleView;
    
    UILabel *noDataLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    noDataLabel.text = @"已经全部加载完毕";
    noDataLabel.textColor = RGB(90, 90, 90);
    noDataLabel.textAlignment = NSTextAlignmentCenter;
    noDataLabel.font = [UIFont boldSystemFontOfSize:14];
    noDataLabel.backgroundColor = [UIColor clearColor];
    noDataLabel.hidden = YES;
    [self addSubview:noDataLabel];
    self.noDataLabel = noDataLabel;
}

#pragma mark 在这里设置子控件的位置和尺寸
- (void)placeSubviews
{
    [super placeSubviews];
    
    self.circleView.mj_size = CGSizeMake(30, 30);
    [self.circleView alignCenter];
    
    self.noDataLabel.frame = self.bounds;
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
//1.MJRefreshStateIdle->2.MJRefreshStatePulling->3.MJRefreshStateRefreshing
#pragma mark 监听控件的刷新状态
- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState;
    switch (state) {
        case MJRefreshStateNoMoreData:
            self.noDataLabel.hidden = NO;
            //            NSLog(@"MJRefreshStateNoMoreData");
            break;
        case MJRefreshStateIdle:
            self.noDataLabel.hidden = YES;
            
            if (oldState == MJRefreshStatePulling) return;
            self.circleView.progress = 0;
            [self.circleView setNeedsDisplay];
            [self.circleView.layer removeAnimationForKey:@"rotateAnimation"];
            //            NSLog(@"MJRefreshStateIdle");
            break;
        case MJRefreshStatePulling:
            self.circleView.progress = 1;
            [self.circleView setNeedsDisplay];
            //            NSLog(@"MJRefreshStatePulling");
            break;
        case MJRefreshStateRefreshing:
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
            //            NSLog(@"MJRefreshStateRefreshing");
            break;
    }
}

#pragma mark 监听拖拽比例（控件被拖出来的比例）
- (void)setPullingPercent:(CGFloat)pullingPercent
{
    [super setPullingPercent:pullingPercent];
    //    NSLog(@"%f",pullingPercent);
    if (pullingPercent>1.0 || !self.noDataLabel.hidden) return;
    
    self.circleView.progress = pullingPercent;
    [self.circleView setNeedsDisplay];
}

@end
