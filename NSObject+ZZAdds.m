//
//  NSObject+ZZAdds.m
//  demo
//
//  Created by Cun ethan on 2019/7/25.
//  Copyright © 2019 Cun ethan. All rights reserved.
//

#import "NSObject+ZZAdds.h"
#import <objc/runtime.h>

@implementation NSObject (ZZAdds)

- (void)_showAlertController:(UIAlertController *)aAlert
{
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
    [aAlert addAction:okAction];
    
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    UIViewController *rootViewController = window.rootViewController;
    [rootViewController presentViewController:aAlert animated:YES completion:nil];
}

- (void)showAlertWithMessage:(NSString *)aMsg
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"o(TωT)o" message:aMsg preferredStyle:UIAlertControllerStyleAlert];
    [self _showAlertController:alertController];
}

- (void)showAlertWithTitle:(NSString *)aTitle
                   message:(NSString *)aMsg
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:aTitle message:aMsg preferredStyle:UIAlertControllerStyleAlert];
    [self _showAlertController:alertController];
}

+ (BOOL)swizzleInstanceMethod:(SEL)originalSel with:(SEL)newSel {
    
    //获取某个类的对象方法： class_getInstanceMethod
    Method originalMethod = class_getInstanceMethod(self, originalSel);
    Method newMethod = class_getInstanceMethod(self, newSel);
    
    if (!originalMethod || !newMethod) return NO;
    //给某个类添加方法 class_addMethod，获取一个方法的实现IMP：class_getMethodImplementation，
    //获取方法的编码方式 method_getTypeEncoding
    class_addMethod(self,
                    originalSel,
                    class_getMethodImplementation(self, originalSel),
                    method_getTypeEncoding(originalMethod));
    BOOL didAddMethod = class_addMethod(self,
                                        newSel,
                                        class_getMethodImplementation(self, newSel),
                                        method_getTypeEncoding(newMethod));
    
    /*
     如果didAddMethod返回YES，说明当前类中没有要替换方法的实现，我们需要在父类中去寻找。这个时候就需要用到method_getImplementation去获取class_getInstanceMethod里面的方法实现。然后再进行class_replaceMethod来实现Swizzling。
     
     */
    if (didAddMethod) {
        
        class_replaceMethod(self, newSel, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }else{
        
        method_exchangeImplementations(class_getInstanceMethod(self, originalSel),
                                       class_getInstanceMethod(self, newSel));
    }
    
    //交换两个方法的实现IMP：method_exchangeImplementations
    
    return YES;
}

+ (BOOL)swizzleClassMethod:(SEL)originalSel with:(SEL)newSel {
    
    /*
     对象的实例方法调用时，通过对象的 isa 在类中获取方法的实现。
     类对象的类方法调用时，通过类的 isa 在元类中获取方法的实现。
     
     上面这两句话是简书 神经病院Objective-C Runtime入院第一天——isa和Class 里面的，
     所以 object_getClass(self) 其实是获取元类,然后在元类里找类方法的实现
     
     */
    
    //获取类：object_getClass
    Class class = object_getClass(self);
    Method originalMethod = class_getInstanceMethod(class, originalSel);
    Method newMethod = class_getInstanceMethod(class, newSel);
    if (!originalMethod || !newMethod) return NO;
    //交换两个方法的实现IMP：method_exchangeImplementations
    method_exchangeImplementations(originalMethod, newMethod);
    return YES;
}

- (void)setAssociateValue:(id)value withKey:(void *)key{
    //添加属性objc_setAssociatedObject,
    // OBJC_ASSOCIATION_RETAIN_NONATOMIC ： (nonatomic,retain)
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

- (void)setAssociateWeakValue:(id)value withKey:(void *)key {
    
    //OBJC_ASSOCIATION_ASSIGN: (nonatomic,assign)
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_ASSIGN);
}

- (id)getAssociatedValueForKey:(void *)key {
    //根绝key获取属性
    return objc_getAssociatedObject(self, key);
}


- (void)removeAssociatedValues {
    //删除当前类的所有属性
    objc_removeAssociatedObjects(self);
}

+ (NSArray *)getAllProperties {
    //用于存入属性数量
    unsigned int outCount = 0;
    //获取属性数组
    objc_property_t *propertyList = class_copyPropertyList([self class], &outCount);
    
    NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:outCount];
    //遍历数组
    for (int i = 0; i < outCount; ++i) {
        objc_property_t property = propertyList[i];
        //获取属性名
        const char *cName = property_getName(property);
        //将其转换成c字符串
        NSString *propertyName = [NSString stringWithCString:cName encoding:NSUTF8StringEncoding];
        //        加入数组
        [arrM addObject:propertyName];
    }
    //在使用了c函数的creat, copy等函数是记得手动释放,要不然会引起内存泄露问题
    free(propertyList);
    return arrM.copy;
    
}
@end
