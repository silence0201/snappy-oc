# snappy-oc
snappy-oc

>
Snappy 在 Google 内部被广泛的使用，从 BigTable 到 MapReduce 以及内部的 RPC 系统。  
snappy 是一个压缩库。它可以利用单颗Intel Corei7处理器内核处理至少每秒250MB~500MB的数据流。  
snappy 的前身是Zippy。虽然只是一个数据压缩库，它却被Google用于许多内部项目程，其中就包括BigTable，MapReduce和RPC。Google宣称它在这个库本身及其算法做了数据处理速度上的优化，作为代价，并没有考虑输出大小以及和其他类似工具的兼容性问题。Snappy特地为64位x86处理器做了优化，在单个Intel Core i7处理器内核上能够达到至少每秒250MB的压缩速率和每秒500MB的解压速率。  
如果允许损失一些压缩率的话，那么可以达到更高的压缩速度，虽然生成的压缩文件可能会比其他库的要大上20%至100%，但是，相比其他的压缩库，Snappy却能够在特定的压缩率下拥有惊人的压缩速度，“压缩普通文本文件的速度是其他库的1.5-1.7倍，HTML能达到2-4倍，但是对于JPEG、PNG以及其他的已压缩的数据，压缩速度不会有明显改善”。

## 使用

将`snappy-oc/SnappyOC`里面静态库添加到项目中

导入头文件

```
#import "Foundation+Snappy.h"
```

使用:

```
- (void)testJSONCompression {
    NSString *JSONPath = [[NSBundle mainBundle] pathForResource:@"example" ofType:@"json"];
    
    NSData *original = [NSData dataWithContentsOfFile:JSONPath];
    
    NSData *compressedData = [original compressedSnappyData];
    
    NSData *decompressedData = [compressedData decompressedSnappyData];
    
    NSUInteger orignLen = [original length];
    NSUInteger compressLen = [compressedData length];
    
    float bench = (compressLen * 100.0) / orignLen ;
    
    NSLog(@"原数据长度:%ld,压缩后数据长度:%ld,压缩比例:%f",orignLen,compressLen,bench);
    
    NSString *decompressedString = [compressedData decompressedSnappyString];
    
    NSLog(@"JSON String:%@",decompressedString);
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:decompressedData options:NSJSONReadingMutableContainers error:NULL];
    NSLog(@"JSON Dictionary:%@",dic);
}
```

	
## snappy-oc
snappy-oc is available under the MIT license. See the LICENSE file for more info.
