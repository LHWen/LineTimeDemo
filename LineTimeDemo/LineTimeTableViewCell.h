//
//  LineTimeTableViewCell.h
//  LineTimeDemo
//
//  Created by LHWen on 2019/12/19.
//  Copyright © 2019 LHWen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, NodeStateType) {
    NodeStateTypeWhite = 0, // 默认白色
    NodeStateTypeGray, // 灰色
    NodeStateTypeGreen, // 绿色
    NodeStateTypeBlue, // 蓝色
    NodeStateTypeRed, // 红色
};

@interface LineTimeTableViewCell : UITableViewCell

/** 流程时长 label */
@property (nonatomic, strong) UILabel *durationLbl;
/** 节点时间 label */
@property (nonatomic, strong) UILabel *nodeDateLbl;
/** 内容 label */
@property (nonatomic, strong) UILabel *contentLbl;
/** 前一个环节状态 */
@property (nonatomic, assign) NodeStateType nextType;
/** 当前环节状态 */
@property (nonatomic, assign) NodeStateType nowType;

@end

NS_ASSUME_NONNULL_END
