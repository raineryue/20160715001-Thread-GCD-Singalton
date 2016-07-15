//
//  Car.m
//  20160715001-Thread-GCD-Singalton
//
//  Created by Rainer on 16/7/15.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "Car.h"

@interface Car() <NSCopying>

@end

@implementation Car

static Car *_car;

+ (instancetype)sharedCar {
    return [[self alloc] init];
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t dispatchOnceToken;
    
    dispatch_once(&dispatchOnceToken, ^{
        _car = [super allocWithZone:zone];
    });
    
    return _car;
}

- (id)copyWithZone:(NSZone *)zone {
    return _car;
}

@end
