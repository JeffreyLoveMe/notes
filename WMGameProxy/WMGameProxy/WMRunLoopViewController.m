//
//  WMRunLoopViewController.m
//  WMGameProxy
//
//  Created by 谢吴军 on 2020/3/25.
//  Copyright © 2020 zali. All rights reserved.
//

#import "WMRunLoopViewController.h"

@interface WMRunLoopViewController ()

@end

@implementation WMRunLoopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
// https://www.jianshu.com/p/d6b12f775328
// 1>.第一种获取方式 - 通过 “Foundation框架” 获取
// oc语言方式
-(void)setNSRunLoop {
    // 获取主线程的RunLoop对象
    NSRunLoop *mainRunLoop = [NSRunLoop mainRunLoop];
    // 获得当前线程的RunLoop对象
    NSRunLoop *currentRunLoop = [NSRunLoop currentRunLoop];
    NSLog(@"%p - %p - %p", mainRunLoop, currentRunLoop, mainRunLoop.getCFRunLoop);
    // 创建子线程
    NSThread *threadA = [[NSThread alloc]initWithTarget:self selector:@selector(run:) object:@"ABC"];
    [threadA start];
}
-(void)run:(NSString *)param {
    // 如果存在NSRunLoop就返回NSRunLoop
    // 如果不存在NSRunLoop就新建NSRunLoop再返回
    NSRunLoop *currentRunLoop = [NSRunLoop currentRunLoop];
}

// 2>.第二种获取方式 - 通过 Core Foundation框架 获取
// C语言方式
-(void)setCFRunLoop {
    // 获得当前线程的RunLoop对象
    // 获取主线程的RunLoop对象
    NSLog(@"%@ - %@", CFRunLoopGetCurrent(), CFRunLoopGetMain());
}


/**
 3>.RunLoop相关类
 1.在RunLoop中有多个运行模式(Mode)/但是启动以后只能选择一种模式运行（称为CurrentMode）/一个模式中至少有一个timer或者source
 2.如果需要切换Mode - 只能退出当前Loop，再重新指定一个Mode进入（为了分隔开不同组的Source/Timer/Observer让其互不影响）
 */
/**
 1>.CFRunLoopModeRef - 系统默认注册五个Mode
 1.kCFRunLoopDefaultMode - App的默认Mode/通常主线程在该Mode下运行
 2.UITrackingRunLoopMode - 界面跟踪Mode/用于UIScrollView追踪触摸滑动（保证界面滑动时不受其他Mode影响）
 3.UIInitializationRunLoopMode - 再刚启动App时进入的第一个Mode（启动完成就不再使用）
 4.GSEventReceiveRunLoopMode - 接收系统事件的内部Mode/绘图使用（通过用不到）
 5.kCFRunLoopCommonModes - 占位使用的Mode（不是一种真正的Mode）
 */
/**
 2>.CFRunLoopTimerRef
 1.为什么需要把NSTimer加入到NSRunLoop？
 Q.界面滑动的时候定时器不工作
 2.为什么界面滑动的时候定时器会不工作？
 Q.因为界面滑动的时候NSRunLoop切换到了UITrackingRunLoopMode（界面跟踪Mode）。
 导致kCFRunLoopDefaultMode（默认Mode）下的事件不会再执行
 */
-(void)setupMode {
    // 1>.创建定时器
    NSTimer *timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(run) userInfo:nil repeats:YES];
    // 2>.添加定时器到NSRunLoop
    /**
     NSDefaultRunLoopMode
     UITrackingRunLoopMode
     NSRunLoopCommonModes
     */
    // 只有在界面不滑动的时候定时器才会工作
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    // 只有在界面滑动的时候定时器才会工作
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:UITrackingRunLoopMode];
    // 凡是添加到NSRunLoopCommonModes中的事件都会被同时添加到打上common标签的运行模式上
    // 定时器会一直工作
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    /**
     1.通过该方法创建的定时器不需要加入NSRunLoop
     2.因为该方法内部自动添加NSRunLoop中并且设置运行模式为默认
     3.这种创建方式定时器在UI界面滑动的时候也是不工作 - 需要重新添加
     4.该方法在子线程中不会工作 - 因为当前子线程的RunLoop不存在，需要手动创建
     */
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(run) userInfo:nil repeats:YES];
    // 子线程下执行定时器
    [NSThread detachNewThreadSelector:@selector(run) toTarget:self withObject:nil];
}
-(void)run {
    // 子线程的RunLoop不存在，需要手动创建
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    // 创建定时器
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(run) userInfo:nil repeats:YES];
    // 子线程的RunLoop默认不开启，需要手动开启
    [runloop run];
