//
//  ViewController.m
//  AA
//
//  Created by YKJ3 on 16/8/9.
//  Copyright © 2016年 YKJ3. All rights reserved.
//

#import "ViewController.h"
//#define ARC4RANDOM_MAX 0x100000000
#import "MBProgressHUD.h"
#import "AFNetworking.h"
@interface ViewController ()<PNChartDelegate>
{
    NSArray *data01Array;
    PNLineChart * lineChart;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //data01Array = @[@60.1, @160.1, @126.4, @262.2, @186.2];
    
#if KKAA
    [self aLineChart:data01Array];
#elif KKBB
    [self aPieChart];
#elif KKCC
    [self aBarChart];
#endif
    
    
    //[self aBarChart];
    //[self aPieChart];
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    btn.backgroundColor=[UIColor orangeColor];
    [btn addTarget:self action:@selector(fa) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
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

-(void)fa{
    
    [self.barChart setXLabels:@[@"Jan 1",@"Jan 2",@"Jan 3",@"Jan 4",@"Jan 5",@"Jan 6",@"Jan 7"]];
    [self.barChart updateChartData:@[@(arc4random() % 30),@(arc4random() % 30),@(arc4random() % 30),@(arc4random() % 30),@(arc4random() % 30),@(arc4random() % 30),@(arc4random() % 30)]];
 
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
