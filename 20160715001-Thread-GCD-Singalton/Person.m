//
//  Person.m
//  20160715001-Thread-GCD-Singalton
//
//  Created by Rainer on 16/7/15.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "Person.h"

@interface Person() <NSCopying>

@end

@implementation Person

// 定义一个全局的本类对象
static Person *_person;

/**
 *  提供一个单利对象的快速创建方法
 */
+ (instancetype)sharedPerson {
    return [[self alloc] init];
}

#warning 这里仅仅重写alloc方法是不严谨的，因为使用者可能会掉用+ (instancetype)allocWithZone:(struct _NSZone *)zone来创建对象，这样就达不到单利效果
#warning 因此我们必须要复写+ (instancetype)allocWithZone:(struct _NSZone *)zone方法才能更严谨，而+ (instancetype)alloc底层是掉用了该方法的，因此只复写这一个方法即可

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    // 1.定义一个一次运行的变量
    static dispatch_once_t dispatchOnceToken;
    
    // 2.掉用一次运行的函数
    dispatch_once(&dispatchOnceToken, ^{
        // 2.1.掉用super的方法初始化变量
        _person = [super allocWithZone:zone];
    });
    
    // 3.返回初始化好的变量
    return _person;
}

/**
 *  复写alloc方法，在这里实现单利代码
 */
//+ (instancetype)alloc {
//    // 1.定义一个一次运行的变量
//    static dispatch_once_t dispatchOnceToken;
//    
//    // 2.掉用一次运行的函数
//    dispatch_once(&dispatchOnceToken, ^{
//        // 2.1.掉用super的方法初始化变量
//        _person = [super alloc];
//    });
//    
//    // 3.返回初始化好的变量
//    return _person;
//}

/**
 *  复写copy，让copy也返回同一个对象
 */
- (id)copyWithZone:(NSZone *)zone {
    return _person;
}

@end
