//
//  UserCenterItemViewModel.m
//  UserCellModual
//
//  Created by XH on 2018/5/17.
//  Copyright © 2018年 XH. All rights reserved.
//

#import "UserCenterItemViewModel.h"
#import "UserCenterItemModel.h"



@interface UserCenterItemViewModel ()

@property (nonatomic, assign, readwrite)  BOOL hasIndicatorImageAndLabel;
@end

@implementation UserCenterItemViewModel

- (instancetype)initWithItem:(UserCenterItemModel *)item{
    if (self = [super init]) {
        
        self.hasIndicatorImageAndLabel = YES;
        self.funcImageSize = CGSizeMake(funcImgWidth, funcImgWidth);
        _leftImageAndLabelGap = LeftMiddleGap;
        self.cellHeight = 44;
        self.detailImageSize = CGSizeMake(funcImgWidth, funcImgWidth);
        _indicatorLeftImageAndLabelGap = RightMiddleGap;
        self.isRedDot = NO;
        self.funcLeftGap = 15;
        self.bottomViewLeftGap = 15;
        self.bottomViewRightGap = 15;
        self.itemModel = item;
        
        self.isSwitchOn = NO;

    }
    return self;
}

- (void)setItemModel:(UserCenterItemModel *)itemModel{
    _itemModel = itemModel;
    
    
    self.funcNameLabelSize = [self sizeForTitle:_itemModel.funcName withFont:_itemModel.funcNameTextFont];
    if (self.funcNameLabelSize.width > funcNameWidthLimit) {
        CGSize size = self.funcNameLabelSize;
        size.width = funcNameWidthLimit;
        self.funcNameLabelSize = size;
    }
    
    if (_itemModel.detailTitle.length) { // 文字
        _detailTitleSize = [self sizeForTitle:_itemModel.detailTitle withFont:_itemModel.detailTextFont];
        if (_detailTitleSize.width > detailTitleSizeLimit) {
            CGSize size = _detailTitleSize;
            size.width = detailTitleSizeLimit;
            _detailTitleSize = size;
        }
        
        if (_itemModel.detailImage) {
            _hasIndicatorImageAndLabel = YES;
        }
    }
    
    if (_itemModel.detailImage) { // 图片
        CGFloat limitHeight = self.cellHeight - 2 * TopGap;
        CGFloat detailImageSizeWidth = 0.0f;
        CGFloat detailImageSizeHeight = 0.0f;
        if (_itemModel.detailImage.size.height < limitHeight) {
            detailImageSizeHeight = _itemModel.detailImage.size.height;
            detailImageSizeWidth = _itemModel.detailImage.size.width;
        }else{
            detailImageSizeHeight = limitHeight;
            detailImageSizeWidth = (_itemModel.detailImage.size.width / _itemModel.detailImage.size.height) * detailImageSizeHeight;
        }
        _detailImageSize = CGSizeMake(detailImageSizeWidth, detailImageSizeHeight);
        
        if (_itemModel.detailTitle.length) {
            _hasIndicatorImageAndLabel = YES;
        }
    }
    if (!(_itemModel.detailTitle.length && _itemModel.detailImage)) {
        _indicatorLeftImageAndLabelGap = 0;
    }
}


- (CGSize)sizeForTitle:(NSString *)title withFont:(UIFont *)font
{
    CGRect titleRect = [title boundingRectWithSize:CGSizeMake(FLT_MAX, FLT_MAX)
                                           options:NSStringDrawingUsesLineFragmentOrigin
                                        attributes:@{NSFontAttributeName : font}
                                           context:nil];
    
    return CGSizeMake(titleRect.size.width,
                      titleRect.size.height);
}
@end
