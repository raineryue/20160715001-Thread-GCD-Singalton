//
//  Person.h
//  20160715001-Thread-GCD-Singalton
//
//  Created by Rainer on 16/7/15.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger age;

/**
 *  提供一个单利对象的快速创建方法
 */
+ (instancetype)sharedPerson;

@end
