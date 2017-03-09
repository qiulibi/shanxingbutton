//
//  CustomButton.m
//  shanxingbutton
//
//  Created by qiulibi on 17/1/20.
//  Copyright © 2017年 qiulibi. All rights reserved.
//

#import "CustomButton.h"

@interface CustomButton ()
//{
//    CAShapeLayer *_shape;
//    id _target;
//    SEL _action;
//}

@end

@implementation CustomButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame startAngle:(CGFloat)startAngle  layerNum:(NSInteger)layerNum spaceAngle:(CGFloat)spaceAngle bigR:(CGFloat)bigR specificValue:(double)specificValue {
    if ([super initWithFrame:frame]) {
        
        CGPoint centerPiont = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
        CGFloat bigR = CGRectGetMidX(self.bounds);
        CGFloat smallR = CGRectGetMidX(self.bounds)*specificValue;
        CGFloat pathAngle = M_PI*2/layerNum - spaceAngle;
        
        for (int i = 0; i < layerNum; i++) {
            [self addPathWithCenterPoint:centerPiont bigR:bigR smallR:smallR StartAngle:startAngle + (M_PI*2/layerNum)*i endAngle:startAngle + pathAngle + (M_PI*2/layerNum)*i];
        }
        
        
    }
    return self;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    
    CGPoint point = [[touches anyObject] locationInView:self];
//    point = [self.layer convertPoint:point toLayer:_shape];
//    UIBezierPath *path = [UIBezierPath bezierPathWithCGPath:_shape.path];
//    if ([path containsPoint:point]) {
//        if ([_target respondsToSelector:_action]) {
//            [_target performSelectorOnMainThread:_action withObject:nil waitUntilDone:NO];
//        }
//    }
    for (int i = 0; i < self.layer.sublayers.count;i++) {
        
        
        if ([self.layer.sublayers[i] isKindOfClass:[CAShapeLayer class]]) {
            CAShapeLayer *shape = (CAShapeLayer *)self.layer.sublayers[i];
            UIBezierPath *path = [UIBezierPath bezierPathWithCGPath:shape.path];
            if ([path containsPoint:point]) {
                if (_layerTouch) {
                    _layerTouch(i);
                }
            }
        }
        
        
    }

}
//
//- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents {
//    _target = target;
//    _action = action;
//}

- (void)addPathWithCenterPoint:(CGPoint)centerPoint bigR:(CGFloat)bigR smallR:(CGFloat)smallR StartAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle {
    
    //***********
    //获取两个必要点
    //内环的弧（与真实画的路径刚好相反，包括起始点和旋转的方向，目的是为了获取需要的两个点）
    UIBezierPath *inPath = [UIBezierPath bezierPathWithArcCenter:centerPoint
                                                          radius:smallR
                                                      startAngle:startAngle
                                                        endAngle:endAngle
                                                       clockwise:YES];
    //通过内环的弧获取开始画直线结束的点
    CGPoint lineStart = inPath.currentPoint;
    
    //外围的弧
    UIBezierPath *outPath = [UIBezierPath bezierPathWithArcCenter:centerPoint
                                                           radius:bigR
                                                       startAngle:endAngle
                                                         endAngle:startAngle
                                                        clockwise:NO];
    //通过外围的弧获取结束路径的点
    CGPoint lineEndPoint = outPath.currentPoint;
    
    
    //*****
    //开始绘制真实的路径
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:centerPoint
                                                        radius:bigR
                                                    startAngle:startAngle
                                                      endAngle:endAngle
                                                     clockwise:YES];
    
    [path addLineToPoint:lineStart];
    [path addArcWithCenter:centerPoint radius:smallR startAngle:endAngle endAngle:startAngle clockwise:NO];
    [path addLineToPoint:lineEndPoint];
    
    CAShapeLayer *shape = [CAShapeLayer layer];
    [shape setStrokeColor:[UIColor blueColor].CGColor];
    [shape setFillColor:[UIColor orangeColor].CGColor];
    shape.path = path.CGPath;
    [self.layer addSublayer:shape];
}

@end
