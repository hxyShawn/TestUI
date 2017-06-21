//
//  SocketManager.h
//  textAll
//
//  Created by liangqi on 17/6/15.
//  Copyright © 2017年 hexiaoyi. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CocoaAsyncSocket;
@interface SocketManager : NSObject
@property(nonatomic,strong) GCDAsyncSocket *socket;

//单例
+ (instancetype)sharedSocketManager;

//连接
- (void)connectToServer;

//断开
- (void)cutOffSocket;
@end
