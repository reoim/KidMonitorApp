//
//  GraphViewController.m
//  KidMonitorApp
//
//  Created by Reo Lee on 28/05/2015.
//  Copyright (c) 2015 reoim. All rights reserved.
//

#import "GraphViewController.h"


@interface GraphViewController () 

@property (nonatomic, strong) ShinobiChart *chart;
@property (nonatomic, strong) NSDictionary *sales;
@property (nonatomic, strong) NSDictionary *yolo;
@property (nonatomic, strong) NSArray *test1;
@property (nonatomic, strong) NSArray *test2;
@property (nonatomic, strong) NSArray *test3;
@property (nonatomic, strong) NSArray *emotion;
@property (nonatomic, strong) NSArray *learning;
@property (nonatomic, strong) NSArray *playing;
@property (nonatomic, strong) NSArray *eating;
@property (nonatomic, strong) NSArray *sleeping;
@property (nonatomic, strong) NSArray *incident;
//@property (nonatomic, strong) NSMutableDictionary *emotionHappy;

@end

@implementation GraphViewController
@synthesize currentChildId, thisMonth, todayDate;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpChart];
    
    
    
    
    
    
    
    _sales = @{@"Broccoli" : @5.65, @"Carrots" : @30.6, @"Mushrooms" : @8.4};
    _yolo = @{@"Broccoli" : @2.65, @"Carrots" : @10.6, @"Mushrooms" : @20.4};
    _test1 = @[@2, @9, @10];
    _test2= @[@7, @7, @10];
    _test3 = @[@9, @12, @5];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    
    [self performSelector:@selector(retrieveFromParse)];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Set up methods

- (void)setUpChart {
    self.chart = [[ShinobiChart alloc] initWithFrame:CGRectInset(self.view.bounds, 20, 100)];
    self.chart.title = @"My First Chart";
    self.chart.licenseKey = @"bqrxSh5WcBX7iWnMjAxNTA2MjZyZW9pbTEwQGdtYWlsLmNvbQ==Hb5rww/fEoGfJhDqibDd7glMOWZg9qDNIXktkBMdk2o9VK09G2aLLdMe7EaXAVyBrAzzlA0oAKAMhm4e2mDOMg/simYm1xjr9G4Wt2YqTd9YcJNArk8+iJcuyr71boITe9qn0+Ud+y2fkkhhF8zHsft4odxg=BQxSUisl3BaWf/7myRmmlIjRnMU2cA7q+/03ZX9wdj30RzapYANf51ee3Pi8m2rVW6aD7t6Hi4Qy5vv9xpaQYXF5T7XzsafhzS3hbBokp36BoJZg8IrceBj742nQajYyV7trx5GIw9jy/V6r0bvctKYwTim7Kzq+YPWGMtqtQoU=PFJTQUtleVZhbHVlPjxNb2R1bHVzPnh6YlRrc2dYWWJvQUh5VGR6dkNzQXUrUVAxQnM5b2VrZUxxZVdacnRFbUx3OHZlWStBK3pteXg4NGpJbFkzT2hGdlNYbHZDSjlKVGZQTTF4S2ZweWZBVXBGeXgxRnVBMThOcDNETUxXR1JJbTJ6WXA3a1YyMEdYZGU3RnJyTHZjdGhIbW1BZ21PTTdwMFBsNWlSKzNVMDg5M1N4b2hCZlJ5RHdEeE9vdDNlMD08L01vZHVsdXM+PEV4cG9uZW50PkFRQUI8L0V4cG9uZW50PjwvUlNBS2V5VmFsdWU+";
    
    self.chart.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    
    
    // add a pair of axes
    SChartCategoryAxis *xAxis = [[SChartCategoryAxis alloc] init];
    xAxis.title = @"Date";
    _chart.xAxis = xAxis;
    
    SChartAxis *yAxis = [[SChartNumberAxis alloc] init];
    yAxis.title = @"Times";
    _chart.yAxis = yAxis;
    
    self.chart.datasource =self;
    
    [self.view addSubview:self.chart];
    
    // show the legend
    _chart.legend.hidden = NO;
    _chart.legend.placement = SChartLegendPlacementInsidePlotArea;
    
}

