//
//  DemoViewController.m
//  GKExtend
//
//  Created by 凯旋 郭 on 3/17/16.
//  Copyright © 2016 凯旋 郭. All rights reserved.
//

#import "DemoViewController.h"

#define TestUrl @"/default/appInterface/com.suremoov.appInterface.UserLogin.login.biz.ext"

@interface DemoViewController ()

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *testBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [testBtn setTitle:@"TryNetwork" forState:UIControlStateNormal];
    [testBtn addTarget:self action:@selector(tryNetwork:) forControlEvents:UIControlEventTouchUpInside];
    testBtn.backgroundColor = [UIColor yellowColor];
    testBtn.layer.cornerRadius = 10;
    [self.view addSubview:testBtn];
    [testBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view.mas_bottom);
        make.centerX.mas_equalTo(self.view);
        make.height.mas_equalTo(100);
        make.width.mas_equalTo(100);
    }];
}

- (void)tryNetwork:(id)sender {
    NSDictionary *paramters = @{@"userName":@"zhaoxiaoming",
                                @"password":@"000000"
                                };
    [GKHttpEngine isNetWorkingResponse:^{
        [GKHttpEngine post:kCURRENTURL(TestUrl) param:paramters finish:^(NSData *data, NSDictionary *obj, NSError *error) {
            NSLog(@"%@", data);
            //存入本地
            GKCacheManager *cm = [GKCacheManager defaultManager];
            [cm insertCacheWithURL:kCURRENTURL(TestUrl) data:data];
        }];
    } orNotResponse:^{
        [self dataFromLocal];
    }];


}

- (void)dataFromLocal {
    //判断该url对应的数据是否存在缓存
    // 第一次创建该单例时会创建table
    GKCacheManager * cm = [GKCacheManager defaultManager];
    //数据存在时间 
    cm.validTime = 3600 * 24;
    NSData *data = [cm dataFromCachesWithURL:kCURRENTURL(TestUrl)];
    if (data) {
            NSLog(@"%@",data);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
