//
//  UserCenterTableViewCell.m
//  UserCellModual
//
//  Created by XH on 2018/5/17.
//  Copyright © 2018年 XH. All rights reserved.
//

#import "UserCenterTableViewCell.h"
#import "UserCenterItemViewModel.h"
#import "UserCenterItemModel.h"
#import "UserRedDotImageView.h"

@implementation UserCenterTableViewCell
- (void)layoutLeftPartSubViewsWithViewModel:(UserCenterItemViewModel *)viewModel{
    
    
    self.viewModel = viewModel;
    // 存在最左边的图片
    if (self.viewModel.itemModel.funcImage) {
        [self.contentView addSubview:self.funcImageView];
        self.funcImageView.image = self.viewModel.itemModel.funcImage;
        
        CGFloat funcImageViewW = self.viewModel.funcImageSize.width;
        CGFloat funcImageViewH = self.viewModel.funcImageSize.height;
        CGFloat funcImageViewY = (self.viewModel.cellHeight - funcImageViewH) * 0.5;
        CGFloat funcImageViewX = self.viewModel.funcLeftGap;
        
        self.funcImageView.frame = CGRectMake(funcImageViewX,funcImageViewY,funcImageViewW,funcImageViewH);
    }
    
    // 存在最左边的名称
    if (self.viewModel.itemModel.funcName.length) {
        [self.contentView addSubview:self.funcTitleLabel];
        self.funcTitleLabel.font = self.viewModel.itemModel.funcNameTextFont;
        self.funcTitleLabel.textColor = self.viewModel.itemModel.funcNameTextColor;
        self.funcTitleLabel.text = self.viewModel.itemModel.funcName;
        
        CGFloat funcTitleLabelX = 0;
        if (self.funcImageView) {
            funcTitleLabelX = CGRectGetMaxX(self.funcImageView.frame) + self.viewModel.leftImageAndLabelGap;
        }else{
            funcTitleLabelX = self.viewModel.funcLeftGap;
        }
        CGFloat funcTitleLabelH = self.viewModel.funcNameLabelSize.height;
        CGFloat funcTitleLabelY = (self.viewModel.cellHeight - funcTitleLabelH) * 0.5;
        CGFloat funcTitleLabelW = self.viewModel.funcNameLabelSize.width;
        
        self.funcTitleLabel.frame = CGRectMake(funcTitleLabelX, funcTitleLabelY, funcTitleLabelW, funcTitleLabelH);
    }
    //  红点的判断
    self.funcImageView.isRedDot = self.viewModel.isRedDot;
    
    //! bottomViewLeftGap 大于0时
    if (self.viewModel.bottomViewLeftGap >= 0) {
        [self.contentView addSubview:self.bottomLineView];
        CGFloat bottomLineViewH = 0.5;
        CGFloat bottomLineViewX = self.viewModel.bottomViewLeftGap;
        CGFloat bottomLineViewW = [UIScreen mainScreen].bounds.size.width - bottomLineViewX - self.viewModel.bottomViewRightGap;
        CGFloat bottomLineViewY = self.viewModel.cellHeight - bottomLineViewH;
        self.bottomLineView.frame = CGRectMake(bottomLineViewX, bottomLineViewY, bottomLineViewW, bottomLineViewH);
    }
    
}
- (UserRedDotImageView *)funcImageView{
    if (_funcImageView == nil) {
        _funcImageView = [[UserRedDotImageView alloc] init];
    }
    return _funcImageView;
}

- (UILabel *)funcTitleLabel{
    if (_funcTitleLabel == nil) {
        _funcTitleLabel = [[UILabel alloc] init];
    }
    return _funcTitleLabel;
}

- (UILabel *)detailTitleLabel{
    if (_detailTitleLabel == nil) {
        _detailTitleLabel = [[UILabel alloc] init];
    }
    return _detailTitleLabel;
}

- (UIImageView *)detailImageView{
    if (_detailImageView == nil) {
        _detailImageView = [[UIImageView alloc] init];
    }
    return _detailImageView;
}
- (UIImageView *)indicatorArrow{
    if (_indicatorArrow == nil) {
        _indicatorArrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:IndicatorArrow]];
        CGFloat indicatorArrowW = _indicatorArrow.bounds.size.width;
        CGFloat indicatorArrowH = _indicatorArrow.bounds.size.height;
        _indicatorArrow.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - LeftGap - indicatorArrowW,
                                           (_viewModel.cellHeight - indicatorArrowH) * 0.5,
                                           indicatorArrowW,
                                           indicatorArrowH);
    }
    return _indicatorArrow;
}
- (UISwitch *)indicatorSwitch{
    if (_indicatorSwitch == nil) {
        _indicatorSwitch = [[UISwitch alloc] init];
        _indicatorSwitch.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - LeftGap - _indicatorSwitch.bounds.size.width, (_viewModel.cellHeight -  _indicatorSwitch.bounds.size.height)/2, _indicatorSwitch.bounds.size.width, _indicatorSwitch.bounds.size.height);
        [_indicatorSwitch addTarget:self action:@selector(switchTouched:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _indicatorSwitch;
}

- (UIView *)bottomLineView{
    if (_bottomLineView == nil) {
        _bottomLineView = [[UIView alloc] init];
        _bottomLineView.backgroundColor = [UIColor colorWithRed:214/255.0 green:213/255.0 blue:216/255.0 alpha:1];
    }
    return _bottomLineView;
}
#pragma mark- switch block
- (void)switchTouched:(UISwitch *)indicatorSwitch
{
    [indicatorSwitch setOn:!indicatorSwitch.isOn animated:NO];

    if (self.viewModel.switchValueDidChangeBlock){
        self.viewModel.switchValueDidChangeBlock(indicatorSwitch.isOn);
    }
}

- (UILabel *)logoutLabel{
    if (_logoutLabel == nil) {
        _logoutLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, _viewModel.cellHeight)];
        _logoutLabel.text = @"退出登录";
        _logoutLabel.textAlignment = NSTextAlignmentCenter;
        _logoutLabel.font = [UIFont systemFontOfSize:15];
        _logoutLabel.textColor = [UIColor redColor];
    }
    return _logoutLabel;
}

@end
