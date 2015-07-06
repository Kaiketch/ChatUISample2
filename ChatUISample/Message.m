//
//  Message.m
//  ChatUISample
//
//  Created by akaikeyuto on 2015/06/24.
//  Copyright (c) 2015年 RedPond. All rights reserved.
//

#import "Message.h"

@implementation Message

+ (Message *) messageWithUserId:(NSString *)userId userName:(NSString *)userName message:(NSString *)message{
    
    Message *msg = [[Message alloc]init];
    msg.userId = userId;
    msg.userName = userName;
    msg.message = message;
    
    return msg;
}
@end
