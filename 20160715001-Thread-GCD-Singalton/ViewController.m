//
//  ViewController.m
//  20160715001-Thread-GCD-Singalton
//
//  Created by Rainer on 16/7/15.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "Car.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
#warning 这里使用 alloc 创建对象
    Person *person1 = [[Person alloc] init];
    Person *person2 = [[Person alloc] init];
    Person *person3 = [[Person alloc] init];
    
    // 这里打印可以看出内存一样，可见之创建了一次，实现了单利
    NSLog(@"%@   %@    %@", person1, person2, person3);
    
#warning 这里使用 allocWithZone: 创建对象
    Person *person4 = [[Person allocWithZone:nil] init];
    Person *person5 = [[Person allocWithZone:nil] init];
    Person *person6 = [[Person allocWithZone:nil] init];
    
    // 这里打印可以看出内存是不一样，可见每一次都创建了一个新对象，所以以上的单利设计是不严谨的
    NSLog(@"%@   %@    %@", person4, person5, person6);
    
#warning 这里使用 copy 创建对象
    Person *person = [[Person alloc] init];
    
    Person *person7 = [person copy];
    Person *person8 = [person copy];
    Person *person9 = [person copy];
    
    // 这里打印可以看出内存是不一样，可见每一次都创建了一个新对象，所以以上的单利设计是不严谨的
    NSLog(@"%@   %@    %@", person7, person8, person9);
    
#warning 这里使用 快速创建对象的方法 创建对象
    Person *person10 = [Person sharedPerson];
    Person *person11 = [Person sharedPerson];
    Person *person12 = [Person sharedPerson];
    
    // 这里打印可以看出内存是不一样，可见每一次都创建了一个新对象，所以以上的单利设计是不严谨的
    NSLog(@"%@   %@    %@", person10, person11, person12);
    
#warning 这里使用 快速创建对象的方法 创建对象
    Car *car10 = [Car sharedCar];
    Car *car11 = [Car sharedCar];
    Car *car12 = [Car sharedCar];
    
    // 这里打印可以看出内存是不一样，可见每一次都创建了一个新对象，所以以上的单利设计是不严谨的
    NSLog(@"%@   %@    %@", car10, car11, car12);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
