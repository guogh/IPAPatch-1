//
//  IPAPatchEntry.m
//  IPAPatch
//
//  Created by wutian on 2017/3/17.
//  Copyright © 2017年 Weibo. All rights reserved.
//

#import "IPAPatchEntry.h"
#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "CaptainHook.h"


@implementation IPAPatchEntry


+ (void)load
{
    // DO YOUR WORKS...
    
    // For Example:
//    [self for_example_showAlert];
    
    
//    Class cls = NSClassFromString(@"WCDeviceStepObject");
//    
//    SEL s = NSSelectorFromString(@"m7StepCount");
//    Method m0 =  class_getInstanceMethod(cls, s);
//    
//    // 运行时交换两个方法的实现
//    Method m2 = class_getClassMethod([IPAPatchEntry class], @selector(m7StepCount));
//    method_exchangeImplementations(m0, m2);
//    
//    
//    Method m3 =  class_getInstanceMethod(cls, NSSelectorFromString(@"hkStepCount"));
//    Method m4 = class_getClassMethod([IPAPatchEntry class], @selector(hkStepCount));
//    method_exchangeImplementations(m3, m4);
    
    NSLog(@"IPAPatchEntry  \n");
    
}

+ (void)for_example_showAlert
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"Hacked" message:@"Hacked with IPAPatch" preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:NULL]];
        UIViewController * controller = [UIApplication sharedApplication].keyWindow.rootViewController;
        while (controller.presentedViewController) {
            controller = controller.presentedViewController;
        }
        [controller presentViewController:alertController animated:YES completion:NULL];
    });
}

- (unsigned int)m7StepCount{
    NSLog(@"m7StepCount 9999 \n");
    return  9999;
}

- (unsigned int)hkStepCount{
    NSLog(@"hkStepCount 9989 \n");
    return  9989;
}


@end



@class WCDeviceStepObject;

CHDeclareClass(WCDeviceStepObject);

CHOptimizedMethod(0, self, unsigned long, WCDeviceStepObject, m7StepCount) {
        NSLog(@"m7StepCount 666666\n");
        return  666666;
}

CHOptimizedMethod(0, self, unsigned long, WCDeviceStepObject, hkStepCount) {
        NSLog(@"hkStepCount 666666\n");
        return  666666;
}

CHConstructor {
    @autoreleasepool {
        
        CHLoadLateClass(WCDeviceStepObject);
        
        

        CHHook(0, WCDeviceStepObject, m7StepCount);
        CHHook(0, WCDeviceStepObject, hkStepCount);
    }
}
