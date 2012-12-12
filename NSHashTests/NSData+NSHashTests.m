//
//  Copyright 2012 Christoph Jerolimov
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

#import "NSData+NSHashTests.h"
#import "NSData+NSHash.h"

@implementation NSData_NSHashTests

- (void) testMD5 {
	NSData* actualHash = [[NSData dataWithBytes:"NSHash" length:6] MD5];
	NSData* expectedHash = [self parseHexString:@"ccbe85c2011c5fe3da7d760849c4f99e"];
	STAssertEqualObjects(actualHash, expectedHash, @"Hashing does not work like expected.");
}

- (void) testSHA1 {
	NSData* actualHash = [[NSData dataWithBytes:"NSHash" length:6] SHA1];
	NSData* expectedHash = [self parseHexString:@"f5b17712c5d31ab49654b0baadf699561958d750"];
	STAssertEqualObjects(actualHash, expectedHash, @"Hashing does not work like expected.");
}

- (void) testSHA256 {
	NSData* actualHash = [[NSData dataWithBytes:"NSHash" length:6] SHA256];
	NSData* expectedHash = [self parseHexString:@"84423607efac17079369134460239541285d5ff40594f9b8b16f567500162d2e"];
	STAssertEqualObjects(actualHash, expectedHash, @"Hashing does not work like expected.");
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
	return data;
}

@end
