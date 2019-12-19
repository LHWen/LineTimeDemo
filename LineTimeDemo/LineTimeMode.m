//
//  LineTimeMode.m
//  LineTimeDemo
//
//  Created by LHWen on 2019/12/19.
//  Copyright © 2019 LHWen. All rights reserved.
//

#import "LineTimeMode.h"

@implementation LineTimeMode

- (instancetype)initWithNodeTime:(NSString *)node durationTime:(NSString *)duration contentStr:(NSString *)content nextType:(NodeStateType)nextT nowType:(NodeStateType)nowT {
    self = [super init];
    if (self) {
        _nodeTime = node;
        _durationTime = duration;
        _contentStr = content;
        _nextType = nextT;
        _nowType = nowT;
        _rowHeight = [self calculateTextHeightWithText:content] + 31;
    }
    return self;
}

- (NSArray *)p_initArray {
    return [@[
        [[LineTimeMode alloc] initWithNodeTime:@"2019-12-16 16:30" durationTime:@"冬至"
                                    contentStr:@"冬至：冬至之日蚯蚓结，又五日麋角解，又五日水泉动。太阳位于黄经270度，12月21-23日交节"
                                      nextType:NodeStateTypeWhite nowType:NodeStateTypeGreen],
        [[LineTimeMode alloc] initWithNodeTime:@"2019-12-16 18:00" durationTime:@"小寒"
                                    contentStr:@"小寒：小寒之日雁北乡，又五日鹊始巢，又五日雉始鸲。太阳位于黄经285度，01月05-07日交节 "
                                      nextType:NodeStateTypeGreen nowType:NodeStateTypeGreen],
        [[LineTimeMode alloc] initWithNodeTime:@"2019-12-17 8:00" durationTime:@"大寒"
                                    contentStr:@"大寒：大寒之日鸡使乳，又五日鹫鸟厉疾，又五日水泽腹坚。太阳位于黄经300度，01月20-21日交节 "
                                      nextType:NodeStateTypeGreen nowType:NodeStateTypeGreen],
        [[LineTimeMode alloc] initWithNodeTime:@"2019-12-17 11:30" durationTime:@"立春"
                                    contentStr:@"立春：立春之日东风解冻，又五日蛰虫始振，又五日鱼上冰（鱼陟负冰）。太阳位于黄经315度，02月02-05日交节"
                                      nextType:NodeStateTypeGreen nowType:NodeStateTypeBlue],
        [[LineTimeMode alloc] initWithNodeTime:@"2019-12-18 9:30" durationTime:@"雨水"
                                    contentStr:@"雨水：雨水之日獭祭鱼，又五日鸿雁来（候雁北），又五日草木萌动。太阳位于黄经330度，02月18-20日交节 "
                                      nextType:NodeStateTypeBlue nowType:NodeStateTypeRed],
        [[LineTimeMode alloc] initWithNodeTime:@"2019-12-19 12:30" durationTime:@"惊蛰"
                                    contentStr:@"惊蛰：惊蛰之日桃始华，又五日仓庚鸣，又五日鹰化为鸠。太阳位于黄经345度，03月05-07日交节 "
                                      nextType:NodeStateTypeRed nowType:NodeStateTypeGreen],
        [[LineTimeMode alloc] initWithNodeTime:@"2019-12-19 13:30" durationTime:@"春分"
                                    contentStr:@"春分：春分之日玄鸟至，又五日雷乃发声，又五日使电。太阳位于黄经0度，03月20-22日交节"
                                      nextType:NodeStateTypeGreen nowType:NodeStateTypeGreen],
        [[LineTimeMode alloc] initWithNodeTime:@"2019-12-19 16:30" durationTime:@"清明"
                                    contentStr:@"清明：清明之日桐始华，又五日田鼠化为鴽，又五日虹始见。太阳位于黄经15度，04月04-06日交节"
                                      nextType:NodeStateTypeGreen nowType:NodeStateTypeBlue],
        [[LineTimeMode alloc] initWithNodeTime:@"2019-12-19 15:30" durationTime:@"谷雨"
                                    contentStr:@"谷雨：榖雨之日萍始生，又五日鸣鸠拂奇羽，又五日戴胜降于桑。太阳位于黄经30度，04月19-21日交节 "
                                      nextType:NodeStateTypeBlue nowType:NodeStateTypeBlue],
        [[LineTimeMode alloc] initWithNodeTime:@"2019-12-19 16:30" durationTime:@"立夏"
                                    contentStr:@"立夏：立夏之日蝼蝈鸣，又五日蚯蚓出，又五日王瓜生。太阳位于黄经45度，05月05-07日交节 "
                                      nextType:NodeStateTypeBlue nowType:NodeStateTypeGreen],
        [[LineTimeMode alloc] initWithNodeTime:@"2019-12-19 17:30" durationTime:@"小满"
                                    contentStr:@"小满：小满之日苦菜秀，又五日靡草死，又五日小暑至（麦秋生）。太阳位于黄经60度，05月20-22日交节 "
                                      nextType:NodeStateTypeGreen nowType:NodeStateTypeGray],
        [[LineTimeMode alloc] initWithNodeTime:@"2019-12-19 18:30" durationTime:@"芒种"
                                    contentStr:@"芒种：芒种之日螳螂生，又五日鵙始鸣，又五日反舌无声。太阳位于黄经75度，06月05-07日交节"
                                      nextType:NodeStateTypeGray nowType:NodeStateTypeGray],
        [[LineTimeMode alloc] initWithNodeTime:@"2019-12-19 18:30" durationTime:@"夏至"
                                    contentStr:@"夏至：夏至之日鹿角解，又五日蜩始鸣，又五日半夏生。太阳位于黄经90度，06月21-22日交节 "
                                      nextType:NodeStateTypeGray nowType:NodeStateTypeGray],
        [[LineTimeMode alloc] initWithNodeTime:@"2019-12-19 18:30" durationTime:@"小暑"
                                    contentStr:@"小暑：小暑之日温风至，又五日蟋蟀居辟，又五日鹰乃学习（鹰始挚）。太阳位于黄经105度，07月06-08日交节"
                                      nextType:NodeStateTypeGray nowType:NodeStateTypeGray],
        [[LineTimeMode alloc] initWithNodeTime:@"2019-12-19 18:30" durationTime:@"大暑"
                                    contentStr:@"大暑：大暑之日腐草为蠲，又五日土润溽暑，又五日大雨时行。太阳位于黄经120度，07月22-24日交节 "
                                      nextType:NodeStateTypeGray nowType:NodeStateTypeGray],
        [[LineTimeMode alloc] initWithNodeTime:@"2019-12-19 18:30" durationTime:@"立秋"
                                    contentStr:@"立秋：立秋之日凉风至，又五日白露降，又五日寒蝉鸣。太阳位于黄经135度，08月070-9日交节"
                                      nextType:NodeStateTypeGray nowType:NodeStateTypeGray],
        [[LineTimeMode alloc] initWithNodeTime:@"2019-12-19 18:30" durationTime:@"处暑"
                                    contentStr:@"处暑：处暑之日鹰乃祭鸟，又五日天地始肃，又五日禾乃登。太阳位于黄经150度，08月22-24日交节 "
                                      nextType:NodeStateTypeGray nowType:NodeStateTypeGray],
        [[LineTimeMode alloc] initWithNodeTime:@"2019-12-19 18:30" durationTime:@"白露"
                                    contentStr:@"白露：白露之日鸿雁来，又五日玄鸟归，又五日群鸟养羞。太阳位于黄经165度，09月07-09日交节 "
                                      nextType:NodeStateTypeGray nowType:NodeStateTypeGray],
        [[LineTimeMode alloc] initWithNodeTime:@"2019-12-19 18:30" durationTime:@"秋分"
                                    contentStr:@"秋分：秋分之日雷始收声，又五日蛰虫培户，又五日水始涸。太阳位于黄经180度，09月22-24日交节 "
                                      nextType:NodeStateTypeGray nowType:NodeStateTypeGray],
        [[LineTimeMode alloc] initWithNodeTime:@"2019-12-19 18:30" durationTime:@"寒露"
                                    contentStr:@"寒露：寒露之日鸿雁来宾，又五日雀入大水为蛤，又五日菊有黄华。太阳位于黄经195度，10月08-09日交节 "
                                      nextType:NodeStateTypeGray nowType:NodeStateTypeGray],
        [[LineTimeMode alloc] initWithNodeTime:@"2019-12-19 18:30" durationTime:@"霜降"
                                    contentStr:@"霜降：霜降之日豺乃祭兽，又五日草木黄落，又五日蛰虫咸俯。太阳位于黄经210度，10月23-24日交节 "
                                      nextType:NodeStateTypeGray nowType:NodeStateTypeGray],
        [[LineTimeMode alloc] initWithNodeTime:@"2019-12-19 18:30" durationTime:@"立冬"
                                    contentStr:@"立冬：立冬之日水始冰，又五日地始冻，又五日雉入大水为蜃。太阳位于黄经225度，11月07-08日交节 "
                                      nextType:NodeStateTypeGray nowType:NodeStateTypeGray],
        [[LineTimeMode alloc] initWithNodeTime:@"2019-12-19 18:30" durationTime:@"小雪"
                                    contentStr:@"小雪：小雪之日虹藏不见，又五日天气上腾地气下降，又五日闭塞而成冬。太阳位于黄经240度，11月22-23日交节"
                                      nextType:NodeStateTypeGray nowType:NodeStateTypeGray],
        [[LineTimeMode alloc] initWithNodeTime:@"2019-12-19 18:30" durationTime:@"大雪"
                                    contentStr:@"大雪：大雪之日鹖旦不鸣，又五日虎始交，又五日荔挺生。太阳位于黄经255度，12月06-08日交节"
                                      nextType:NodeStateTypeGray nowType:NodeStateTypeWhite]
    ] copy];
}

// 获取内容高度
- (CGFloat)calculateTextHeightWithText:(NSString *)text {
    
    CGFloat kWidth = [UIScreen mainScreen].bounds.size.width - 86.0;
    NSRange fullRange = NSMakeRange(0, text.length);
    NSMutableParagraphStyle *pstyle = [[NSMutableParagraphStyle alloc] init];
    pstyle.lineBreakMode = NSLineBreakByCharWrapping;
    pstyle.alignment = NSTextAlignmentLeft;
    
    NSMutableAttributedString *attriString = [[NSMutableAttributedString alloc] initWithString:text];
    [attriString addAttribute:NSParagraphStyleAttributeName value:pstyle range:fullRange];
    [attriString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:fullRange];
    [attriString addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:fullRange];
    
    CGRect r = [attriString boundingRectWithSize:CGSizeMake(kWidth, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    
    return r.size.height += 10;
}

@end
