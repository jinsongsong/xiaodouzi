//
//  ViewController.m
//  AA
//
//  Created by YKJ3 on 16/8/9.
//  Copyright © 2016年 YKJ3. All rights reserved.
//

#import "ViewController.h"
//#define ARC4RANDOM_MAX 0x100000000
#import <objc/runtime.h>
#import <YYKit/YYKit.h>
#if KKAA
#import "MBProgressHUD.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
#endif

#define HHAA
@interface ViewController ()<PNChartDelegate,CAAnimationDelegate,UIGestureRecognizerDelegate>
{
    NSArray *data01Array;
    PNLineChart * lineChart;
    CAShapeLayer *_circleBackground;
    
    UIButton *_btn;
    
}
@property(nonatomic,strong)CADisplayLink *displayLink;
@property(nonatomic,strong)UIButton *mgbtn;
@end

@implementation ViewController
+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{

        Method viewDidLoad = class_getInstanceMethod(self, @selector(viewDidLoad));
        Method viewDidLoaded = class_getInstanceMethod(self, @selector(bbb));
        method_exchangeImplementations(viewDidLoad, viewDidLoaded);
    });
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //data01Array = @[@60.1, @160.1, @126.4, @262.2, @186.2];
    
#if KKAA
    [self aLineChart:data01Array];
#elif KKBB
    [self aPieChart];
#else
    [self aBarChart];
#define adad
#endif
 
#ifndef adad
    NSLog(@"1234556788jgfndbndfkfh wio woig");
#endif
    
#ifdef adad
    NSLog(@"123");
