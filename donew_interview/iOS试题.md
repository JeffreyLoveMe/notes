 一、判断题(每题 2分，共 20分)
1、UITableView 能够绑定多个数据源。(错)
2、一个 UIViewController 可以管理多个 UITableView 。(对)
3、 Object-c 的类可以多重继承。(错)
4、 objective-c 类里面的方法只有两种 , 静态方法和实例方法。(对)
5、NSFileManager 和NSWorkspace在使用时都是基于进程进行单件对象的实例化。 (对)
6、用类别增加方法时，不能与原来类中的方法产生名称冲突。(错)
7、frame 指的是该 view 在本身坐标系统中 的位置和大小。(错)
8、method是一个方法的名字， selector 是一个组合体。(错)
9、 ARC是编译特性，不是运行时特性，在编译时，编译器会自动加上释放代码。(对)
10、从 iOS4之后， Safari 支持全屏浏览， Siri 支持普通话。(对)
二、填空题(每空 2分，共 20分)
1、iOS是使用 Objective-C 语言编写的， 使用该语言开发的 Cocoa是一款功能强大的用户 界面工具包，也是 iOS的核心。
2、数组是将元素在内存中连续存放，由于每个元素占用内存相同，可以通过下标迅速 访问数组中任何元素。链表恰好相反，其中的元素在内存中不是顺序存储的，而是通过 存在元素中的指针联系到一起。
3、发送同步请求，程序将停止用户交互，直至服务器返回数据完成，才可以进行下一 步操作。而发送异步请求不会阻塞主线程，会建立一个新的线程来操作，之后程序可以 继续运行。
4、autorelease 只是把 Object 放入了当前的 autorelease pool 中，当它被释放时，其中 的所有 Object 都会被调用 Release 。
5、作为 Objective-C 导入头文件的关键字， #import<> 用来包含系统的头文件， #import ”” 用来包含用户头文件。
三、简述题(每题 4分，共 20分)
1、delegate 和notification 有什么区别，什么情况下使用?
答: delegate :消息的发送者( sender )告知接收者( receiver )某个事件将要发生， delegate 同意然后发送者响应事件， delegate 机制使得接收者可以改变发送者的行为。

通常发送者和接收者的关系是直接的一对多的关系。
notification :消息的发送者告知接收者事件已经发生或者将要发生，仅此而已，接收 者并不能反过来影响发送者的行为。通常发送者和接收者的关系是间接的多对多关系。
2、Object-C 中创建线程的方法是什么?如果在主线程中执行代码，方法是什么?如果 想延时执行代码、方法又是什么?
答:线程创建有三种方法:使用 NSThread创建、使用 GCD的 dispatch 、使用子类化的 NSOperation ，然后将其加入 NSOperationQueue。
在主线程执行代码，方法是 performSelectorOnMainThread 。
如果想延时执行代码可以用 performSelector:onThread:withObject:waitUntilDone 。
3、iOS有哪些数据持久化方式?
答:四种:属性列表、对象归档、 SQLite3 和Core Data 。
4、Objective-C 如何对内存管理的 , 说说你的看法和解决方法?
答: Objective-C 的内存管理主要有三种方式 ARC(自动内存计数)、手动内存计数、内 存池。解决方法的话:谁持有，谁释放。


2、请阐述 UIViewController 的生命周期，包括代码的执行顺序。

答:当一个视图控制器被创建，并在屏幕上显示的时候。代码的执行顺序 // 视图显示在屏幕上的顺序
1、 alloc
2、 init (initWithNibName) 3 、 viewload
有使用 xib 文件创建视图。 4、viewDidLoad
他控件。
5、viewWillAppear 在屏幕上。
6、 viewDidAppear
// 视图将被从屏幕上移除的顺序
1、 viewWillDisappear
2、 viewDidDisappear
3、dealloc 创建的对象进行释放。
4、viewDidUnload 前显示的 controller 执行。
创建对象，分配空间。 初始化对象 , 初始化数据。
从 nib 载入视图 , 这一步不需要去干涉。除非没
加载完毕，可以进行自定义数据以及动态创建其
视图将出现在屏幕之前，马上这个视图即将显示
视图已在屏幕上渲染完成。
视图将被从屏幕上移除之前执行。 视图已经被从屏幕上移除。 视图被销毁，此时需要在 init 和viewDidLoad 中
出现内存警告在内存不足时执行，并对所有非当
本视图的所有子视图将被销毁，以释放内存，此时开发者需要手动对 viewDidLoad 中创建的对象释放内存。
因为当这个视图再次显示在屏幕上的时候， viewLoad 、 viewDidLoad 以便再次构造视图。
五、论述题( 20分)
viewLoad 、
再次被调用，
请针对正泰中自智慧水务 APP的需求(见现场展示的原型)，论述您的开发思路和使用 的开发技术。