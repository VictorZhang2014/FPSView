//
//  FPSWindow.m
//  UITrackingForFPS
//
//  Created by Victor Zhang on 28/10/2017.
//  Copyright © 2017 Victor Studio. All rights reserved.
//

#import "FPSView.h"

static FPSView * _fpsTestView = nil;

@interface FPSView()

@property (nonatomic, strong) UILabel *labelText;

@property (nonatomic, assign) int lastTime;

@property (nonatomic, assign) double count;

@end


@implementation FPSView

+ (void)show
{
    [[self shared] makeKeyAndVisible];
}

+ (void)dismiss
{
    [[self shared] resignKeyWindow];
}

+ (instancetype)shared {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        CGFloat width = UIScreen.mainScreen.bounds.size.width;
        _fpsTestView = [[FPSView alloc] initWithFrame:CGRectMake(((width - 70) / 2), 16, 70, 15)];
    });
    return _fpsTestView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.windowLevel = UIWindowLevelAlert;
        self.backgroundColor = UIColor.blackColor;
        
        UIViewController *rootViewController = [[UIViewController alloc] init];
        self.rootViewController = rootViewController;
        
        _labelText = [[UILabel alloc] initWithFrame:self.bounds];
        _labelText.textColor = UIColor.blackColor;
        _labelText.font = [UIFont systemFontOfSize:12];
        _labelText.textAlignment = NSTextAlignmentCenter;
        [rootViewController.view addSubview:_labelText];
        
        CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(tracking:)];
        [displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    }
    return self;
}

- (void)tracking:(CADisplayLink *)displayLink
{
    if (self.lastTime == 0) {
        self.lastTime = displayLink.timestamp;
        return;
    }
    
    _count += 1;
    float delta = displayLink.timestamp - _lastTime;
    if (delta < 1) {
        return;
    }
    
    self.lastTime = displayLink.timestamp;
    double fps = _count / delta;
    int fpsText = (int)round(fps);
    _count = 0;
    

    if (fps > 55.0) {
        _labelText.text = [NSString stringWithFormat:@"fps:%d 正常", fpsText];
        _labelText.textColor = UIColor.greenColor;
    } else if (fps >= 50.0 && fps <= 55.0) {
        _labelText.text = [NSString stringWithFormat:@"fps:%d 警告", fpsText];
        _labelText.textColor = UIColor.yellowColor;
    } else {
        _labelText.text = [NSString stringWithFormat:@"fps:%d 卡顿", fpsText];
        _labelText.textColor = UIColor.redColor;
    }
}

- (void)dealloc
{
    NSLog(@"FPSView has been deallocated!");
}

@end



