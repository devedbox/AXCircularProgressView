//
//  AXCircularProgressView.h
//  AXCircularProgressView
//
//  Created by ai on 16/4/25.
//  Copyright © 2016年 devedbox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AXCircularProgressView : UIView
{
    CGFloat _widthOfTrack;
    CGFloat _widthOfProgess;
    UIColor *_trackColor;
    UIColor *_progessColor;
    CGFloat _value;
}
@property (assign, nonatomic) CGFloat widthOfTrack; /// 轮廓线宽度
@property (assign, nonatomic) CGFloat widthOfProgess; /// 进度条宽度
@property (strong, nonatomic) UIColor *trackColor; /// 轮廓线颜色
@property (strong, nonatomic) UIColor *progessColor; /// 进度条颜色
@property (assign, nonatomic) CGFloat value;/// 进度值：[0,1]
/**
 *  提示文本字体
 */
@property (strong, nonatomic) UIFont *textFont;
/**
 *  提示文本字体颜色
 */
@property (strong, nonatomic) UIColor *textColor;
/**
 *  提示文字
 */
@property (strong, nonatomic) NSString *text;

- (instancetype)init;
- (instancetype)initWithFrame:(CGRect)frame;
- (instancetype)initWithSize:(CGSize)size;
@end