- (void)retrieveFromParse {
    
    currentChildId = [CurrentChildClass getChildId];
    
    NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
    [timeFormat setDateFormat:@"MMM dd"];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    //happy
    NSMutableDictionary *emotionHappy = [[NSMutableDictionary alloc] init];
    
    for (int i = 0; i <7; i++) {
        NSDate *today = [calendar dateByAddingUnit:NSCalendarUnitDay value:-i toDate:[NSDate date] options:0];
        NSString *todate = [timeFormat stringFromDate:today];
        PFQuery *emotionQuery = [PFQuery queryWithClassName:@"Activity"];
        [emotionQuery whereKey:@"childId" equalTo:currentChildId];
        [emotionQuery whereKey:@"recordedTime" hasPrefix:todate];
        [emotionQuery whereKey:@"activityDetail" equalTo:@"Happy"];
        [emotionQuery countObjectsInBackgroundWithBlock:^(int count, NSError *error) {
            if (!error) {
                int num = count;
                [emotionHappy setValue:[NSNumber numberWithInt:num] forKey:todate];
                
            }
            NSLog(@"%@",emotionHappy);
        }];
        
    }
    
    
    

}




#pragma mark - SChartDataSource methods




- (NSInteger)numberOfSeriesInSChart:(ShinobiChart *)chart {
    return 2;
    //return 2;
}

- (SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index {
//    SChartLineSeries *series = [SChartLineSeries new];
//    
//    if (index == 0) {
//        series.title = @"y = cos(x)";
//    } else {
//        series.title = @"y = sin(x)";
//    }
//    return series;
    
    
    
    
    
    
    SChartColumnSeries *lineSeries = [[SChartColumnSeries alloc] init];
    if (index ==0) {
        lineSeries.title = @"Emotion";
    } else {
        lineSeries.title = @"Eating";
    }
    lineSeries.stackIndex = @0;
    return lineSeries;

    
    
    
}

- (NSInteger)sChart:(ShinobiChart *)chart numberOfDataPointsForSeriesAtIndex:(NSInteger)seriesIndex {
//    return 100;
//    return _sales.allKeys.count;
    return 1;
   
    
}

- (id<SChartData>)sChart:(ShinobiChart *)chart dataPointAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
//    SChartDataPoint *dp = [SChartDataPoint new];
//    double xValue = dataIndex / 10.0;
//    dp.xValue = @(xValue);
//    
//    
//    if (seriesIndex == 0) {
//        dp.yValue = @(cos(xValue));
//    } else {
//        dp.yValue = @(sin(xValue));
//    }
//    return dp;

    
//        NSArray* hey = [[GraphSharedInfo sharedInstance]datesInMonth];
//        NSString* hoy = hey[dataIndex];
    
    
    
    
//    SChartDataPoint *datapoint = [[SChartDataPoint alloc] init];
//    NSString* key = _sales.allKeys[dataIndex];
    
//    datapoint.xValue = key;
//    datapoint.yValue = _sales[key];
//    
    
//    return datapoint;

    
//    SChartDataPoint *dataPoint = [SChartDataPoint new];
//    
//    if(seriesIndex == 0){
//        dataPoint.xValue = [_bronzeMedals objectAtIndex:dataIndex];
//    } else if(seriesIndex == 1) {
//        dataPoint.xValue = [_silverMedals objectAtIndex:dataIndex];
//    } else {
//        dataPoint.xValue = [_goldMedals objectAtIndex:dataIndex];
//    }
//    dataPoint.yValue = [_countries objectAtIndex:dataIndex];
//    
//    return dataPoint;
    
    
    
    SChartDataPoint *datapoint = [[SChartDataPoint alloc] init];
    NSString* key = _sales.allKeys[dataIndex];
    NSString* hoy = _yolo.allKeys[dataIndex];
//    if (seriesIndex == 0) {
//        datapoint.yValue = [_test1 objectAtIndex:dataIndex];
//    } else if (seriesIndex == 1) {
//        datapoint.yValue = [_test2 objectAtIndex:dataIndex];
//    } else {
//        datapoint.yValue = [_test3 objectAtIndex:dataIndex];
//    }
    datapoint.xValue = key;
    if (seriesIndex == 0) {
        datapoint.yValue = _sales[key];
    } else {
        datapoint.yValue = _yolo[hoy];
    }
    
    return datapoint;
    

}


@end
