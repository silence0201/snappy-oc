//
//  snappy_oc.m
//  snappy-oc
//
//  Created by Silence on 2019/3/16.
//  Copyright © 2019年 Silence. All rights reserved.
//

#import "Foundation+Snappy.h"
#import "snappy-c.h"

@implementation NSData (Snappy)

- (NSData *)compressedSnappyData {
    char *buffer = (char *)[self bytes];
    NSUInteger dataLen = [self length];
    
    int error = 0;
    
    size_t compressLen = snappy_max_compressed_length(dataLen);
    char *compressBuffer = (char *)malloc(compressLen);
    error = snappy_compress(buffer, dataLen, compressBuffer, &compressLen);
    NSData *compressData;
    if (error == 0) {
        compressData = [[NSData alloc] initWithBytes:compressBuffer length:compressLen];
    }
    return compressData;
    

}

- (NSData *)decompressedSnappyData {
    size_t uncompressLen;
    char *buffer = (char *)[self bytes];
    NSUInteger dataLen = [self length];
    
    int error = 0;
    snappy_uncompressed_length(buffer, dataLen, &uncompressLen);
    char *uncompressData = (char *)malloc(sizeof(char) * uncompressLen);
    error = snappy_uncompress(buffer, dataLen, uncompressData, &uncompressLen);
    if (error != 0) {
        free(uncompressData);
        uncompressData = NULL;
    }
    
    return [[NSData alloc] initWithBytes:uncompressData length:uncompressLen];
}

- (NSString *)decompressedSnappyString {
    return [[NSString alloc] initWithData:[self decompressedSnappyData]
                                 encoding:NSUTF8StringEncoding];
}

@end

@implementation NSString (Snappy)

- (NSData *)compressedSnappyString {
    return [[self dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:NO] compressedSnappyData];
}

@end


