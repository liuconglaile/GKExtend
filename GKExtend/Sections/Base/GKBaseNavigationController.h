//
//  GKBaseNavigationController.h
//  xmzmobile_0.0.1
//
//  Created by 凯旋 郭 on 2/25/16.
//  Copyright © 2016 凯旋 郭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GKBaseNavigationController : UINavigationController

+(id) getInstance;
+(id) getInstance:(UIViewController*) rootViewController;
-(void)viewUnload;

@end
