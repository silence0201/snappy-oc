//
//  snappy_oc.m
//  snappy-oc
//
//  Created by Silence on 2019/3/16.
//  Copyright © 2019年 Silence. All rights reserved.
//

#import "Foundation+Snappy.h"
#import "snappy.h"

@implementation NSData (Snappy)

- (NSData *)compressedData {
    struct snappy_env env;
    NSAssert(snappy_init_env(&env) == 0, @"初始化压缩环境失败");
    size_t clen = snappy_max_compressed_length(self.length);
    NSAssert(clen >= 0, @"数据长度不能为00");
    char *buffer = malloc(clen);
    NSAssert(snappy_compress(&env, self.bytes, self.length, buffer, &clen) == 0, @"压缩失败");
    snappy_free_env(&env);
    return [NSData dataWithBytesNoCopy:buffer length:clen];
}

- (NSData *)decompressedData {
    size_t ulen;
    snappy_uncompressed_length(self.bytes, self.length, &ulen);
    char *buffer = malloc(ulen);
    assert(snappy_uncompress(self.bytes, self.length, buffer) == 0);
    return [NSData dataWithBytesNoCopy:buffer length:ulen];
}

- (NSString *)decompressedString {
    return [[NSString alloc] initWithData:[self decompressedData]
                                 encoding:NSUTF8StringEncoding];
}

@end

@implementation NSString (Snappy)

- (NSData *)compressedString {
    return [[self dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:NO] compressedData];
}

@end


