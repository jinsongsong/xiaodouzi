//
//  AppDelegate.m
//  AA
//
//  Created by YKJ3 on 16/8/9.
//  Copyright © 2016年 YKJ3. All rights reserved.
//

#import "AppDelegate.h"
#import <CoreLocation/CoreLocation.h>

@interface AppDelegate ()<CLLocationManagerDelegate>

@property (nonatomic,strong) CLLocationManager *manager;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // 实例化对象
    _manager = [[CLLocationManager alloc] init];
    
    _manager.delegate = self;
    
    // 请求授权，记得修改的infoplist，NSLocationAlwaysUsageDescription（描述）
    [_manager requestAlwaysAuthorization];
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
#pragma mark - 代理方法，当授权改变时调用
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    
    
    // 获取授权后，通过
    if (status == kCLAuthorizationStatusAuthorizedAlways) {
        
        //开始定位(具体位置要通过代理获得)
        [_manager startUpdatingLocation];
        
        //设置精确度
        _manager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
        
        //设置过滤距离
        _manager.distanceFilter = 1000;
        
        //开始定位方向
        [_manager startUpdatingHeading];
    }
    
    
}

#pragma mark - 方向
- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading {
    
    //输出方向
    
    //地理方向
    NSLog(@"true = %f ",newHeading.trueHeading);
    
    // 磁极方向
    NSLog(@"mag = %f",newHeading.magneticHeading);
    
}

#pragma mark - 定位代理
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    
    //    NSLog(@"%@",locations);
    
    //获取当前位置
    CLLocation *location = manager.location;
    //获取坐标
    CLLocationCoordinate2D corrdinate = location.coordinate;
    
    //打印地址
    NSLog(@"latitude = %f longtude = %f",corrdinate.latitude,corrdinate.longitude);
    
    // 地址的编码通过经纬度得到具体的地址
    CLGeocoder *gecoder = [[CLGeocoder alloc] init];
    
    [gecoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        
        CLPlacemark *placemark = [placemarks firstObject];
        
        //打印地址
        NSLog(@"%@",placemark.name);
    }];
    
    // 通过具体地址去获得经纬度
    CLGeocoder *coder = [[CLGeocoder alloc] init];
    
    [coder geocodeAddressString:@"天河城" completionHandler:^(NSArray *placemarks, NSError *error) {
        
        
        
        NSLog(@"_________________________反编码");
        
        CLPlacemark *placeMark = [placemarks firstObject];
        
        
        NSLog(@"%@ lati = %f long = %f",placeMark.name,placeMark.location.coordinate.latitude,placeMark.location.coordinate.longitude);
        
    }];
    
    //停止定位
    [_manager stopUpdatingLocation];
    
}
@end