//    // 开启RunLoop后10s以后退出RunLoop
//    [runloop runUntilDate:[NSDate dateWithTimeIntervalSinceNow:10]];
//    // 以什么模式开启RunLoop/10s以后退出RunLoop
//    [runloop runMode:NSRunLoopCommonModes beforeDate:[NSDate dateWithTimeIntervalSinceNow:10]];
}
/**
 3>.CFRunLoopSourceRef - 事件源
 1>.Source0 - 非基于Port/用户主动触发
 2>.Source1 - 基于Port/非用户主动触发
 */
/**
 4>.CFRunLoopObserverRef - 观察者/能够监听RunLoop的状态改变
 // CFRunLoopActivity
 1>.kCFRunLoopEntry - 即将进入RunLoop
 2>.kCFRunLoopBeforeTimers - 即将处理Timer
 3>.kCFRunLoopBeforeSources - 即将处理Source
 4>.kCFRunLoopBeforeWaiting - 即将处理休眠
 5>.kCFRunLoopAfterWaiting - 刚从休眠中唤醒
 6>.kCFRunLoopExit - 即将推出RunLoop
 */
-(void)setObserver {
    // 1>.创建监听者
    /**
    第一个参数 - 怎么分配存储空间
    第二个参数 - 要监听的状态/ kCFRunLoopAllActivities - 所有状态
    第三个参数 - 是否需要持续监听
    第四个参数 - 优先级/总是传入0
    第五个参数 - 当状态改变的时候调用
    */
    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(CFAllocatorGetDefault(), kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        switch (activity) {
            case kCFRunLoopEntry: {
                NSLog(@"即将进入RunLoop");
            }
            break;
            case kCFRunLoopBeforeTimers: {
                NSLog(@"即将处理Timer");
            }
                break;
            case kCFRunLoopBeforeSources: {
                NSLog(@"即将处理Source");
            }
                break;
            case kCFRunLoopBeforeWaiting: {
                NSLog(@"即将处理休眠");
            }
                break;
            case kCFRunLoopAfterWaiting: {
                NSLog(@"刚从休眠中唤醒");
            }
                break;
            case kCFRunLoopExit: {
                NSLog(@"即将推出RunLoop");
            }
                break;
            default:
                break;
        }
    });
    /**
    第一个参数 - 要监听哪个RunLoop
    第二个参数 - 观察者
    第三个参数 - 运行模式
    */
    CFRunLoopAddObserver(CFRunLoopGetCurrent(), observer, kCFRunLoopDefaultMode);
}


/**
 6.GCD定时器
 1.不受RunLoop的影响
 2.绝对精准
 */
-(void)setTimer {
    // 1>.创建GCD中定时器
    /**
     第一个参数 - source类型/DISPATCH_SOURCE_TYPE_TIMER表示定时器
     第二个参数 - 描述信息/线程ID
     第三个参数 - 更详细的描述信息
     第四个参数 - 队列/决定GCD定时器中的任务在哪个线程中执行
     */
    // 此处 timer 不执行 - 需要给 timer 一个强引用
    // @property (strong, nonatomic) dispatch_source_t timer;
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(0, 0));
    // 2.设置定时器
    /**
    第一个参数 - 定时器对象
    第二个参数 - 起始时间/ DISPATCH_TIME_NOW - 从现在开始
    第三个参数 - 间隔时间/ 每隔2.0s /NSEC_PER_SEC == 10^9
    第四个参数 - 精准度/ 0代表绝对精准
    */
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 2.0 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    // 3>.设置定时器的任务
    dispatch_source_set_event_handler(timer, ^{
        NSLog(@"%@", [NSThread currentThread]);
    });
    // 4>.启动定时器
    dispatch_resume(timer);
}

@end