#endif
    
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    btn.backgroundColor=[UIColor orangeColor];
    [btn setTitle:NSLocalizedString(@"App", nil) forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(fa:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    btn.layer.shadowColor=[[UIColor redColor]CGColor];
    btn.layer.shadowOffset=CGSizeMake(0, 0); //阴影偏移量 默认（0，-3）
    btn.layer.shadowOpacity = 1;
    btn.layer.shadowRadius = 3;
    
    
//==============================================================================
// 二次元画阴影以控件自身为坐标系
//==============================================================================
    UIBezierPath *path=[UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 0)];
    [path addQuadCurveToPoint:CGPointMake(0, CGRectGetHeight(btn.frame)) controlPoint:CGPointMake(-4, CGRectGetHeight(btn.frame)/2)];
    btn.layer.shadowPath=path.CGPath;
    
    
    
    
//==============================================================================
// 二次元曲线moveToPoint起点 CurveToPoint终点 controlPoint中间点曲线凸起
//==============================================================================
    CAShapeLayer *layer=[CAShapeLayer layer];
    UIColor *color = [UIColor redColor];
    [color set]; //设置线条颜色
    
    UIBezierPath* aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = 5.0;
    aPath.lineCapStyle = kCGLineCapRound; //线条拐角
    aPath.lineJoinStyle = kCGLineCapRound; //终点处理
    
    [aPath moveToPoint:CGPointMake(20, 100)];
    [aPath addQuadCurveToPoint:CGPointMake(150, 100) controlPoint:CGPointMake(70, 0)];
    [aPath stroke];
    
    //CAShapeLayer设置填充颜色以CAShapeLayer 为主 未设置默认UIBezierPath的黑色
    layer.fillColor   = [UIColor blueColor].CGColor;
    layer.lineWidth   = 5.0;
    layer.strokeColor = [UIColor redColor].CGColor;
    layer.strokeEnd   = 1.0;
    layer.path=aPath.CGPath;
    [self.view.layer addSublayer:layer];
//==============================================================================
    
    
    
//    Method m1=class_getInstanceMethod([self class], @selector(viewDidLoad));
//    Method m2=class_getInstanceMethod([self class], @selector(bbb));
//    
//    method_exchangeImplementations(m1, m2);
    
    [self drawYuan];
    
    
}
-(void)aaa{
    NSLog(@"123456");
}
-(void)bbb{
    NSLog(@"abcdefg");
    [self bbb];
    
    //每秒60次 
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(watchMyViewAction)];
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];

    self.mgbtn=[[UIButton alloc]initWithFrame:CGRectMake(50, 300, 50, 50)];
    _mgbtn.backgroundColor=[UIColor orangeColor];
    //[_mgbtn setTitle:NSLocalizedString(@"App", nil) forState:UIControlStateNormal];
    [_mgbtn addTarget:self action:@selector(nihao) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_mgbtn];
    
    _btn=[[UIButton alloc]initWithFrame:CGRectMake(50, 300, 50, 50)];
    _btn.backgroundColor=[UIColor orangeColor];
    _btn.userInteractionEnabled=YES;
    [_btn setTitle:NSLocalizedString(@"App", nil) forState:UIControlStateNormal];
    [_btn addTarget:self action:@selector(initCustomAniamte:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn];
    
}
-(void)nihao{
    NSLog(@"你好");

}
-(void)watchMyViewAction{
    CALayer *presentationLayer = _btn.layer.presentationLayer;
    _mgbtn.frame=presentationLayer.frame;
}
-(void)stopWatch{
    [self.displayLink invalidate];
    self.displayLink=nil;
    
}
-(void)initCustomAniamte:(UIButton*)btn{ //循环动画
    
//    [UIView animateWithDuration:3 animations:^{
//        btn.frame=CGRectMake(arc4random()%325, arc4random()%600, 50, 50);
//        btn.backgroundColor=[UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
//    } completion:^(BOOL finished) {
//        [self initCustomAniamte:btn];
//    }];
    NSLog(@"点击动画");
    
    
    [UIView animateWithDuration:3 delay:.5 options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionAllowUserInteraction animations:^{
        btn.frame=CGRectMake(arc4random()%325, arc4random()%600, 50, 50);
        btn.backgroundColor=[UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
        
    } completion:^(BOOL finished) {
        if (finished) {
            [self initCustomAniamte:btn];
        }
    }];
}
//动画过程响应事件  判断点击区域
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];

    if (CGRectContainsPoint(_btn.layer.presentationLayer.frame, [touch locationInView:self.view])) {
        NSLog(@"111---点击动画");
        //do something
        NSLog(@"%@",NSStringFromCGRect(_btn.layer.presentationLayer.frame));
        
    }
}
-(void)drawYuan{
    
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.view.frame.size.width/2.0f, self.view.frame.size.height*3/4.0f)
                                                              radius:(self.view.frame.size.height * 0.15)
                                                          startAngle:DEGREES_TO_RADIANS(-90)
                                                            endAngle:DEGREES_TO_RADIANS(270)
                                                           clockwise:YES];
    
    _circleBackground             = [CAShapeLayer layer];
    _circleBackground.path        = circlePath.CGPath;
    _circleBackground.lineCap     = kCALineCapSquare;
    _circleBackground.fillColor   = [UIColor yellowColor].CGColor;
    _circleBackground.lineWidth   = 5.0;
    _circleBackground.strokeColor = [UIColor redColor].CGColor;
    _circleBackground.strokeEnd   = 1.0;
    //在俯视图上的层次位置 layer 属性
    _circleBackground.zPosition   = -1;
    
    //[self.view.layer addSublayer:_circle];
    [self.view.layer addSublayer:_circleBackground];

}
-(void)aBarChart
{
    PNBarChart * barChart = [[PNBarChart alloc] initWithFrame:CGRectMake(0, 250.0, SCREEN_WIDTH, 200.0)];
    barChart.delegate = self;
    barChart.showLabel = YES;
    barChart.backgroundColor = [UIColor clearColor];
    
    //barChart.yChartLabelWidth = 20.0;
    barChart.chartMarginLeft = 30.0;
    barChart.chartMarginRight = 10.0;
    barChart.chartMarginTop = 5.0;
    barChart.chartMarginBottom = 10.0;
    
    barChart.labelMarginTop =5;
    barChart.showChartBorder = YES;
    barChart.isGradientShow = NO;
    barChart.isShowNumbers = YES;
    
    [self.view addSubview:barChart];
    self.barChart =barChart;
    
    [barChart setXLabels:@[@"SEP 1",@"SEP 2",@"SEP 3",@"SEP 4",@"SEP 5"]];
    //[barChart setStrokeColors:@[PNGreen,[UIColor orangeColor],PNRed,[UIColor blueColor],PNGreen]];
    [barChart setYValues:@[@1,@0,@2,@6,@0,@1]];
    [barChart strokeChart];
    
}
//点击方法效果
-(void)makeScale:(UIView*)scaleView delegate:(id)delegate scale:(CGFloat)scale duration:(CFTimeInterval)duration
{
    
    scaleView.layer.transform = CATransform3DIdentity;
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    CATransform3D tr0 = CATransform3DMakeScale(1, 1, 1);
    CATransform3D tr1 = CATransform3DMakeScale(scale, scale, 1);
    CATransform3D tr2 = CATransform3DMakeScale(1, 1, 1);
    NSArray *frameValues = [NSArray arrayWithObjects:
                            [NSValue valueWithCATransform3D:tr0],
                            [NSValue valueWithCATransform3D:tr1],
                            [NSValue valueWithCATransform3D:tr2],
                            nil];
    [animation setValues:frameValues];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.duration = duration;
    animation.delegate = delegate;
    animation.repeatCount=3;
    [scaleView.layer addAnimation:animation forKey:@"ShakedAnimation"];
}
- (CAAnimation *)animationRotate{
    
    CATransform3D rotationTransform  = CATransform3DMakeRotation(M_PI, 0.5, -0.5,0.5);
    
    CABasicAnimation* animation;
    
    animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    
    //animation.fromValue      = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI/2, 0.8, -0.5,0.8)];
    
    animation.toValue        = [NSValue valueWithCATransform3D:rotationTransform];
    
    animation.duration        = 0.3;
    
    animation.autoreverses    = YES;
    
    animation.cumulative    = YES;
    
    animation.repeatCount    = 1;
    
    animation.beginTime        = 0.1;
    
    animation.delegate        = self;
    
    return animation;
    
}
-(void)fa:(UIButton*)btn{
    
    [_btn.layer removeAllAnimations]; //移除动画 使BOOL finished 变NUll
    //放大动画
    [self makeScale:btn delegate:nil scale:1.5 duration:.3];
    
    
    /*CAAnimation* myAnimationRotate = [self animationRotate];
    
    CAAnimationGroup *m_pGroupAnimation     = [CAAnimationGroup animation];
    
    m_pGroupAnimation.delegate              =self;
    
    m_pGroupAnimation.removedOnCompletion   =NO;
    
    m_pGroupAnimation.duration              =1;
    
    m_pGroupAnimation.timingFunction        = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    m_pGroupAnimation.repeatCount           =1;//FLT_MAX;  //"forever";
    
    m_pGroupAnimation.fillMode              =kCAFillModeForwards;
    
    m_pGroupAnimation.animations             = [NSArray arrayWithObjects:myAnimationRotate,nil];
    
    [btn.layer addAnimation:m_pGroupAnimation forKey:@"animationRotate"];*/
    
    //    [self.barChart setXLabels:@[@"Jan 1",@"Jan 2",@"Jan 3",@"Jan 4",@"Jan 5",@"Jan 6",@"Jan 7"]];
//    [self.barChart updateChartData:@[@(arc4random() % 30),@(arc4random() % 30),@(arc4random() % 30),@(arc4random() % 30),@(arc4random() % 30),@(arc4random() % 30),@(arc4random() % 30)]];
//    
//    CABasicAnimation *animateScale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//    animateScale.fromValue = [NSNumber numberWithFloat:1.f];
//    animateScale.toValue = [NSNumber numberWithFloat:0.0f];
//    
//    CABasicAnimation *animateMove = [CABasicAnimation animationWithKeyPath:@"position"];
////    animateMove.fromValue = [NSValue valueWithCGPoint:CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2)];
////    animateMove.toValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
//    
//    CABasicAnimation *animateAlpha = [CABasicAnimation animationWithKeyPath:@"opacity"];
//    animateAlpha.fromValue = [NSNumber numberWithFloat:1.f];
//    animateAlpha.toValue = [NSNumber numberWithFloat:0.0f];
//    
////    CAKeyframeAnimation *frameAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
////    UIBezierPath *path=[UIBezierPath bezierPath];
////    [path moveToPoint:CGPointMake(0, 0)];
////    [path addLineToPoint:CGPointMake(10 ,10)];
////    [path addLineToPoint:CGPointMake(100,100)];
////    frameAnimation.path=path.CGPath;
//    
//    
//    CAAnimationGroup *aniGroup = [CAAnimationGroup animation];
//    aniGroup.duration = 2.f;
//    aniGroup.repeatCount = 1;
//    aniGroup.autoreverses=YES;  //动画 复原
//    aniGroup.delegate=self;
//    aniGroup.animations = [NSArray arrayWithObjects:animateScale,animateMove,animateAlpha, nil];
//    aniGroup.removedOnCompletion = YES;
//    
//    [self.view.layer addAnimation:aniGroup forKey:nil];
//    
//    for (NSInteger i=0; i<10; i++) {
//        if (i==5) {
//            break;
//        }
//    }



    //[self.barChart strokeChart];
    
    
//    NSArray *items = @[[PNPieChartDataItem dataItemWithValue:40 color:PNLightGreen],
//                       [PNPieChartDataItem dataItemWithValue:60 color:PNFreshGreen description:@"ss星星"],
//                       [PNPieChartDataItem dataItemWithValue:20 color:PNDeepGreen description:@"s嬷嬷"],
//                       [PNPieChartDataItem dataItemWithValue:10 color:PNDeepGreen description:@"ss嬷嬷"]
//                       ];
//    [self.pieChart updateChartData:items];
//    //self.pieChart.showOnlyValues = YES;
//    [self.pieChart strokeChart];

    // Line Chart #1
//    NSArray * data01Array1 = @[@(arc4random() % 300), @(arc4random() % 300), @(arc4random() % 300), @(arc4random() % 300), @(arc4random() % 300), @(arc4random() % 300), @(arc4random() % 300)];
//    PNLineChartData *data01 = [PNLineChartData new];
//    data01.color = PNFreshGreen;
//    data01.itemCount = data01Array1.count;
//    data01.inflexionPointColor = PNRed;
//    data01.inflexionPointStyle = PNLineChartPointStyleTriangle;
//    data01.getData = ^(NSUInteger index) {
//        CGFloat yValue = [data01Array1[index] floatValue];
//        return [PNLineChartDataItem dataItemWithY:yValue];
//    };
//    
//    // Line Chart #2
//    NSArray * data02Array = @[@(arc4random() % 300), @(arc4random() % 300), @(arc4random() % 300), @(arc4random() % 300), @(arc4random() % 300), @(arc4random() % 300), @(arc4random() % 300)];
//    PNLineChartData *data02 = [PNLineChartData new];
//    data02.color = PNTwitterColor;
//    data02.itemCount = data02Array.count;
//    data02.inflexionPointStyle = PNLineChartPointStyleSquare;
//    data02.getData = ^(NSUInteger index) {
//        CGFloat yValue = [data02Array[index] floatValue];
//        return [PNLineChartDataItem dataItemWithY:yValue];
//    };
    
    //[lineChart setXLabels:@[@"DEC 1",@"DEC 2",@"DEC 3",@"DEC 4",@"DEC 5",@"DEC 6",@"DEC 7"]];
    //[lineChart updateChartData:@[data01, data02]];
//    data01Array = @[@(arc4random() % 300), @(arc4random() % 300), @(arc4random() % 300), @(arc4random() % 300), @(arc4random() % 300), @(arc4random() % 300), @(arc4random() % 300)];
//    //[lineChart removeFromSuperview];
//    //[self aLineChart:data01Array];
//    NSArray * data02Array = @[@10, @180.1, @202.2, @126.2];
    
//    data01Array = @[@(arc4random() % 300), @(arc4random() % 300), @(arc4random() % 300), @(arc4random() % 300), @(arc4random() % 300), @(arc4random() % 300), @(arc4random() % 300)];
//    PNLineChartData *data01 = [PNLineChartData new];
//    data01.color = PNFreshGreen;
//    data01.itemCount = data01Array.count;
//    data01.inflexionPointColor = PNRed;
//    //data01.inflexionPointStyle = PNLineChartPointStyleTriangle;
//    data01.getData = ^(NSUInteger index) {
//        CGFloat yValue = [data01Array[index] floatValue];
//        return [PNLineChartDataItem dataItemWithY:yValue];
//    };
//    
//    // Line Chart #2
//    NSArray * data02Array = @[@(arc4random() % 300), @(arc4random() % 300), @(arc4random() % 300), @(arc4random() % 300), @(arc4random() % 300), @(arc4random() % 300), @(arc4random() % 300)];
//    PNLineChartData *data02 = [PNLineChartData new];
//    data02.color = PNTwitterColor;
//    data02.itemCount = data02Array.count;
//    //data02.inflexionPointStyle = PNLineChartPointStyleSquare;
//    data02.getData = ^(NSUInteger index) {
//        CGFloat yValue = [data02Array[index] floatValue];
//        return [PNLineChartDataItem dataItemWithY:yValue];
//    };
//
//    [lineChart updateChartData:@[data01, data02]];

}
- (void)animationDidStart:(CAAnimation *)anim{
    NSLog(@"开始");
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    NSLog(@"结束");
}
-(void)aLineChart:(NSArray*)arr
{
    lineChart = [[PNLineChart alloc] initWithFrame:CGRectMake(0, 50.0, SCREEN_WIDTH-100, 300.0)];
    lineChart.backgroundColor = [UIColor yellowColor];
    //lineChart.showSmoothLines = NO;
    lineChart.delegate=self;
    lineChart.showBreakpoint=YES;
    //lineChart.showCoordinateAxis = YES;   //坐标突出线
    lineChart.showChartShadow=YES;
    lineChart.axisColor = [UIColor grayColor];//坐标轴颜色 宽度
    lineChart.axisWidth = .5;
    //lineChart.xUnit = @"元"; //单位
    //lineChart.yUnit = @"元"; //单位
    //lineChart.showLabel = YES;
    lineChart.yGridLinesColor = [UIColor grayColor];  //图像中间线条
    lineChart.showYGridLines = YES;  //显示不显示

    //[lineChart setXLabels:@[@"2",@"4",@"6",@"8",@"10",@"12",@"14",@"16",@"18",@"20",@"22",@"24"]];
    [lineChart setXLabels:@[@"2",@"8",@"10",@"20",@"22",@"24"]];
//    lineChart.yFixedValueMax = 300.0;  //最大值 Y轴
//    lineChart.yFixedValueMin = -10.0;
    
    [lineChart setYLabels:@[@"0",@"50",@"100",@"150",@"200",@"250"]];

    // Line Chart No.1
    //data01Array = @[@60.1, @160.1, @126.4, @262.2, @186.2];
    PNLineChartData *data01 = [PNLineChartData new];
    data01.dataTitle = @"Alpha";
    data01.color = PNFreshGreen;
    data01.alpha = 0.3f;
    data01.itemCount = arr.count;  //折线图 线段条数
    data01.inflexionPointColor = [UIColor redColor];  //折线点图形颜色
    //data01.inflexionPointStyle = PNLineChartPointStyleTriangle;  //折线点图形样式
    data01.getData = ^(NSUInteger index) {
        CGFloat yValue = [arr[index] floatValue];
        return [PNLineChartDataItem dataItemWithY:yValue];
    };
    
    // Line Chart No.2
    NSArray * data02Array = @[@10, @180.1, @202.2, @126.2];
    PNLineChartData *data02 = [PNLineChartData new];
    data02.color = PNTwitterColor;
    data02.itemCount = data02Array.count;
    data02.getData = ^(NSUInteger index) {
        CGFloat yValue = [data02Array[index] floatValue];
        return [PNLineChartDataItem dataItemWithY:yValue];
    };
    
//    NSArray * data03Array = @[@40.1, @180.1, @146.4, @242.2, @206.2];
//    PNLineChartData *data03 = [PNLineChartData new];
//    data03.color = [UIColor orangeColor];
//    data03.itemCount = lineChart.xLabels.count;
//    data03.getData = ^(NSUInteger index) {
//        CGFloat yValue = [data03Array[index] floatValue];
//        return [PNLineChartDataItem dataItemWithY:yValue];
//    };
    
    lineChart.chartData = @[data01, data02];
    [lineChart strokeChart];
    [self.view addSubview:lineChart];
    //NSLog(@"--->>>%@--->>>%@",lineChart.chartData,lineChart.pathPoints);

    //下面注释
    lineChart.legendStyle = PNLegendItemStyleStacked;
    lineChart.legendFont = [UIFont boldSystemFontOfSize:12.0f];
    lineChart.legendFontColor = [UIColor redColor];
    
    UIView *legend = [lineChart getLegendWithMaxWidth:SCREEN_WIDTH];
    [legend setFrame:CGRectMake(30, 260, legend.frame.size.width, legend.frame.size.width)];
    //[self.view addSubview:legend];
    
//    lineChart.labelRowsInSerialMode = 2;
//    lineChart.legendFontColor = [UIColor redColor];
}

