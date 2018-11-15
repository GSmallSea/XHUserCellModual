//
//  UserCenterTableViewCell+AccessoryTitle.m
//  UserCellModual
//
//  Created by XH on 2018/5/18.
//  Copyright © 2018年 XH. All rights reserved.
//

#import "UserCenterTableViewCell+AccessoryTitle.h"
#import "UserCenterItemViewModel.h"
#import "UserCenterItemModel.h"

@implementation UserCenterTableViewCell (AccessoryTitle)

- (void)configureAccessoryTitleCellWithViewModel:(UserCenterItemViewModel *)viewModel{
    
    [self layoutLeftPartSubViewsWithViewModel:viewModel];
    
    [self addSubview:self.detailTitleLabel];
    

    self.detailTitleLabel.font = self.viewModel.itemModel.detailTextFont;
    self.detailTitleLabel.textColor = self.viewModel.itemModel.detailTextColor;
    self.detailTitleLabel.text = self.viewModel.itemModel.detailTitle;

    CGFloat detailTitleLabelW = self.viewModel.detailTitleSize.width;
    CGFloat detailTitleLabelH = self.viewModel.detailTitleSize.height;
    CGFloat detailTitleLabelY = (self.viewModel.cellHeight - detailTitleLabelH) * 0.5;

    self.detailTitleLabel.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - LeftGap - detailTitleLabelW
                                             , detailTitleLabelY
                                             , detailTitleLabelW, detailTitleLabelH);
    
}
@end
