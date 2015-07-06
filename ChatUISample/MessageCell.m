//
//  MessageCell.m
//  ChatUISample
//
//  Created by akaikeyuto on 2015/06/24.
//  Copyright (c) 2015年 RedPond. All rights reserved.
//

#import "MessageCell.h"

@implementation MessageCell

- (void)awakeFromNib {
    // Initialization code
}

//レイアウトを初期化
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _imageViewIcon = [[UIImageView alloc]init];
        [self addSubview:_imageViewIcon];
        
        _labelUserName = [[UILabel alloc] init];
        _labelUserName.font = [UIFont systemFontOfSize:15];
        [self addSubview:_labelUserName];
        
        _labelMessage = [[UILabel alloc]init];
        _labelMessage.font = [UIFont systemFontOfSize:15];
        _labelMessage.numberOfLines = 0;
        _labelMessage.lineBreakMode = NSLineBreakByCharWrapping;
        [self addSubview:_labelMessage];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //ユーザーアイコン
    _imageViewIcon.frame = CGRectMake(10, 10, 40, 40);
    _imageViewIcon.backgroundColor = [UIColor grayColor];
    
    //ユーザー名
    _labelUserName.frame = CGRectMake(60, 10, 180, 15);
    _labelUserName.text = _message.userName;
    
    //メッセージ部分
    _labelMessage.frame = CGRectMake(60, 30, _messageLabelWidth, _messageLabelHeight);
    _labelMessage.backgroundColor = [UIColor blueColor];
    _labelMessage.text = _message.message;
}

//iOS8以上のみ対象の場合
//- (CGSize)sizeThatFits:(CGSize)size{
//    
//    //cellのデフォルトの高さ（ここでは60）よりメッセージの高さ＋padding40の方が大きい場合は、cellをその高さにする。
//    CGFloat cellHeight = 60;
//    if(_messageLabelHeight + 40 > cellHeight) cellHeight = _messageLabelHeight + 40;
//    
//    //セルのサイズを返す
//    return CGSizeMake(self.frame.size.width, cellHeight);
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
