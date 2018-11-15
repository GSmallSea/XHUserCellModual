//
//  UserCenterTableView.m
//  UserCellModual
//
//  Created by XH on 2018/5/17.
//  Copyright © 2018年 XH. All rights reserved.
//

#import "UserCenterTableView.h"
#import "UserTableViewDataSource.h"
#import "UserCenterSectionModel.h"
#import "UserCenterItemViewModel.h"

@implementation UserCenterTableView

- (void)setTDataSource:(UserTableViewDataSource *)tDataSource{
    _tDataSource = tDataSource;
    self.dataSource = _tDataSource;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    
    if (self = [super initWithFrame:frame style:style]) {
        self.autoresizingMask =  UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.separatorStyle  = UITableViewCellSeparatorStyleNone;
        self.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
        if (@available(iOS 11.0, *)) {
            self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        self.delegate = self;
    }
    return self;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    UserCenterSectionModel *sections = self.tDataSource.viewModelsArray[indexPath.section];
    UserCenterItemViewModel *viewModel = sections.cellViewModelsArray[indexPath.row];
    return viewModel.cellHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UserCenterSectionModel *sections = self.tDataSource.viewModelsArray[section];
    UIView *sectionHeadview = [[UIView alloc] init];
    sectionHeadview.backgroundColor = sections.sectionHeaderColor;
    return sectionHeadview;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [[UIView alloc] init];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    UserCenterSectionModel *sections = self.tDataSource.viewModelsArray[section];
    return sections.sectionHeaderHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    UserCenterSectionModel *sections = self.tDataSource.viewModelsArray[section];
    return sections.sectionFooterHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    UserCenterSectionModel *sections = self.tDataSource.viewModelsArray[indexPath.section];
    UserCenterItemViewModel *viewModel = sections.cellViewModelsArray[indexPath.row];
    
    
    if (self.tdelegate && [self.tdelegate respondsToSelector:@selector(didSelectViewModel:atIndexPath:)]) {
        [self.tdelegate didSelectViewModel:viewModel atIndexPath:indexPath];
    }
    
}
@end
