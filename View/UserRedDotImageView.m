//
//  UserRedDotImageView.m
//  UserCellModual
//
//  Created by XH on 2018/5/18.
//  Copyright © 2018年 XH. All rights reserved.
//

#import "UserRedDotImageView.h"

@interface UserRedDotImageView ()

@property (nonatomic,weak) UIView *redDotView;

@end

@implementation UserRedDotImageView


- (instancetype)init{
    if (self = [super init]) {
        [self addRedDot];
    }
    return self;
}

- (void)setIsRedDot:(BOOL)isRedDot{
    _isRedDot = isRedDot;
    
    if (_isRedDot) {
        self.redDotView.hidden = NO;
    }else{
        self.redDotView.hidden = YES;
    }
}
- (void)addRedDot{
    UIView *redDotView = [[UIView alloc] init];
    redDotView.backgroundColor = [UIColor redColor];
    redDotView.layer.masksToBounds = YES;
    [self addSubview:redDotView];
    self.redDotView = redDotView;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat redDotViewW = 8;
    CGFloat redDotViewH = redDotViewW;
    CGFloat redDotViewX = CGRectGetWidth(self.frame) - redDotViewW * 0.5;
    CGFloat redDotViewY = 0;
    
    self.redDotView.frame = CGRectMake(redDotViewX, redDotViewY, redDotViewW, redDotViewH);
    self.redDotView.layer.cornerRadius = self.redDotView.frame.size.height * 0.5;
}
@end
