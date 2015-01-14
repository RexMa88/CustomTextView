//
//  _CustomView.h
//  _CustomViewController
//
//  Created by 任浩 on 14/12/15.
//  Copyright (c) 2014年 任浩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "_CustomTextView.h"

@protocol CustomTextViewSendOnclick <NSObject>

-(void)CustomTextViewSendOnclick;

@end


@interface _CustomView : UIView<UITextViewDelegate>

@property (nonatomic,strong)_CustomTextView  * textView;
@property (nonatomic)CGFloat offsetHeight;
@property (nonatomic)CGFloat offsetY;
@property (nonatomic)CGFloat height;
@property (nonatomic)CGFloat realHeight;
@property (nonatomic)CGFloat custonHeight;
@property (nonatomic)BOOL isCheck1;
@property (nonatomic,strong)UIButton * sendButton;
@property (nonatomic,weak)id<CustomTextViewSendOnclick>delegate;
@property (nonatomic)CGFloat y;
@property (nonatomic )int linesDefault;
@property (nonatomic)BOOL isCheck;
@property (nonatomic)CGFloat defaultHeight;
@property (nonatomic)CGRect defaultRect;
@end
