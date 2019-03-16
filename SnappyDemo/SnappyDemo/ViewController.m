//
//  ViewController.m
//  SnappyDemo
//
//  Created by Silence on 2019/3/16.
//  Copyright © 2019年 Silence. All rights reserved.
//

#import "ViewController.h"
#import "Foundation+Snappy.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testJSONCompression];
}
    
- (void)testJSONCompression {
    NSString *JSONPath = [[NSBundle mainBundle] pathForResource:@"example" ofType:@"json"];
    
    NSData *original = [NSData dataWithContentsOfFile:JSONPath];
    
    NSData *compressedData = [original compressedData];
    
    NSData *decompressedData = [compressedData decompressedData];
    
    NSUInteger orignLen = [original length];
    NSUInteger compressLen = [compressedData length];
    
    float bench = (compressLen * 100.0) / orignLen ;
    
    NSLog(@"原数据长度:%ld,压缩后数据长度:%ld,压缩比例:%f",orignLen,compressLen,bench);
    
    NSString *decompressedString = [compressedData decompressedString];
    
    NSLog(@"JSON String:%@",decompressedString);
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:decompressedData options:NSJSONReadingMutableContainers error:NULL];
    NSLog(@"JSON Dictionary:%@",dic);
}


@end
