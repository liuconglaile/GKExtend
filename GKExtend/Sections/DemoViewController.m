//
//  DemoViewController.m
//  GKExtend
//
//  Created by 凯旋 郭 on 3/17/16.
//  Copyright © 2016 凯旋 郭. All rights reserved.
//

#import "DemoViewController.h"

#define TestUrl @"/default/appInterface/com.suremoov.appInterface.UserLogin.login.biz.ext"
#define TestUrl1 @"http://mobile.renrenpad.com/v1/api/ad/get?location=video&subLocation=movie"

@interface DemoViewController ()

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *postBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [postBtn setTitle:@"POSTNetwork" forState:UIControlStateNormal];
    [postBtn addTarget:self action:@selector(postNetwork:) forControlEvents:UIControlEventTouchUpInside];
    postBtn.backgroundColor = [UIColor yellowColor];
    postBtn.layer.cornerRadius = 10;
    [self.view addSubview:postBtn];
    [postBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view.mas_bottom);
        make.left.mas_equalTo(self.view);
        make.height.mas_equalTo(100);
        make.width.mas_equalTo(100);
    }];
    
    UIButton *getBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [getBtn setTitle:@"GETNetwork" forState:UIControlStateNormal];
    [getBtn addTarget:self action:@selector(getNetwork:) forControlEvents:UIControlEventTouchUpInside];
    getBtn.backgroundColor = [UIColor yellowColor];
    getBtn.layer.cornerRadius = 10;
    [self.view addSubview:getBtn];
    [getBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view.mas_bottom);
        make.right.mas_equalTo(self.view);
        make.height.mas_equalTo(100);
        make.width.mas_equalTo(100);
    }];
}

- (void)getNetwork:(id)sender {
    [GKHttpEngine get:TestUrl1 param:nil finish:^(NSData *data, NSDictionary *obj, NSError *error) {
        NSLog(@"%@", obj);
    }];
}

- (void)postNetwork:(id)sender {
    NSDictionary *paramters = @{@"userName":@"",
                                @"password":@""
                                };
    [GKHttpEngine isNetWorkingResponse:^{
        [GKHttpEngine post:kCURRENTURL(TestUrl) param:paramters finish:^(NSData *data, NSDictionary *obj, NSError *error) {
            NSLog(@"%@", obj);
            //存入本地
            if (data) {
                GKCacheManager *cm = [GKCacheManager defaultManager];
                //如果本地存在
                if ([cm dataFromCachesWithURL:kCURRENTURL(TestUrl)]) {
                    //删除本地缓存
                    [cm removeCacheWithURL:kCURRENTURL(TestUrl)];
                }
                [cm insertCacheWithURL:kCURRENTURL(TestUrl) data:data];
            }
        }];
    } orNotResponse:^{
        [self dataFromLocal];
    }];


}

//读取本地数据
- (void)dataFromLocal {
    //判断该url对应的数据是否存在缓存
    // 第一次创建该单例时会创建table
    GKCacheManager * cm = [GKCacheManager defaultManager];
    //数据存在时间 
    cm.validTime = 3600 * 24;
    NSData *data = [cm dataFromCachesWithURL:kCURRENTURL(TestUrl)];
    if (data) {
                NSDictionary * obj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSLog(@"%@",obj);
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
