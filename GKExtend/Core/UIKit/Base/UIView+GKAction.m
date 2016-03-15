//
//  UIView+GKAction.m
//  xmzmobile_0.0.1
//
//  Created by 凯旋 郭 on 2/24/16.
//  Copyright © 2016 caoxiaobo. All rights reserved.
//

#import "UIView+GKAction.h"
#import <objc/runtime.h>

static const char kBlock = '\0';

@implementation UIView (GKAction)

- (void)tapPeformBlock:(void(^)())block
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self addGestureRecognizer:tap];
    [self setBlock:block];
}

- (void)tap:(UITapGestureRecognizer *)tap
{
    void(^voidBlock)() = [self block];
    if (voidBlock) {
        voidBlock();
    }
}

- (void)setBlock:(void(^)())block
{
    if (block) {
        objc_setAssociatedObject(self, &kBlock, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
}

- (void(^)())block
{
    return objc_getAssociatedObject(self, &kBlock);
}


@end
