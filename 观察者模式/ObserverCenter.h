//
//  ObserverCenter.h
//  观察者模式
//
//  Created by 刘德福 on 2018/4/16.
//  Copyright © 2018年 Dreams. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ObserverCenterProtocol.h"

@interface ObserverCenter : NSObject

// 创建书刊订阅号
+ (void)createNumber:(NSString *)observerNumber;

//移除订阅号
+ (void)removeNumebr:(NSString *)observerNumer;

//添加用户
+ (void)addUser:(id<ObserverCenterProtocol>)user withNumebr:(NSString *)observerNumber;

//移除用户
+ (void)removeUser:(id<ObserverCenterProtocol>)user withNumebr:(NSString *)observerNumber;

//发送消息
+ (void)sendMessage:(id)message withNumber:(NSString *)number;

@end
