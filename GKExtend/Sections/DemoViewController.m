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
    [GKHttpEngine post:kCURRENTURL(TestUrl) param:paramters finish:^(NSData *data, NSDictionary *obj, NSError *error) {
        NSLog(@"%@", data);
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
