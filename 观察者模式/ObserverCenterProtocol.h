//
//  ObserverCenter.h
//  观察者模式
//
//  Created by 刘德福 on 2018/4/16.
//  Copyright © 2018年 Dreams. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ObserverCenterProtocol <NSObject>

//用户的信息和从某一刊物接受的信息
- (void)accpetUserMessage:(id)userMessage subNumber:(NSString *)subNumber;

@end
