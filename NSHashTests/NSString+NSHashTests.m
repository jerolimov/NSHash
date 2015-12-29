//
//  Copyright 2012-2015 Christoph Jerolimov
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License
//

#import "NSString+NSHashTests.h"
#import "NSString+NSHash.h"

@implementation NSString_NSHashTests

- (void) testMD5 {
	NSString* actualHash = [@"NSHash" MD5];
	NSString* expectedHash = @"ccbe85c2011c5fe3da7d760849c4f99e";
	XCTAssertEqualObjects(actualHash, expectedHash, @"Hashing does not work like expected.");
}

- (void) testMD5Data {
    NSData* actualHash = [@"NSHash" MD5Data];
    NSData* expectedHash = [self parseHexString:@"ccbe85c2011c5fe3da7d760849c4f99e"];
    XCTAssertEqualObjects(actualHash, expectedHash, @"Hashing does not work like expected.");
}

- (void) testSHA1 {
	NSString* actualHash = [@"NSHash" SHA1];
	NSString* expectedHash = @"f5b17712c5d31ab49654b0baadf699561958d750";
	XCTAssertEqualObjects(actualHash, expectedHash, @"Hashing does not work like expected.");
}

- (void) testSHA1Data {
    NSData* actualHash = [@"NSHash" SHA1Data];
    NSData* expectedHash = [self parseHexString:@"f5b17712c5d31ab49654b0baadf699561958d750"];
    XCTAssertEqualObjects(actualHash, expectedHash, @"Hashing does not work like expected.");
}

- (void) testSHA256 {
	NSString* actualHash = [@"NSHash" SHA256];
	NSString* expectedHash = @"84423607efac17079369134460239541285d5ff40594f9b8b16f567500162d2e";
	XCTAssertEqualObjects(actualHash, expectedHash, @"Hashing does not work like expected.");
}

- (void) testSHA256Data {
    NSData* actualHash = [@"NSHash" SHA256Data];
    NSData* expectedHash = [self parseHexString:@"84423607efac17079369134460239541285d5ff40594f9b8b16f567500162d2e"];
    XCTAssertEqualObjects(actualHash, expectedHash, @"Hashing does not work like expected.");
}

- (NSData*) parseHexString:(NSString*) string {
    char buffer[3] = { 0, 0, 0 };
    NSMutableData* data = [NSMutableData dataWithCapacity:string.length / 2];
    for (NSUInteger i = 0; i < string.length / 2; i++) {
        buffer[0] = [string characterAtIndex:i * 2];
        buffer[1] = [string characterAtIndex:i * 2 + 1];
        const char byte = strtol(buffer, NULL, 16);
        [data appendBytes:&byte length:1];
    }
    return [data copy];
}

@end
