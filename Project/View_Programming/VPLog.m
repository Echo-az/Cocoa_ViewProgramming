//
//  VPLog.m
//  View_Programming
//
//  Created by yalinli on 2021/9/17.
//

#import "VPLog.h"

@implementation VPLog

- (id)init {
	self = [super init];
	if (self) {
		_showFR = YES;
		_showMouse = NO;
		_showKE = NO;
		_showKIC = NO;
		_showKA = NO;
		_logView = [NSTextView scrollableTextView];
		[(NSTextView *)[[self logView] documentView] setEditable:NO];
	}
	return self;
}

- (void)log:(NSString *)info {
	NSTextView *output  = [[self logView] documentView];
	NSString *old = [output string];
	[output setString:[old stringByAppendingString:info]];
	CGFloat height = [output frame].size.height - [self logView].frame.size.height;
	height = height > 0 ? height + 100: 0;
	[[[self logView] contentView] scrollToPoint:NSMakePoint(0, height)];
}

- (void)clear {
	[(NSTextView *)[[self logView] documentView] setString:@""];
}

@end
