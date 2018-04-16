//
//  ViewController.m
//  观察者模式
//
//  Created by 刘德福 on 2018/4/16.
//  Copyright © 2018年 Dreams. All rights reserved.
//

#import "ViewController.h"
#import "ObserverCenter.h"

static NSString *OBSERVER = @"OBSERVER";

@interface ViewController ()<ObserverCenterProtocol>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建订阅号
    [ObserverCenter createNumber:OBSERVER];
    
    // 添加订阅的用户到指定的书刊上
    [ObserverCenter addUser:self withNumebr:OBSERVER];
    
    // 发送消息
    [ObserverCenter sendMessage:@"2.22" withNumber:OBSERVER ];
}

- (void)accpetUserMessage:(id)userMessage subNumber:(NSString *)subNumber
{
    
    NSLog(@"uuserMessagese ====== :%@ subNumber ======:%@",userMessage,subNumber);
}

@end