-(void)aPieChart
{
    NSArray *items = @[[PNPieChartDataItem dataItemWithValue:10 color:PNLightGreen],
                       [PNPieChartDataItem dataItemWithValue:20 color:PNFreshGreen description:@"星星"],
                       [PNPieChartDataItem dataItemWithValue:40 color:PNDeepGreen description:@"嬷嬷"],
                       ];
    
    PNPieChart *pieChart = [[PNPieChart alloc]initWithFrame:CGRectMake(SCREEN_WIDTH /2.0 - 100,400,240.0,200.0)items:items];
    //饼状图文字颜色
    pieChart.descriptionTextColor = [UIColor whiteColor];
    pieChart.descriptionTextFont  = [UIFont fontWithName:@"Avenir-Medium"size:14.0];
    pieChart.descriptionTextShadowColor = [UIColor clearColor];
    pieChart.showAbsoluteValues = NO;
    pieChart.showOnlyValues = NO;
    pieChart.delegate=self;
    pieChart.isShowHollow=YES;
    //绘制
    [pieChart strokeChart];
    
    pieChart.legendStyle = PNLegendItemStyleStacked;
    pieChart.legendFont = [UIFont boldSystemFontOfSize:12.0f];
    
    //标识
    UIView *legend = [pieChart getLegendWithMaxWidth:200];
    [legend setFrame:CGRectMake(130, 350, legend.frame.size.width, legend.frame.size.height)];
    legend.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:legend];

    //加载在视图上
    [self.view addSubview:pieChart];
    self.pieChart=pieChart;

}


