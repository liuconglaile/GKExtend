//
//  GKBaseViewController.m
//  xmzmobile_0.0.1
//
//  Created by 凯旋 郭 on 2/25/16.
//  Copyright © 2016 凯旋 郭. All rights reserved.
//

#import "GKBaseViewController.h"
#import "SVProgressHUD.h"

#define kNavImageTag 999
#define kNavDefColor [UIColor whiteColor]
#define kHUDBgColor [UIColor colorWithRed:.2 green:.2 blue:.2 alpha:.8]
#define kUpdateDifference 3600

@implementation GKBaseViewController

- (void)showHudWithMsg:(NSString *)msg{
    
    self.view.userInteractionEnabled = YES;
    [SVProgressHUD setBackgroundColor:kHUDBgColor];
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    [SVProgressHUD showWithStatus:msg];
}


- (void)showHudSucceed:(NSString*)msg{
    
    self.view.userInteractionEnabled = YES;
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    [SVProgressHUD setBackgroundColor:kHUDBgColor];
    [SVProgressHUD showSuccessWithStatus:msg];
    
    
}


- (void)showHudError:(NSString *)msg{
    
    self.view.userInteractionEnabled = YES;
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    [SVProgressHUD setBackgroundColor:kHUDBgColor];
    [SVProgressHUD showErrorWithStatus:msg];
    
    
}

- (void)showHudWarn:(NSString *)msg{
    self.view.userInteractionEnabled = YES;
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    [SVProgressHUD setBackgroundColor:kHUDBgColor];
    [SVProgressHUD showInfoWithStatus:msg];
}


- (void)showHudLoading{
    
    if ([SVProgressHUD isVisible]) {
        return;
    }
    
    //self.view.userInteractionEnabled = NO;
    [SVProgressHUD setBackgroundColor:kHUDBgColor];
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    [SVProgressHUD show];
}


- (void)showHudLoadingWithNoBG{
    if ([SVProgressHUD isVisible]) {
        return;
    }
    //self.view.userInteractionEnabled = NO;
    
    [SVProgressHUD setBackgroundColor:kHUDBgColor];
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    [SVProgressHUD show];
}


- (void)showHudWithUpdateTime{
    
    
    if ([SVProgressHUD isVisible]) {
        return;
    }
    
    NSTimeInterval t = [[NSDate date] timeIntervalSince1970];
    NSTimeInterval d = t - self.updateTime;
    if (d < kUpdateDifference) {
        return;
    }
    
    [SVProgressHUD setBackgroundColor:kHUDBgColor];
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    [SVProgressHUD show];
}


- (void)hideHud{
    self.view.userInteractionEnabled = YES;
    [SVProgressHUD dismiss];
}


@end
