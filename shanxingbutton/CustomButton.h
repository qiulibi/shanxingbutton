//
//  CustomButton.h
//  shanxingbutton
//
//  Created by qiulibi on 17/1/20.
//  Copyright © 2017年 qiulibi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomButton : UIControl
- (instancetype)initWithFrame:(CGRect)frame startAngle:(CGFloat)startAngle layerNum:(NSInteger)layerNum spaceAngle:(CGFloat)spaceAngle bigR:(CGFloat)bigR specificValue:(double)specificValue;
@property (nonatomic, strong) void(^layerTouch)(NSInteger index);

@end
