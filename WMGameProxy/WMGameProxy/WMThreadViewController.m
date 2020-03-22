//
//  WMThreadViewController.m
//  WMGameProxy
//
//  Created by 谢吴军 on 2020/3/16.
//  Copyright © 2020 zali. All rights reserved.
//

#import "WMThreadViewController.h"

@interface WMThreadViewController ()

@property (strong, nonatomic) UIImageView *imageView;

@end

/**
 1.线程间通信
 1>.概念 - 在一个进程中，线程往往不是孤立存在的，多个线程之间需要经常进行通信
 2>.一个线程传递数据给另一个线程
 3>.一个线程执行完毕特定任务后通知另一个线程继续执行任务
 */
@implementation WMThreadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

// 1.NSThread
// 1>.基本使用
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
    /**
    2.线程安全
    1>.资源共享 - 多个线程访问同一块资源（用一个对象/同一个变量/同一个文件）
    2>.多个线程资源共享很容易引发数据错乱和数据安全问题
    3>.互斥锁 - 必须全局唯一/优点 - 能有效防止因多线程抢夺资源造成的数据安全问题/缺点 - 需要消耗大量的CPU资源
    */
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
// 2>.线程通信
-(void)setupDownload {
    [NSThread detachNewThreadSelector:@selector(download) toTarget:self withObject:nil];
}
-(void)download {
    /// 下载网络图片
    // 1>.确定URL
    NSURL *url = [NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1584524053542&di=11684008fd1275a02127eb8e878ff887&imgtype=0&src=http%3A%2F%2Fa3.att.hudong.com%2F68%2F61%2F300000839764127060614318218_950.jpg"];
    // 2>.根据url下载图片/能下载下来的是二进制数据
    NSData *imageData = [NSData dataWithContentsOfURL:url];
    // 3.转换图片格式
    UIImage *image = [UIImage imageWithData:imageData];
//    // 5.显示UI/不能放在子线程修饰
//    self.imageView.image = image;
//    // 4.回到主线程
    /**
     1>.第一种方式
     第一个参数 - 回到主线程调用哪个方法
     第二个参数 - 前面方法传递的参数
     第三个参数 - 是否等待/ YES - 表示140行代码结束才会打印/ NO - 表示不用等待140行代码结束就会打印
     */
    [self performSelectorOnMainThread:@selector(reloadImageView:) withObject:image waitUntilDone:YES];
    /**
     2>.第二种方式
     第二个参数 - 表示回到哪条线程
     */
    [self performSelector:@selector(reloadImageView:) onThread:[NSThread mainThread] withObject:image waitUntilDone:YES];
    /**
     3>.第三种方式
     直接调用 self.imageView 的 setImage: 方法
     */
    [self.imageView performSelectorOnMainThread:@selector(setImage:) withObject:image waitUntilDone:YES];
    NSLog(@"---end---");
}
-(void)reloadImageView:(UIImage *)image {
    // 5.显示UI/不能放在子线程修饰
    self.imageView.image = image;
}


// 2.GCD - Grand Central Dispatch/强大的中枢调度器
//http://www.cocoachina.com/ios/20161031/17887.html
//https://blog.csdn.net/u011146511/article/details/79300015
//https://www.jianshu.com/p/96032a032c7c
// 1>.基本使用
// GCD纯C语言，提供了非常多强大的函数
// GCD是苹果公司为多核的并行运算提出的解决方案
// GCD会自动利用更多的CPU内核（比如双核、四核）
// GCD会自动管理线程的生命周期（创建线程、调度线程、销毁线程）
// 开发人员只需要告诉GCD想要执行什么任务/不需要编写任何线程管理代码
/**
 GCD中两个核心概念
 1.任务 - 执行什么操作
 2.队列 - 用来存放任务
 */
/**
 GCD的执行步骤
 1.定制任务
 2.将任务添加到队列 - GCD会自动将队列中的任务取出，放在对应的线程中执行/任务的取出遵循队列的FIFO原则
 */
-(void)setupGCD {
    // 1.GCD用来执行任务的常用函数
    /**
     1.queue - 队列
     // 3>.并发队列
     // 可以将多个任务并发（同时）执行/自动开启多个线程同时执行任务
     // 并发功能只有在异步函数在才有效（因为同步函数不支持开启多线程）
     // 4>.串行队列
     // 让任务一个接着一个的按顺序执行/一个任务执行完毕在执行下一个任务
     // 并发功能只有在异步函数在才有效（因为同步函数不支持开启多线程）
     2.block - 任务
     // 1>.用同步的方式来执行任务
     // 同步 - 只能在当前线程中执行任务，不具备开启新线程的能力
     // 2>.用异步的方式来执行任务
     // 异步 - 可以在新的线程中执行任务，具备开启新线程的能力
     */
    // 1.异步 + 并发/会开启多条线程（具体开启多少条线程是由系统内部决定的/不受我们控制）/队列并发执行任务
    // 1>.创建队列
    /**
     第一种方式
     第一个参数 - C语言的字符串/标识符
     第二个参数 - 队列类型/ DISPATCH_QUEUE_SERIAL串行队列/ DISPATCH_QUEUE_CONCURRENT并行队列
     */
    dispatch_queue_t ConcurrentQueue = dispatch_queue_create("com.easy.download", DISPATCH_QUEUE_CONCURRENT);
    /**
     第二种方式 - 获取全局并发队列
     第一个参数 - 优先级
     DISPATCH_QUEUE_PRIORITY_HIGH 2
     DISPATCH_QUEUE_PRIORITY_DEFAULT  0
     DISPATCH_QUEUE_PRIORITY_LOW (-2)
     DISPATCH_QUEUE_PRIORITY_BACKGROUND INT16_MIN
     第二个参数 - 为未来使用
     */
    // ConcurrentQueue == mainQueue等价的
    dispatch_queue_t mainConcurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    // 2.封装任务 -> 添加任务到队列中
    /**
    第一个参数 - 队列
    第二个参数 - 需要执行的任务
    */
    // 一个队列中添加多个任务
    dispatch_async(ConcurrentQueue, ^{
        NSLog(@"download---%@", [NSThread currentThread]);
    });
    dispatch_async(ConcurrentQueue, ^{
        NSLog(@"download---%@", [NSThread currentThread]);
    });
    dispatch_async(ConcurrentQueue, ^{
        NSLog(@"download---%@", [NSThread currentThread]);
    });
    
    // 2.异步 + 串行/会开启一条线程/队列串行执行任务
    // 1>.创建队列
    /**
     第一个参数 - C语言的字符串/标识符
     第二个参数 - 队列类型/ DISPATCH_QUEUE_SERIAL串行队列/ DISPATCH_QUEUE_CONCURRENT并行队列
     */
    dispatch_queue_t SerialQueue = dispatch_queue_create("com.easy.download", DISPATCH_QUEUE_SERIAL);
//    dispatch_queue_t SerialQueue = dispatch_queue_create("com.easy.download", NULL);
    /**
     获取主队列 - 跟主线程相关联的串行队列
     1.主队列是GCD自带的一种特殊的串行队列
     2.放在主队列的任务必须在主线程中执行
     */
    /**
     串行队列 - 在当前线程执行任务/有任务就必须执行（不会检查主线程的状态（是否在忙）都会强制让当前线程来执行任务）
     主队列 - 如果主队列发现当前主线程有任务在执行那么主队列就会暂停调用队列中的任务直到主线程空闲为止
     */
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    // 2.封装任务 -> 添加任务到队列中
    /**
    第一个参数 - 队列
    第二个参数 - 需要执行的任务
    */
    // 一个队列中添加多个任务
    dispatch_async(SerialQueue, ^{
        NSLog(@"download---%@", [NSThread currentThread]);
    });
    dispatch_async(SerialQueue, ^{
        NSLog(@"download---%@", [NSThread currentThread]);
    });
    dispatch_async(SerialQueue, ^{
        NSLog(@"download---%@", [NSThread currentThread]);
    });
    
    // 3.同步 + 并发/不会开启子线程/队列串行执行任务
    // 1>.创建队列
    // 2.封装任务 -> 添加任务到队列中
    /**
    第一个参数 - 队列
    第二个参数 - 需要执行的任务
    */
    // 一个队列中添加多个任务
    dispatch_sync(mainConcurrentQueue, ^{
        NSLog(@"download---%@", [NSThread currentThread]);
    });
    dispatch_sync(mainConcurrentQueue, ^{
        NSLog(@"download---%@", [NSThread currentThread]);
    });
    dispatch_sync(mainConcurrentQueue, ^{
        NSLog(@"download---%@", [NSThread currentThread]);
    });
    
    // 4.同步 + 串行/不会开启子线程/队列串行执行任务
    // 1>.创建队列
    // 2.封装任务 -> 添加任务到队列中
    /**
    第一个参数 - 队列
    第二个参数 - 需要执行的任务
    */
    // 一个队列中添加多个任务
    dispatch_sync(SerialQueue, ^{
        NSLog(@"download---%@", [NSThread currentThread]);
    });
    dispatch_sync(SerialQueue, ^{
        NSLog(@"download---%@", [NSThread currentThread]);
    });
    dispatch_sync(SerialQueue, ^{
        NSLog(@"download---%@", [NSThread currentThread]);
    });
    
    // 5.异步 + 主队列/所有任务都在主线程中执行，不会开启线程
    // 异步 - 如果当前没有执行完毕，后面也可以执行
    dispatch_async(mainQueue, ^{
        NSLog(@"download---%@", [NSThread currentThread]);
    });
    dispatch_async(mainQueue, ^{
        NSLog(@"download---%@", [NSThread currentThread]);
    });
    dispatch_async(mainQueue, ^{
        NSLog(@"download---%@", [NSThread currentThread]);
    });
    
    // 6.同步 + 主队列/死锁（相互等待）
    // 如果把该段代码放在子线程就不会发生死锁
    // 同步函数 - 立刻马上执行/如果我没有执行完毕后面的也别想执行
    dispatch_sync(mainQueue, ^{
        NSLog(@"download---%@", [NSThread currentThread]);
    });
    dispatch_sync(mainQueue, ^{
        NSLog(@"download---%@", [NSThread currentThread]);
    });
    dispatch_sync(mainQueue, ^{
        NSLog(@"download---%@", [NSThread currentThread]);
    });
}
// 2>.线程通信
-(void)notificationGCD {
    // 1.创建子线程下载图片
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 1>.确定URL
        NSURL *url = [NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1584524053542&di=11684008fd1275a02127eb8e878ff887&imgtype=0&src=http%3A%2F%2Fa3.att.hudong.com%2F68%2F61%2F300000839764127060614318218_950.jpg"];
        // 2>.根据url下载图片/能下载下来的是二进制数据
        NSData *imageData = [NSData dataWithContentsOfURL:url];
        // 3.转换图片格式
        UIImage *image = [UIImage imageWithData:imageData];
//        // 5.显示UI/不能放在子线程修饰
//        self.imageView.image = image;
        // 4.回到主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView.image = image;
        });
//        // 这里不会发生死锁
//        dispatch_sync(dispatch_get_main_queue(), ^{
//            self.imageView.image = image;
//        });
    });
}
// 3.GCD其他常见函数
-(void)notify {
    // 1.延迟执行
    // 第一种方法
    [self performSelector:@selector(onTask) withObject:nil afterDelay:2.0];
    // 第二种方法
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(onTask) userInfo:nil repeats:YES];
    // 第三种方法
    /**
     第一个参数 - 从什么开始计算时间
     第二个参数 - 需要延迟的时间
     第三个参数 - 队列
     第四个参数 - 任务
     */
//    // 设置 “任务” 在主线程中执行
//    dispatch_queue_t main = dispatch_get_main_queue();
    // 设置 “任务” 在子线程中执行
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), queue, ^{
        NSLog(@"GCD===%@", [NSThread currentThread]);
    });
    
    // 2.一次性代码
    // 整个应用程序运行期间只会执行一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSLog(@"----once----");
    });
}
-(void)onTask {
    NSLog(@"task===%@", [NSThread currentThread]);
}

@end
