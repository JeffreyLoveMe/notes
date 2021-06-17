//
//  WMGameView.m
//  WMGameProxy
//
//  Created by 谢吴军 on 2020/1/13.
//  Copyright © 2020 zali. All rights reserved.
//

#import "WMGameView.h"

@implementation WMGameView

/// 1.通过该方法 init 控件
// 然后直接frame在该方法中拿不到尺寸
- (instancetype)init {
    self = [super init];
    if (self) {
//        [self layoutSubviews];
        // 在这里init
    }
    return self;
}

/// 2.通过该方法init控件
// 可以直接拿到frame
// 调用[[xxx alloc]init]/[[xxx alloc]initWithFrame:xxx]都会调用该方法
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // 这里添加控件
    }
    return self;
}

/// 当解析一个文件的时候会调用
// 如果子控件从xib中创建则处于未唤醒状态
- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        // 先调用
        // 这里还没有创建子控件
        // 不要在这里操作“xib中创建的子控件的子控件”（处于未唤醒状态）
    }
    return self;
}
/// 从xib中唤醒
// 当xib加载完毕的时候调用
// 添加xib中的子控件
- (void)awakeFromNib {
    [super awakeFromNib];
    // 后调用
    // 必须在这里操作“xib中创建的子控件的子控件”
}

/// 通过"方法1"只能在该方法中拿到frame
// 必须到这里布局子控件
- (void)layoutSubviews {
    // 0.一定要调用super
    [super layoutSubviews];
    // ！！！在这里布局！！！
}


/// 处理是手势事件部分 - start - 与上面部分内容无关
// 0.怎么找到最适合的控件？？？
// 利用该方法寻找到最适合的 View
// 2.什么时候调用：当一个事件传递给当前 View
// 3.返回 “哪个view”，“哪个view” 就是最适合的 view
// ！！！点击 “父视图” 会调用 “所有子视图的该方法”！！！
// 调用该方法如果没有找到 “最适合的 View”，“最适合的 view” 就是 “父视图返回的该方法 View”
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {  // 每产生一个事件就会产生一个UIEvent对象
    /// 1.系统默认方法
    /**
     该方法 “系统默认方法” 所做的操作就是这个
     问题：如何找到最合适的控件来处理事件？（有没有比自身控件更合适的控件）
     1.自己是否能够接收触摸事件；
     2.触摸点是否在自己身上；(这一步也可以重写/- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event;)
     3.从后往前遍历子控件：重复步骤 1/2；
     4.如果没有符合条件 1/2 的子控件就自己最适合处理；
    */
    return [super hitTest:point withEvent:event];
    
//    /// 2.自定义方法
//    /**
//     1.直接返回“某个控件”：可以重写该方法让 “某个控件” 一直响应事件
//     2.不会再向上接着寻找
//     */
//    /**
//     ！！！如果重写该方法就不需要再执行下列操作（系统默认方法）！！！
//     // 下列操作（系统默认方法）会被拦截
//     “
//     如何找到最合适的控件来处理事件？（有没有比自身控件更合适的控件）
//     1.自己是否能够接收触摸事件；
//     2.触摸点是否在自己身上；
//     3.从后往前遍历子控件：重复步骤 1/2；
//     4.如果没有符合条件 1/2 的子控件就自己最适合处理；
//     ”
//     */
//    return self.subviews.firstObject;
    
//    /// 3.！！！底层实现！！！
//    // 1.判断自身能否接收事件
//    if (self.userInteractionEnabled == NO || self.hidden == YES || self.alpha <= 0.01) {
//        return nil;
//    }
//    // 2.判断当前点在不在当前View
    // 此处 “point” 需要保证与 “self” 在同一个坐标系
//    if (![self pointInside:point withEvent:event]) {
//        return nil;
//    }
//    // 3.从后往前遍历自己的子控件，让子控件重复前两部操作
//    for (UIView *subView in self.subviews) {
//        // 把当前控件的点转换成子控件坐标系的点
//       // point点必须跟 “它方法的调用者”/“当前 View” 在 “同一个坐标系” 中
//        CGPoint subPoint = [self convertPoint:point toView:subView];
//        UIView *fitView = [subView hitTest:subPoint withEvent:event];
//        if (fitView) {
//            return fitView;
//        }
//    }
//    // 4.如果没有找到比它自身更适合的View，则返回自身
//    return self;
}

// 0.判断 “当前点” 是否在 “当前 View” 上
// 1.什么时候调用：在 “hitTest方法” 中调用 / “系统默认方法”第二步
// 2.point点必须跟 “它方法的调用者”/“当前 View” 在 “同一个坐标系” 中/当前 View 为坐标原点
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    return NO;
}

/**
 常见练习
 0>.实现控件在屏幕上的任意拖拽
 1>.点击上面的子控件的某小块会让底部的子控件响应事件
 2>.点击子控件超过父控部分可以响应事件
 */
/// 处理是手势事件部分 - end - 与下面部分内容无关


@end
