//
//  snappy_oc.h
//  snappy-oc
//
//  Created by Silence on 2019/3/16.
//  Copyright © 2019年 Silence. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Snappy)

- (NSData *)compressedData;
- (NSData *)decompressedData;
- (NSString *)decompressedString;

@end

@interface NSString (Snappy)

- (NSData *)compressedString;

@end
