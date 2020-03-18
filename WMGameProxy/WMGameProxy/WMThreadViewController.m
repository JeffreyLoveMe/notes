//
//  WMThreadViewController.m
//  WMGameProxy
//
//  Created by 谢吴军 on 2020/3/16.
//  Copyright © 2020 zali. All rights reserved.
//

#import "WMThreadViewController.h"

@interface WMThreadViewController ()

@end

/**
 0.线程安全
 1>.资源共享 - 多个线程访问同一块资源（用一个对象/同一个变量/同一个文件）
 2>.多个线程资源共享很容易引发数据错乱和数据安全问题
 3>.互斥锁 - 必须全局唯一/优点 - 能有效防止因多线程抢夺资源造成的数据安全问题/缺点 - 需要消耗大量的CPU资源
 */
/**
 1.线程间通信
 1>.概念 - 在一个进程中，线程往往不是孤立存在的，多个线程之间需要经常进行通信
 2>.1).一个线程传递数据给另一个线程/2).一个线程执行完毕特定任务后通知另一个线程继续执行任务
 3>.
 */
@implementation WMThreadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

// 1.NSThread
// 线程的生命周期 - 当线程中的任务执行完毕以后才会被释放
-(void)setupNSThread {
    // 1>.创建线程/第一种方式
    /**
     第一个参数 - self目标对象
     第二个参数 - 方法选择器/调用的方法
     第三个参数 - 调用的方法需要传递的参数
     */
    // 1.新建New
    NSThread *threadA = [[NSThread alloc]initWithTarget:self selector:@selector(run:) object:@"ABC"];
    // 设置属性需要在 “手动启动线程” 之前
    threadA.name = @"线程A";
    /**
     设置优先级
     默认优先级 - 0.5
     取值范围 - 0.0低 ～ 1.0高
     */
    // 线程的优先级越高 -> CPU调度的概率越高
    threadA.threadPriority = 1.0;
    // 立即启动线程
    // 默认是暂停
    // 2.就绪Runnable->运行Running
    // 线程任务执行完毕会自动进入死亡状态
    [threadA start];
    // 取消线程
    [threadA cancel];
    if ([threadA isCancelled]) {
        NSLog(@"线程被取消");
    }
    // 3.阻塞Blocked
    // 还存在于内存中
    [NSThread sleepForTimeInterval:2.0];
//    [NSThread sleepUntilDate:[NSDate dateWithTimeIntervalSinceNow:2.0]];
    NSThread *threadB = [[NSThread alloc]initWithTarget:self selector:@selector(run:) object:@"ABC"];
    threadB.name = @"线程B";
    [threadB start];
    NSThread *threadC = [[NSThread alloc]initWithTarget:self selector:@selector(run:) object:@"ABC"];
    threadC.name = @"线程C";
    [threadC start];
    // 2>.创建线程/第二种方式
    [NSThread detachNewThreadSelector:@selector(run:) toTarget:self withObject:@"分离子线程"];
    // 3>.创建线程/第三种方式
    [self performSelectorInBackground:@selector(run:) withObject:@"开启后台线程"];
    // 4>.获取主线程
    NSThread *mainThread = [NSThread mainThread];
    // 5>.判断是否是主线程
    if ([NSThread isMainThread]) {
        NSLog(@"当前线程是主线程");
    }
    if ([mainThread isMainThread]) {
        NSLog(@"当前线程是主线程");
    }
    NSLog(@"输出当前方法名%s", __FUNCTION__);
}
-(void)run:(NSString *)param {
    // 互斥锁 - 必须全局唯一
    // 这里使用 self（锁对象） 保证全局唯一
    // 1.注意加互斥锁的位置
    // 2.注意加互斥锁的前提条件 - 多条线程访问同一块资源
    // 3.加互斥锁需要耗费性能的
    // 4.加互斥锁结果会导致“线程同步”（多条线程按顺序的执行任务）/默认多线程是异步的
    @synchronized (self) {
        // 需要锁定的代码
        // 锁定一份代码只需要一份代码，用多把锁匙无效的 - 保证多条线程执行到这里使用的都是同一把锁（锁对象不变）
        NSLog(@"获取当前线程的名称%@", [NSThread currentThread].name);
        for (int index = 0; index < 10000; index++) {
            if (index == 100) {
//                // 4.死亡Dead
//                // 强制结束当前线程/进入死亡状态
//                // 不能再次重启任务
//                [NSThread exit];
                // 任务执行完毕结束当前线程
                break;
            }
        }
    }
}

// 2.线程通信
-(void)download {
    // 1>.确定URL
    NSURL *url = [NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1584524053542&di=11684008fd1275a02127eb8e878ff887&imgtype=0&src=http%3A%2F%2Fa3.att.hudong.com%2F68%2F61%2F300000839764127060614318218_950.jpg"];
    // 2>.根据url下载图片
    
    
    
    
    
    
    
    
    
    
    
    
}

@end
