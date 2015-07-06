//
//  MyMessageCell.h
//  ChatUISample
//
//  Created by akaikeyuto on 2015/06/25.
//  Copyright (c) 2015年 RedPond. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Message.h"

@interface MyMessageCell : UITableViewCell

@property (nonatomic)  UILabel *labelMessage;

@property (strong, nonatomic) Message *message;

@property CGFloat messageLabelHeight;
@property CGFloat messageLabelWidth;

@end
