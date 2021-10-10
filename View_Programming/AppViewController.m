//
//  AppViewController.m
//  View_Programming
//
//  Created by yalinli on 2021/8/26.
//

#import "AppViewController.h"

@interface AppViewController ()


@end

@implementation AppViewController

- (id)initWithLogger:(VPLog *)logger {
	self = [super init];
	if (self) {
		_logger = logger;
		_drawAreaViewController = [[DrawAreaViewController alloc] initWithLogger:[self logger]];
		_infoPaneViewController = [[InfoPaneViewController alloc] initWithItemView:[[self drawAreaViewController] itemView] andLogger:[self logger]];
		[[[self drawAreaViewController] itemView] setDelegate:[self infoPaneViewController]];
		[[self view] addSubview:[[self drawAreaViewController] view]];
		[[self view] addSubview:[[self infoPaneViewController] view]];
	}
	return self;
}

- (void)loadView {
	VPContentView *contentView = [[VPContentView alloc] initWithFrame:NSMakeRect(0, 0, 900, 600)];
	[contentView setLogger:[self logger]];
	[self setView:contentView];
}

- (void)mouseDown:(NSEvent *)event {
	if ([[self logger] showMouse]) {
		[[self logger] log:[NSString stringWithFormat:@"[AppViewController mouseDown]\n"]];
	}
	[super mouseDown:event];
}

- (void)keyDown:(NSEvent *)event {
	if ([[self logger] showKA]) {
		[[self logger] log:[NSString stringWithFormat:@"[AppViewController keyDown]\n"]];
	}
	[super keyDown:event];
}

- (void)doCommandBySelector:(SEL)selector {
	if ([[self logger] showKA]) {
		[[self logger] log:[NSString stringWithFormat:@"[AppViewController doCommandBySelector] %s\n", sel_getName(selector)]];
	}
	[super doCommandBySelector:selector];
}

@end
