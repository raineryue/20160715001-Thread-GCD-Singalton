//
//  Car.h
//  20160715001-Thread-GCD-Singalton
//
//  Created by Rainer on 16/7/15.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject

@property (nonatomic, copy) NSString *name;

+ (instancetype)sharedCar;

@end
