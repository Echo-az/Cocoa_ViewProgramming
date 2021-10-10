//
//  DrawAreaViewController.m
//  View_Programming
//
//  Created by yalinli on 2021/9/10.
//

#import "DrawAreaViewController.h"

@interface DrawAreaViewController ()

@end

@implementation DrawAreaViewController

- (id)initWithLogger:(VPLog *)logger {
	self = [super init];
	if (self) {
		_logger = logger;
		_itemView = [[VPItemView alloc] initWithLogger:[self logger]];
		[[self itemView] setLogger:[self logger]];
		[[self view] addSubview:[self itemView]];
	}
	return self;
}

- (void)loadView {
	DrawAreaView *drawAreaView = [[DrawAreaView alloc] initWithFrame:NSMakeRect(0, 0, 600, 600)];
	[drawAreaView setWantsLayer:YES];
	[[drawAreaView layer] setBackgroundColor:[[NSColor lightGrayColor] CGColor]];
	[drawAreaView setLogger:[self logger]];
	[self setView:drawAreaView];
}

- (void)mouseDown:(NSEvent *)event {
	if ([[self logger] showMouse]) {
	[[self logger] log:[NSString stringWithFormat:@"[DrawAreaViewController mouseDown]\n"]];
	}
	[super mouseDown:event];
}

- (void)keyDown:(NSEvent *)event {
	if ([[self logger] showKA]) {
		[[self logger] log:[NSString stringWithFormat:@"[DrawAreaViewController keyDown]\n"]];
	}
	[super keyDown:event];
}

- (void)doCommandBySelector:(SEL)selector {
	if ([[self logger] showKA]) {
		[[self logger] log:[NSString stringWithFormat:@"[DrawAreaViewController doCommandBySelector] %s\n", sel_getName(selector)]];
	}
	[super doCommandBySelector:selector];
}

@end
