NSHash adds hashing methods to NSString and NSData.

## Use it

Copy the NSHash class into your project or add this line to your Podfile

	pod 'NSHash', '~> 0.1.0'

not released or added yet!

## Quick API overview

Call md5, sha1 and sha256 on any NSString:

	NSString* string = @"NSHash";
	NSLog(@"MD5:    %@", [string md5]);
	NSLog(@"SHA1:   %@", [string sha1]);
	NSLog(@"SHA256: %@", [string sha256]);
	
Outputs:

	MD5:    ccbe85c2011c5fe3da7d760849c4f99e
	SHA1:   f5b17712c5d31ab49654b0baadf699561958d750
	SHA256: 84423607efac17079369134460239541285d5ff40594f9b8b16f567500162d2e

TODO NSData example (API not final here!)
