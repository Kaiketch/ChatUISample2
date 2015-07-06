//
//  ChartViewController.m
//  ChatUISample
//
//  Created by akaikeyuto on 2014/10/26.
//  Copyright (c) 2014年 RedPond. All rights reserved.
//

#import "ChatViewController.h"
#import "MessageCell.h"
#import "Message.h"
#import "MyMessageCell.h"

@interface ChatViewController () <UITextViewDelegate, UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintTextViewHeight;


@property bool isObserving;
@property (strong, nonatomic) NSMutableArray* messageList;
@property (strong, nonatomic) NSString* myId;

- (IBAction)tapButton:(id)sender;

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _textView.delegate = self;
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorColor = [UIColor clearColor];
    
    _tableView.estimatedRowHeight = 60;
//    _tableView.rowHeight = UITableViewAutomaticDimension;
    
    [_tableView registerClass:[MessageCell class] forCellReuseIdentifier:@"MessageCell"];
    [_tableView registerClass:[MyMessageCell class] forCellReuseIdentifier:@"MyMessageCell"];
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //キーボド開閉の通知登録
    if (!_isObserving) {
        NSNotificationCenter *noticication = [NSNotificationCenter defaultCenter];
        [noticication addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
        [noticication addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
        
        //Observerになってるフラグをたてとく
        _isObserving = YES;
    }
    
    //以下ダミーデータ
    
    _myId = @"0";
    
    _messageList = [[NSMutableArray alloc]init];
    [_messageList addObject:[Message messageWithUserId:@"1" userName:@"ユーザー1" message:@"こんばんはこんばんはこんばんはこんばんはこんばんはこんばんはこんばんはこんばんは"]];
    [_messageList addObject:[Message messageWithUserId:@"2" userName:@"ユーザー2" message:@"こんばんは"]];
    [_messageList addObject:[Message messageWithUserId:@"0" userName:@"自分" message:@"こんばんはこんばんはこんばんはこんばんはこんばんはこんばんはこんばんはこんばんはこんばんはこんばんはこんばんはこんばんはこんばんはこんばんはこんばんは"]];
    [_messageList addObject:[Message messageWithUserId:@"1" userName:@"ユーザー1" message:@"こんばんは"]];
    [_messageList addObject:[Message messageWithUserId:@"3" userName:@"ユーザー3" message:@"こんばんはこんばんはこんばんはこんばんはこんばんは"]];
    [_messageList addObject:[Message messageWithUserId:@"4" userName:@"ユーザー4" message:@"こ"]];
    [_messageList addObject:[Message messageWithUserId:@"2" userName:@"ユーザー2" message:@"こんばんはこんばんは"]];
    [_messageList addObject:[Message messageWithUserId:@"0" userName:@"自分" message:@"1ほげほげ"]];
    [_messageList addObject:[Message messageWithUserId:@"1" userName:@"ユーザー1" message:@"こんばんはこんばんはこんばんはこんばんはこんばんはこんばんはこんばんはこんばんはこんばんはこんばんはこんばんはこんばんはこんばんはこんばんはこんばんはこんばんはこんばんはこんばんはこんばんはこんばんはこんばんはこんばんは"]];
    [_messageList addObject:[Message messageWithUserId:@"1" userName:@"ユーザー1" message:@"こんばんはこんばんはこんばんはこんばんは"]];
    [_messageList addObject:[Message messageWithUserId:@"0" userName:@"自分" message:@"こんばんはこんばんはこんばんは"]];
    [_messageList addObject:[Message messageWithUserId:@"4" userName:@"ユーザー4" message:@"こんばんは"]];
    [_messageList addObject:[Message messageWithUserId:@"2" userName:@"ユーザー2" message:@"こんばんはこんばんはこんばんはこんばんは"]];
    
    [_tableView reloadData];
    
    [_tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:[_messageList count]-1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:NO];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    //キーボード開閉の通知解除
    if (_isObserving) {
        NSNotificationCenter *noticication = [NSNotificationCenter defaultCenter];
        [noticication removeObserver:self name:UIKeyboardWillShowNotification object:nil];
        [noticication removeObserver:self name:UIKeyboardWillHideNotification object:nil];
        
        //Observerになってるフラグをおとす
        _isObserving = NO;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


//キーボード表示
-(void) keyboardWillShow:(NSNotification *) notification{
    
    // キーボードのサイズを取得
    CGRect rect = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    // キーボード表示アニメーションのdurationを取得
    NSTimeInterval duration = [[[notification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    // キーボード表示と同じdurationのアニメーションでViewを移動させる
    [UIView animateWithDuration:duration animations:^{
        CGAffineTransform transform = CGAffineTransformMakeTranslation(0, -rect.size.height);
        self.view.transform = transform;
    } completion:NULL];
}

//キーボード非表示
-(void) keyboardWillHide:(NSNotification *)notification{
    
    // キーボード表示アニメーションのduration
    NSTimeInterval duration = [[[notification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    // Viewを元に戻す
    [UIView animateWithDuration:duration animations:^{
        self.view.transform = CGAffineTransformIdentity;
    } completion:NULL];
}


//TextViewの入力や変更が終わると呼ばれる
- (void)textViewDidChange:(UITextView *)textView {
    
    //高さを広げる上限を指定
    float maxHeight = 80.0;
    
    if(_textView.frame.size.height < maxHeight){
        
        //高さを変更
        CGSize size = [_textView sizeThatFits:_textView.frame.size];
        _constraintTextViewHeight.constant = size.height;
    }
}

//TextViewの入力が始まると呼ばれる
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    //カーソルの位置へスクロールさせる
    [_textView scrollRangeToVisible:_textView.selectedRange];
    
    return YES;
}

- (IBAction)tapButton:(id)sender {
    
    NSString* comment = _textView.text;
    
    //コメントを追加
    if(comment != nil && ![comment isEqualToString:@""]){
        //TextViewを元に戻す
        _textView.text = nil;
        CGSize size = [_textView sizeThatFits:_textView.frame.size];
        _constraintTextViewHeight.constant = size.height;
        
        //キーボードを閉じる
        [_textView resignFirstResponder];
        
        //オブジェクトを追加
        [_messageList addObject:[Message messageWithUserId:@"0" userName:@"自分" message:comment]];
        [_tableView reloadData];
        
        //最下部スクロールを遅延実行
        [self performSelector:@selector(scroll)
                   withObject:nil afterDelay:0.5];
    }
}

- (void)scroll
{
    //最下部までスクロール
    [_tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:[_messageList count]-1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}


//高さと幅を算出するメソッド
- (CGSize)getLabelSize:(NSString *)text font:(UIFont *)font width:(float)width height:(float)height{
    
    CGSize maxSize = CGSizeMake(width, height);
    NSDictionary *attr = @{NSFontAttributeName: font};
    
    CGSize size = [text boundingRectWithSize:maxSize
                                     options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine
                                  attributes:attr
                                     context:nil
                   ].size;
    return size;
}


////////////////////////////////////////////////////////////////////////////////
#pragma mark - Table view data source
////////////////////////////////////////////////////////////////////////////////

//tableViewのタップイベント
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if([_messageList count] > 0){
        return [_messageList count];
    } else return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //iOS8以上
//    if([[[UIDevice currentDevice] systemVersion] floatValue]>=8.0){
//        
//        return UITableViewAutomaticDimension;
//        
//    } else {
    
        //iOS8未満

        Message* msg = _messageList[indexPath.row];
        
        //メッセージラベルの最大幅を取得（画面の幅マイナスpadding70）
        CGFloat maxMessageLabelWidth = self.view.frame.size.width - 70;
        
        //メッセージラベルの高さを取得
        CGFloat messageLabelHeight = [self getLabelSize:msg.message font:[UIFont systemFontOfSize:15.0] width:maxMessageLabelWidth height:CGFLOAT_MAX].height;
        
        //cellのデフォルトの高さ（ここでは60）よりメッセージの高さ＋padding40の方が大きい場合は、cellをその高さにする。
        CGFloat cellHeight = 60;
        if(messageLabelHeight + 40 > cellHeight) cellHeight = messageLabelHeight + 40;
        
        //セルのサイズを返す
        return cellHeight;
//    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Message* msg = _messageList[indexPath.row];
    
    //メッセージラベルの最大幅を取得（画面の幅マイナスpadding70）
    CGFloat maxMessageLabelWidth = self.view.frame.size.width - 70;
    
    //メッセージラベルの高さを取得
    CGFloat messageLabelHeight = [self getLabelSize:msg.message font:[UIFont systemFontOfSize:15.0] width:maxMessageLabelWidth height:CGFLOAT_MAX].height;
    
    //メッセージラベルの幅を所得。
    CGFloat messageLabelWidth = [self getLabelSize:msg.message font:[UIFont systemFontOfSize:15.0] width:maxMessageLabelWidth height:messageLabelHeight].width;
    
    //自分か自分以外かをチェック
    if([msg.userId isEqualToString:_myId]){
        
        MyMessageCell *cell = (MyMessageCell*)[tableView dequeueReusableCellWithIdentifier:@"MyMessageCell" forIndexPath:indexPath];
        
        cell.message = msg;
        cell.messageLabelHeight = messageLabelHeight;
        cell.messageLabelWidth = messageLabelWidth;
        
        // ハイライトなし
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
        
    } else{
        MessageCell *cell = (MessageCell*)[tableView dequeueReusableCellWithIdentifier:@"MessageCell" forIndexPath:indexPath];
        
        cell.message = msg;
        cell.messageLabelHeight = messageLabelHeight;
        cell.messageLabelWidth = messageLabelWidth;
        
        // ハイライトなし
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    }
}

@end
