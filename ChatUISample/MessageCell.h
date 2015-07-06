//
//  MessageCell.h
//  ChatUISample
//
//  Created by akaikeyuto on 2015/06/24.
//  Copyright (c) 2015年 RedPond. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Message.h"

@interface MessageCell : UITableViewCell

@property (nonatomic)  UIImageView *imageViewIcon;
@property (nonatomic)  UILabel *labelUserName;
@property (nonatomic)  UILabel *labelMessage;

@property (strong, nonatomic) Message *message;

@property CGFloat messageLabelHeight;
@property CGFloat messageLabelWidth;

@end
