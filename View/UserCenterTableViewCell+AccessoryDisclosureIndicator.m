//
//  UserCenterTableViewCell+AccessoryDisclosureIndicator.m
//  UserCellModual
//
//  Created by XH on 2018/5/17.
//  Copyright © 2018年 XH. All rights reserved.
//

#import "UserCenterTableViewCell+AccessoryDisclosureIndicator.h"
#import "UserCenterItemModel.h"
@implementation UserCenterTableViewCell (AccessoryDisclosureIndicator)

- (void)configureAccessoryDisclosureIndicatorCellWithViewModel:(UserCenterItemViewModel *)viewModel{
    
    //! 左侧控件的配置
    [self layoutLeftPartSubViewsWithViewModel:viewModel];
    //! 右侧存在箭头
    [self.contentView addSubview:self.indicatorArrow];
    
    //右侧存在箭头+文字
    if (viewModel.itemModel.detailTitle.length && viewModel.detailTitleSize.width != 0) {
        [self.contentView addSubview:self.detailTitleLabel];
        [self configureDetailTitleLabel];
    }
    //右侧存在箭头+图片
    if (viewModel.itemModel.detailImage && viewModel.detailImageSize.height != 0) {
        [self.contentView addSubview:self.detailImageView];
        [self configureIndicatorLeftImage];
    }
    //! 图片存在圆角
    if (self.viewModel.itemModel.cornerRadius != 0) {
        self.detailImageView.layer.masksToBounds = YES;
        self.detailImageView.layer.cornerRadius = self.viewModel.itemModel.cornerRadius;
    }else{
        self.detailImageView.layer.masksToBounds = YES;
        self.detailImageView.layer.cornerRadius = 0;
    }
}
// 刷新右侧Label的frame
- (void)configureDetailTitleLabel{
    
    self.detailTitleLabel.font = self.viewModel.itemModel.detailTextFont;
    self.detailTitleLabel.textColor = self.viewModel.itemModel.detailTextColor;
    self.detailTitleLabel.text = self.viewModel.itemModel.detailTitle;
    
    if (!self.viewModel.hasIndicatorImageAndLabel) { //只存在右侧Label
        
        CGFloat detailTitleLabelW = self.viewModel.detailTitleSize.width;
        CGFloat detailTitleLabelH = self.viewModel.detailTitleSize.height;
        self.detailTitleLabel.frame = CGRectMake(self.indicatorArrow.frame.origin.x - LeftGap - detailTitleLabelW
                                                 ,( self.viewModel.cellHeight - detailTitleLabelH ) * 0.5
                                                 , detailTitleLabelW,
                                                 detailTitleLabelH);
    }else{ // 同时存在Label跟image
        CGFloat detailTitleLabelW = self.viewModel.detailTitleSize.width;
        CGFloat detailTitleLabelH = self.viewModel.detailTitleSize.height;
        CGFloat detailTitleLabelY = (self.viewModel.cellHeight - detailTitleLabelH) * 0.5;
        CGFloat detailTitleLabelX = 0;
        if (self.viewModel.isImageFirst) { //
            detailTitleLabelX = [UIScreen mainScreen].bounds.size.width - LeftGap - self.indicatorArrow.bounds.size.width - self.viewModel.indicatorLeftImageAndLabelGap - self.viewModel.detailImageSize.width - LeftGap - detailTitleLabelW;
        }else{
            detailTitleLabelX = [UIScreen mainScreen].bounds.size.width - LeftGap - self.indicatorArrow.bounds.size.width - LeftGap - detailTitleLabelW;
        }
        self.detailTitleLabel.frame = CGRectMake(detailTitleLabelX, detailTitleLabelY, detailTitleLabelW, detailTitleLabelH);

    }
}

- (void)configureIndicatorLeftImage{
    
    self.detailImageView.image = self.viewModel.itemModel.detailImage;
    
    CGFloat detailImageViewH = self.viewModel.detailImageSize.height;
    CGFloat detailImageViewW = self.viewModel.detailImageSize.width;
    CGFloat detailImageViewY = (self.viewModel.cellHeight - detailImageViewH)/2;

    if (!self.viewModel.hasIndicatorImageAndLabel) {
        //只存在右侧image
        CGFloat detailImageViewX = self.indicatorArrow.frame.origin.x - LeftGap - detailImageViewW;
        self.detailImageView.frame = CGRectMake(detailImageViewX, detailImageViewY, detailImageViewW , detailImageViewH);
    }else{
        //右侧Label和image同时存在
        if (self.viewModel.isImageFirst) {
            
            self.detailImageView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - LeftGap - self.indicatorArrow.bounds.size.width - LeftGap - detailImageViewW,
                                                    detailImageViewY,
                                                    detailImageViewW,
                                                    detailImageViewH);
            
        }else{
            
            self.detailImageView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - LeftGap - self.indicatorArrow.bounds.size.width - self.viewModel.indicatorLeftImageAndLabelGap - self.viewModel.detailTitleSize.width - LeftGap - detailImageViewW,
                                                    detailImageViewY,
                                                    detailImageViewW,
                                                    detailImageViewH);
        }
        
    }
}
@end
