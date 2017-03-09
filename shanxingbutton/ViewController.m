//
//  ViewController.m
//  shanxingbutton
//
//  Created by qiulibi on 17/1/20.
//  Copyright © 2017年 qiulibi. All rights reserved.
//

#import "ViewController.h"
#import "CustomButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CustomButton  *btn = [[CustomButton alloc] initWithFrame:CGRectMake(20, 50, 300, 300) startAngle:M_PI*3/2 layerNum:6 spaceAngle:M_PI/15 bigR:300 specificValue:0.55];
    
    btn.layerTouch = ^(NSInteger touchIndex){
        NSLog(@"%ld",touchIndex);
    };
    
    [self.view addSubview:btn];
    
//    CustomButton  *btn2 = [[CustomButton alloc] initWithFrame:CGRectMake(50, 50, 200, 200) startAngle:0 endAngle:M_PI/6];
//    
//    [btn2 addTarget:self action:@selector(buttonCilck2:) forControlEvents:UIControlEventTouchUpInside];
//    
//    [self.view addSubview:btn2];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
