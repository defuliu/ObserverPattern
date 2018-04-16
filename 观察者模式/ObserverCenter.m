//
//  ObserverCenter.m
//  观察者模式
//
//  Created by 刘德福 on 2018/4/16.
//  Copyright © 2018年 Dreams. All rights reserved.
//

#import "ObserverCenter.h"

static NSMutableDictionary *_observerDict = nil;

@implementation ObserverCenter

+ (void)initialize
{
    if (self == [ObserverCenter class]) {
        _observerDict = [NSMutableDictionary dictionary];
    }
}

//创建书刊订阅号
+ (void)createNumber:(NSString *)observerNumber
{
    NSHashTable *hashTable = [self existNumber:observerNumber];
    if (hashTable == nil) {
        hashTable = [NSHashTable weakObjectsHashTable];
        [_observerDict setObject:hashTable forKey:observerNumber];
    }
}

//移除订阅号
+ (void)removeNumebr:(NSString *)observerNumer
{
    NSHashTable *hashTable = [self existNumber:observerNumer];
    if (hashTable) {
        [_observerDict removeObjectForKey:observerNumer];
    }
}

//添加用户
+ (void)addUser:(id<ObserverCenterProtocol>)user withNumebr:(NSString *)observerNumber
{
    NSHashTable *hashTable = [self existNumber:observerNumber];
    [hashTable addObject:user];
    
}

//移除用户
+ (void)removeUser:(id<ObserverCenterProtocol>)user withNumebr:(NSString *)observerNumber
{
    NSHashTable *hashTable = [self existNumber:observerNumber];
    [hashTable removeObject:user];
}

//发送消息
+ (void)sendMessage:(id)message withNumber:(NSString *)number
{
    //获取订阅号
    NSHashTable *hashTable = [self existNumber:number];
    
    if (hashTable) {
        NSEnumerator *enumerator  = [hashTable objectEnumerator];
        
        id <ObserverCenterProtocol> object = nil;
        
        while (object = [enumerator nextObject]) {
            
            NSLog(@"xxxxxx:%@",[enumerator nextObject]);
            if ([object respondsToSelector:@selector(accpetUserMessage:subNumber:)]) {
                
                [object accpetUserMessage:message subNumber:number];
            }
        }
    }
}


+ (NSHashTable *)existNumber:(NSString *)number
{
      return [_observerDict objectForKey:number];
}


@end
