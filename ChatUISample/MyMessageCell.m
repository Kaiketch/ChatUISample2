//
//  MyMessageCell.m
//  ChatUISample
//
//  Created by akaikeyuto on 2015/06/25.
//  Copyright (c) 2015年 RedPond. All rights reserved.
//

#import "MyMessageCell.h"

@implementation MyMessageCell

- (void)awakeFromNib {
    // Initialization code
}

//レイアウトを初期化
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
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
    
    //セルの幅マイナスメッセージラベルの幅マイナスpadding10に配置
    _labelMessage.frame = CGRectMake(self.frame.size.width -_messageLabelWidth -10, 30, _messageLabelWidth, _messageLabelHeight);
    _labelMessage.backgroundColor = [UIColor redColor];
    _labelMessage.text = _message.message;
}

//iOS8以上のみ対象の場合
//- (CGSize)sizeThatFits:(CGSize)size{
//    
//    //cellのデフォルトの高さ（60）よりメッセージの高さ＋padding40の方が大きい場合は、cellをその高さにする。
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
