//
//  LineTimeTableViewCell.m
//  LineTimeDemo
//
//  Created by LHWen on 2019/12/19.
//  Copyright © 2019 LHWen. All rights reserved.
//

#import "LineTimeTableViewCell.h"

@interface LineTimeTableViewCell ()

// 上方线
@property (nonatomic, strong) UIView *topLine;
// 下方线条
@property (nonatomic, strong) UIView *bottomLine;
// 节点图标
@property (nonatomic, strong) UIImageView *nodeImgView;

@end

@implementation LineTimeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = UIColor.whiteColor;
        [self p_setLable];
    }
    return self;
}

- (void)setNextType:(NodeStateType)nextType {
    
    switch (nextType) {
        case NodeStateTypeWhite:
            _topLine.backgroundColor = UIColor.whiteColor;
            break;
        case NodeStateTypeGray:
            _topLine.backgroundColor = UIColor.grayColor;
            break;
        case NodeStateTypeGreen:
            _topLine.backgroundColor = UIColor.greenColor;
            break;
        case NodeStateTypeBlue:
            _topLine.backgroundColor = UIColor.blueColor;
            break;
        case NodeStateTypeRed:
            _topLine.backgroundColor = UIColor.redColor;
            break;
        default:
            _topLine.backgroundColor = UIColor.whiteColor;
            break;
    }
    [_topLine setNeedsDisplay];
}

- (void)setNowType:(NodeStateType)nowType {
    
    switch (nowType) {
        case NodeStateTypeWhite:{
            _nodeImgView.image = [UIImage imageNamed:@"l_gary"];
            _bottomLine.backgroundColor = UIColor.whiteColor;
            break;
        }
        case NodeStateTypeGray:{
            _nodeImgView.image = [UIImage imageNamed:@"l_gary"];
            _bottomLine.backgroundColor = UIColor.grayColor;
            break;
        }
        case NodeStateTypeGreen:{
            _nodeImgView.image = [UIImage imageNamed:@"l_green"];
            _bottomLine.backgroundColor = UIColor.greenColor;
            break;
        }
        case NodeStateTypeBlue:{
            _nodeImgView.image = [UIImage imageNamed:@"l_blue"];
            _bottomLine.backgroundColor = UIColor.blueColor;
            break;
        }
        case NodeStateTypeRed:{
            _nodeImgView.image = [UIImage imageNamed:@"l_red"];
            _bottomLine.backgroundColor = UIColor.redColor;
            break;
        }
        default:{
            _nodeImgView.image = [UIImage imageNamed:@"l_gary"];
            _bottomLine.backgroundColor = UIColor.whiteColor;
            break;
        }
    }
    [_bottomLine setNeedsDisplay];
    [_nodeImgView setNeedsDisplay];
}

- (void)p_setLable {
    
    [self p_setLineAndImageView];
    [self p_setContentView];
}

- (void)p_setContentView {
    if (!_nodeDateLbl) {
        _nodeDateLbl = [self p_setLableText:@""
                                   textFont:12
                                  textColor:UIColor.grayColor
                                    bgColor:UIColor.whiteColor
                              textAlignment:NSTextAlignmentLeft
                              numberOfLines:1];
        [self.contentView addSubview:_nodeDateLbl];
        [_nodeDateLbl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_nodeImgView.mas_centerY);
            make.left.equalTo(_topLine.mas_right).offset(10);
            make.height.equalTo(@15);
        }];
        
        _contentLbl = [self p_setLableText:@""
                                  textFont:14
                                 textColor:UIColor.blackColor
                                   bgColor:UIColor.orangeColor
                             textAlignment:NSTextAlignmentLeft
                             numberOfLines:0];
        [self.contentView addSubview:_contentLbl];
        [_contentLbl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_nodeDateLbl.mas_bottom).offset(6);
            make.left.equalTo(_topLine.mas_right).offset(10);
            make.right.equalTo(@(-10));
            make.bottom.equalTo(@(-5));
        }];
        
        _durationLbl = [self p_setLableText:@""
                                  textFont:12
                                 textColor:UIColor.orangeColor
                                   bgColor:UIColor.whiteColor
                             textAlignment:NSTextAlignmentRight
                             numberOfLines:1];
        [self.contentView addSubview:_durationLbl];
        [_durationLbl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_contentLbl.mas_centerY);
            make.right.equalTo(_topLine.mas_left).offset(-6);
        }];
    }
}

- (void)p_setLineAndImageView {
    
    if (!_topLine) {
        _topLine = [UIView new];
        _topLine.backgroundColor = UIColor.orangeColor;
        [self.contentView addSubview:_topLine];
        [_topLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@0);
            make.left.equalTo(@64);
            make.width.equalTo(@2);
            make.height.equalTo(@16);
        }];
        
        _bottomLine = [UIView new];
        _bottomLine.backgroundColor = UIColor.blueColor;
        [self.contentView addSubview:_bottomLine];
        [_bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.width.equalTo(_topLine);
            make.top.equalTo(_topLine.mas_bottom);
            make.bottom.equalTo(@0);
        }];
        
        _nodeImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"l_gary"]];
        _nodeImgView.contentMode = UIViewContentModeScaleToFill;
        [self.contentView addSubview:_nodeImgView];
        [_nodeImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_topLine.mas_centerX);
            make.centerY.equalTo(_topLine.mas_bottom);
            make.size.equalTo(@16);
        }];
    }
}

- (UILabel *)p_setLableText:(NSString *)text textFont:(CGFloat)size textColor:(UIColor *)textColor bgColor:(UIColor *)bgColor textAlignment:(NSTextAlignment)textAlignment numberOfLines:(NSInteger)numberOfLines {
     
    UILabel *lable  = [[UILabel alloc] init];
    lable.text = text;
    lable.font = [UIFont systemFontOfSize:size];
    lable.textColor = textColor;
    lable.backgroundColor = bgColor;
    lable.textAlignment = textAlignment;
    lable.numberOfLines = numberOfLines;
    
    return lable;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
