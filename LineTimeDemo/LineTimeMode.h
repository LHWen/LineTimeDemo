//
//  LineTimeMode.h
//  LineTimeDemo
//
//  Created by LHWen on 2019/12/19.
//  Copyright © 2019 LHWen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LineTimeTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface LineTimeMode : NSObject
/** 节点时间 */
@property (nonatomic, copy) NSString *nodeTime;
/** 节点历时 */
@property (nonatomic, copy) NSString *durationTime;
/** 内容 */
@property (nonatomic, copy) NSString *contentStr;
/** 前一个环节状态 */
@property (nonatomic, assign) NodeStateType nextType;
/** 当前环节状态 */
@property (nonatomic, assign) NodeStateType nowType;
/** 行高 */
@property (nonatomic, assign) CGFloat rowHeight;

- (instancetype)initWithNodeTime:(NSString *)node durationTime:(NSString *)duration contentStr:(NSString *)content nextType:(NodeStateType)nextT nowType:(NodeStateType)nowT;
- (NSArray *)p_initArray;

@end

NS_ASSUME_NONNULL_END
