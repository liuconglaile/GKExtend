//
//  UIImageView+GKExtend.h
//  xmzmobile_0.0.1
//
//  Created by 凯旋 郭 on 2/24/16.
//  Copyright © 2016 caoxiaobo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"

@interface UIImageView (GKExtend)

/*@Description:
 1.无url则直接设置为image
 2.老图片:若本地已经有图片，则直接从本地加载.
 3.新图片:设置占位，从远处加载
 */
- (void)safeSetImageWithURL:(NSString *)url placeholder:(UIImage *)image;


@end
