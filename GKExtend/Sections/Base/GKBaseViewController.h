//
//  GKBaseViewController.h
//  xmzmobile_0.0.1
//
//  Created by 凯旋 郭 on 2/25/16.
//  Copyright © 2016 凯旋 郭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GKBaseViewController : UIViewController
/**
  上次更新时间  用于hud控制  防止每次都出现影响美观   主要要用于 4个主页面
 */
@property (nonatomic, assign) NSTimeInterval updateTime;

/**
  显示hud
 */
- (void)showHudWithMsg:(NSString *)msg;
- (void)showHudSucceed:(NSString*)msg;
- (void)showHudError:(NSString *)msg;
- (void)showHudWarn:(NSString *)msg;
- (void)showHudLoadingWithNoBG;
- (void)showHudWithUpdateTime;
- (void)showHudLoading;
- (void)hideHud;

@end
