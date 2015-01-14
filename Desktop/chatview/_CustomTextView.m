
//
//  _CustomTextView.m
//  _CustomViewController
//
//  Created by 任浩 on 14/12/15.
//  Copyright (c) 2014年 任浩. All rights reserved.
//

#import "_CustomTextView.h"

@implementation _CustomTextView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        self.font=[UIFont systemFontOfSize:17];
    }
    return self;
}

-(void)setContentOffset:(CGPoint)contentOffset{
    if (contentOffset.y > self.contentSize.height - self.frame.size.height && !self.decelerating && !self.tracking && !self.dragging)
        contentOffset = CGPointMake(contentOffset.x, self.contentSize.height - self.frame.size.height);

    [super setContentOffset:contentOffset];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
