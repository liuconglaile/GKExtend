//
//  UIImageView+GKExtend.m
//  xmzmobile_0.0.1
//
//  Created by 凯旋 郭 on 2/24/16.
//  Copyright © 2016 caoxiaobo. All rights reserved.
//

#import "UIImageView+GKExtend.h"
#import "NSObject+GKExtend.h"

@implementation UIImageView (GKExtend)

- (void)safeSetImageWithURL:(NSString *)url placeholder:(UIImage *)image
{
    if (url.isNoEmpty) {
        NSURL *imageURL = [NSURL URLWithString:url];
        BOOL isCached = [[SDWebImageManager sharedManager] cachedImageExistsForURL:imageURL];
        if (isCached) {
            NSString *key = [[SDWebImageManager sharedManager] cacheKeyForURL:imageURL];
            self.image = [[SDWebImageManager sharedManager].imageCache imageFromDiskCacheForKey:key];
        }else {
            [self sd_setImageWithURL:imageURL placeholderImage:image];
        }
        
    }else {
        self.image = image;
    }
}
@end
