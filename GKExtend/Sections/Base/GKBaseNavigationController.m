//
//  GKBaseNavigationController.m
//  xmzmobile_0.0.1
//
//  Created by 凯旋 郭 on 2/25/16.
//  Copyright © 2016 凯旋 郭. All rights reserved.
//

#import "GKBaseNavigationController.h"

@implementation GKBaseNavigationController

-(void)viewUnload {
    
}
-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_6_0
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 6.0f) {
        if (self.isViewLoaded && !self.view.window) {
            self.view = nil;
            [self viewUnload];
        }
    }
#endif
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

+(id) getInstance {
    GKBaseNavigationController *instance = [[GKBaseNavigationController alloc] init];
    return instance;
}
+(id) getInstance:(UIViewController*) rootViewController {
    if (rootViewController) {
        GKBaseNavigationController *instance = [[GKBaseNavigationController alloc] initWithRootViewController:rootViewController];
        return instance;
    }
    return [GKBaseNavigationController getInstance];
}

@end