//**********************
//**********************
/**
 * Callback method that gets invoked when the user taps on the chart line.
 */
- (void)userClickedOnLinePoint:(CGPoint)point lineIndex:(NSInteger)lineIndex
{
    NSLog(@"--%f,--%f",point.x,point.y);
}

/**
 * Callback method that gets invoked when the user taps on a chart line key point.
 */
- (void)userClickedOnLineKeyPoint:(CGPoint)point
                        lineIndex:(NSInteger)lineIndex
                       pointIndex:(NSInteger)pointIndex
{
    NSLog(@"%f,%f",point.x,point.y);
}
/**
 * Callback method that gets invoked when the user taps on a chart bar.
 */
- (void)userClickedOnBarAtIndex:(NSInteger)barIndex
{
    NSLog(@"Click on bar %@", @(barIndex));
    
    PNBar * bar = [self.barChart.bars objectAtIndex:barIndex];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    
    animation.fromValue = @1.0;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.toValue = @1.1;
    animation.duration = 0.2;
    animation.repeatCount = 0;
    animation.autoreverses = YES;
    animation.removedOnCompletion = YES;
    animation.fillMode = kCAFillModeForwards;
    
    [bar.layer addAnimation:animation forKey:@"Float"];
}
- (void)userClickedOnPieIndexItem:(NSInteger)pieIndex
{
    NSArray *items = @[[PNPieChartDataItem dataItemWithValue:40 color:PNLightGreen],
                       [PNPieChartDataItem dataItemWithValue:60 color:PNFreshGreen description:@"ss星星"],
                       [PNPieChartDataItem dataItemWithValue:20 color:PNDeepGreen description:@"s嬷嬷"],
                       [PNPieChartDataItem dataItemWithValue:10 color:PNDeepGreen description:@"ss嬷嬷"]
                       ];
    [self.pieChart updateChartData:items];
    //self.pieChart.showOnlyValues = NO;
    //[self.pieChart recompute];
}
- (void)didUnselectPieItem
{
    //你好！！！
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
