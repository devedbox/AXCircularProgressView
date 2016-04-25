//
//  AXCircularProgressView.m
//  AXCircularProgressView
//
//  Created by ai on 16/4/25.
//  Copyright © 2016年 devedbox. All rights reserved.
//

#import "AXCircularProgressView.h"

@interface AXCircularProgressView ()
{
    CAShapeLayer *_trackLayer;
    CAShapeLayer *_valueLayer;
    CGSize _size;
}
@property (strong, nonatomic) CAShapeLayer *trackLayer;
@property (strong, nonatomic) CAShapeLayer *valueLayer;

@property (strong, nonatomic) UILabel *HUDLabel;
@end

@implementation AXCircularProgressView

#pragma mark - Initializer
- (instancetype)init {
    if (self = [super init]) {
        [self initializer];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _size = frame.size;
        [self initializer];
    }
    return self;
}

- (instancetype)initWithSize:(CGSize)size {
    if (self = [super init]) {
        _size = size;
        [self initializer];
    }
    return self;
}

- (void)initializer {
    _textColor = [UIColor grayColor];
    _textFont = [UIFont systemFontOfSize:10];
    _widthOfTrack = 1.0f;
    _widthOfProgess = 5.0f;
    _trackColor = [UIColor grayColor];
    _progessColor = [UIColor lightGrayColor];
    
    [self.layer addSublayer:self.trackLayer];
    [self.layer addSublayer:self.valueLayer];
    [self addSubview:self.HUDLabel];
}

#pragma mark - Getters
- (CAShapeLayer *)trackLayer {
    if (_trackLayer) return _trackLayer;
    
    _trackLayer = [self createRingLayerWithCenter:CGPointMake(_size.width / 2, _size.height / 2)
                                           radius:_size.width / 2
                                        lineWidth:_widthOfTrack
                                            color:_trackColor];
    
    return _trackLayer;
}

- (CAShapeLayer *)valueLayer {
    if (_valueLayer) return _valueLayer;
    
    _valueLayer = [self createRingLayerWithCenter:CGPointMake(_size.width / 2, _size.height / 2)
                                           radius:_size.width / 2 - _widthOfProgess / 2
                                        lineWidth:_widthOfProgess
                                            color:_progessColor];
    _valueLayer.strokeEnd = _value;
    return _valueLayer;
}

- (UILabel *)HUDLabel {
    if (_HUDLabel) return _HUDLabel;
    _HUDLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _size.width, _size.height)];
    _HUDLabel.textAlignment = NSTextAlignmentCenter;
    _HUDLabel.backgroundColor = [UIColor clearColor];
    _HUDLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    _HUDLabel.numberOfLines = 0;
    
    //default
    _HUDLabel.font = _textFont;
    _HUDLabel.textColor = _textColor;
    
    return _HUDLabel;
}

#pragma mark - Setters
- (void)setWidthOfTrack:(CGFloat)widthOfTrack {
    _widthOfTrack = widthOfTrack;
    _trackLayer.lineWidth = widthOfTrack;
}

- (void)setWidthOfProgess:(CGFloat)widthOfProgess {
    _widthOfProgess = widthOfProgess;
    
    [_valueLayer removeFromSuperlayer];
    _valueLayer = [self createRingLayerWithCenter:CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2)
                                           radius:self.bounds.size.width / 2 - _widthOfProgess / 2
                                        lineWidth:_widthOfProgess
                                            color:_progessColor];
    _valueLayer.strokeEnd = _value;
    [self.layer addSublayer:_valueLayer];
}

- (void)setTrackColor:(UIColor *)trackColor {
    _trackColor = trackColor;
    trackColor = nil;
    _trackLayer.strokeColor = _trackColor.CGColor;
}

- (void)setProgessColor:(UIColor *)progessColor {
    _progessColor = progessColor;
    progessColor = nil;
    _valueLayer.strokeColor = _progessColor.CGColor;
}

- (void)setValue:(CGFloat)value {
    _value = value;
    _valueLayer.strokeEnd = _value;
}

- (void)setTextFont:(UIFont *)textFont {
    _textFont = textFont;
    textFont = nil;
    _HUDLabel.font = _textFont;
}

- (void)setTextColor:(UIColor *)textColor {
    _textColor = textColor;
    textColor = nil;
    _HUDLabel.textColor = _textColor;
}

- (void)setText:(NSString *)text {
    _text = text;
    text = nil;
    _HUDLabel.text = _text;
}

#pragma mark - Helpers
- (CAShapeLayer *)createRingLayerWithCenter:(CGPoint)center radius:(CGFloat)radius lineWidth:(CGFloat)lineWidth color:(UIColor *)color {
    UIBezierPath *smoothedPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(radius, radius) radius:radius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    CAShapeLayer *slice = [CAShapeLayer layer];
    slice.contentsScale = [[UIScreen mainScreen] scale];
    slice.frame = CGRectMake(center.x - radius, center.y - radius, radius * 2, radius * 2);
    slice.fillColor = [UIColor clearColor].CGColor;
    slice.strokeColor = color.CGColor;
    slice.lineWidth = lineWidth;
    slice.lineCap = kCALineJoinBevel;
    slice.lineJoin = kCALineJoinBevel;
    slice.path = smoothedPath.CGPath;
    return slice;
}
@end
