//
//  ViewController.m
//  GCD
//
//  Created by 谢吴军 on 2020/3/19.
//  Copyright © 2020 谢吴军. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    dispatch_queue_t main = dispatch_get_main_queue();
    NSLog(@"start");
    dispatch_async(main, ^{
        NSLog(@"downloadA---%@", [NSThread currentThread]);
    });
    dispatch_async(main, ^{
        NSLog(@"downloadB---%@", [NSThread currentThread]);
    });
    dispatch_async(main, ^{
        NSLog(@"downloadC---%@", [NSThread currentThread]);
    });
    NSLog(@"end");
    /**
     start - downloadA - downloadB - downloadC - end
     */
}


@end
