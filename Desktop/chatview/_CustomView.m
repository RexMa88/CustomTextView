//
//  _CustomView.m
//  _CustomViewController
//
//  Created by 任浩 on 14/12/15.
//  Copyright (c) 2014年 任浩. All rights reserved.
//

#import "_CustomView.h"
#import "UIColor+CustomColors.h"
@implementation _CustomView
@synthesize textView=_textView;
@synthesize offsetHeight;
@synthesize offsetY;
@synthesize height;
@synthesize realHeight;
@synthesize isCheck;
@synthesize custonHeight;
@synthesize sendButton;
@synthesize delegate;
@synthesize isCheck1;
@synthesize defaultHeight;
@synthesize defaultRect;

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1];
        sendButton=[UIButton buttonWithType:UIButtonTypeCustom];
        sendButton.frame=CGRectMake(270, 5, 40, 36);
//        [sendButton setTitle:@"发送" forState:UIControlStateNormal];
        [sendButton setImage:[UIImage imageNamed:@"share.png"] forState:UIControlStateNormal];
        [sendButton setTitleColor:[UIColor customBlueColor] forState:UIControlStateNormal];

        [self addSubview:sendButton];
        
        _textView=[[_CustomTextView alloc] initWithFrame:CGRectMake(10, 5, 250, 36)];
        _textView.backgroundColor=[UIColor whiteColor];
        _textView.delegate=self;
        _textView.layer.masksToBounds=YES;
        _textView.layer.cornerRadius=5;
        _textView.layer.borderColor=[UIColor grayColor].CGColor;
        _textView.layer.borderWidth=0.2;
        _textView.returnKeyType=UIReturnKeyDone;
        defaultRect=_textView.frame;
        
        isCheck1=YES;
        _textView.scrollEnabled=NO;
        [self addSubview:_textView];
        offsetY=0;
        offsetHeight=0;
        height=self.frame.size.height-_textView.frame.size.height;
            }
    return self;
}

//kov监听contentsize
-(void)textViewDidChange:(UITextView *)textView{
    
    int lines=[textView sizeThatFits:textView.frame.size].height/_textView.font.lineHeight;
//    if (lines==1) {
//        realHeight=[textView sizeThatFits:textView.frame.size].height;
//        height=0;
////        if (realHeight!=[textView sizeThatFits:textView.frame.size].height) {
//            height=[textView sizeThatFits:textView.frame.size].height-realHeight+10;
//            realHeight=[textView sizeThatFits:textView.frame.size].height+10;
//            self.frame=CGRectMake(self.frame.origin.x, self.frame.origin.y-height, self.frame.size.width, realHeight);
////        }
//    }
//    NSLog(@"lines is %d",lines);
     if (lines>3) {
        [self textViewOffsetAdjust:textView];
//        textView.scrollEnabled=YES;
        [textView flashScrollIndicators];

//        NSLog(@"textcontentOffset= %f",textView.contentOffset.y);
       
    }
    else if (lines==3){
        CGRect rect=textView.frame;
        textView.frame=CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, [textView sizeThatFits:textView.frame.size].height);
        textView.scrollEnabled=YES;
        if (custonHeight!=[textView sizeThatFits:textView.frame.size].height) {
            height=[textView sizeThatFits:textView.frame.size].height-realHeight+10;
            realHeight=[textView sizeThatFits:textView.frame.size].height+10;
            self.frame=CGRectMake(self.frame.origin.x, self.frame.origin.y-height, self.frame.size.width, realHeight);
            custonHeight=[textView sizeThatFits:textView.frame.size].height;
        }
    }
    else{
        if (lines==1&&isCheck1) {
            //height本身是高度为1的
            realHeight=[textView sizeThatFits:textView.frame.size].height+10;
            custonHeight=[textView sizeThatFits:textView.frame.size].height;
            defaultHeight=realHeight;
        }
        else{
            isCheck1=NO;
        }
        if (custonHeight!=[textView sizeThatFits:textView.frame.size].height) {
            height=[textView sizeThatFits:textView.frame.size].height-realHeight+10;

            realHeight=[textView sizeThatFits:textView.frame.size].height+10;
            custonHeight=[textView sizeThatFits:textView.frame.size].height;
            self.frame=CGRectMake(self.frame.origin.x, self.frame.origin.y-height, self.frame.size.width, realHeight);
        }
        
        textView.scrollEnabled=NO;
        CGRect rect=textView.frame;
       
        textView.frame=CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, [textView sizeThatFits:textView.frame.size].height);
        
        if ([textView.text isEqualToString:@""]) {
            self.isCheck=NO;
//            textView.frame=CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, defaultHeight);
            
        }
        
    }
    
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
    }
    return YES;
}


-(BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    self.isCheck=NO;
    return YES;
}


-(void)sendOnclick:(id)sender{
    if ([delegate respondsToSelector:@selector(CustomTextViewSendOnclick)]) {
        [delegate CustomTextViewSendOnclick];
    }
}




- (void)textViewOffsetAdjust:(UITextView *)textView
{

//    CGRect r = [textView caretRectForPosition:textView.selectedTextRange.end];
//    CGFloat caretY =  MAX(r.origin.y - textView.frame.size.height + r.size.height + 8, 0);
//    if (textView.contentOffset.y < caretY){
//        NSLog(@"careY is %f %f",caretY,textView.contentOffset.y);
//        textView.contentOffset = CGPointMake(0, caretY);
//        
//    }
    

}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
