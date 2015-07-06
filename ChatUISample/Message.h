//
//  Message.h
//  ChatUISample
//
//  Created by akaikeyuto on 2015/06/24.
//  Copyright (c) 2015年 RedPond. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Message : NSObject

@property (strong, nonatomic) NSString *userId;
@property (strong, nonatomic) NSString *userName;
@property (strong, nonatomic) NSString *message;

+ (Message *) messageWithUserId:(NSString *)userId userName:(NSString *)userName message:(NSString *)message;
@end
