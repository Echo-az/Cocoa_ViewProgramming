//
//  InfoPaneViewController.m
//  View_Programming
//
//  Created by yalinli on 2021/9/10.
//

#import "InfoPaneViewController.h"
#import "VPLog.h"

@interface InfoPaneViewController ()

@property NSButton *switchButton;

@property NSTextField *frameInfoView;
@property NSTextField *boundsInfoView;


@end

@implementation InfoPaneViewController

- (id)initWithItemView:(VPItemView *)aItemView andLogger:(VPLog *)logger{
	self = [super init];
	if (self) {
		_itemView = aItemView;
		_logger = logger;
		
		[[self view] addSubview:[[testView alloc] initWithFrame:NSMakeRect(10, 60, 80, 40) andName:@"3" andLogger:[self logger]]];
		[[self view] addSubview:[[testView alloc] initWithFrame:NSMakeRect(110, 10, 80, 40) andName:@"2" andLogger:[self logger]]];
		[[self view] addSubview:[[testView alloc] initWithFrame:NSMakeRect(10, 10, 80, 40) andName:@"1" andLogger:[self logger]]];
		
		_switchButton = [NSButton buttonWithTitle:@"SWITCH" target:self action:@selector(switchRect)];
		[[self switchButton] setFrame:NSMakeRect(10, 110, 80, 30)];
		[[self view] addSubview:[self switchButton]];
		
		NSButton *resetButton = [NSButton buttonWithImage:[NSImage imageWithSystemSymbolName:@"arrow.counterclockwise" accessibilityDescription:nil] target:[self itemView] action:@selector(resetAll)];
		[resetButton setFrameOrigin:NSMakePoint(80, 110)];
		[[self view] addSubview:resetButton];
		
		NSButton *zoomInButton = [NSButton buttonWithImage:[NSImage imageWithSystemSymbolName:@"plus.magnifyingglass" accessibilityDescription:nil] target:[self itemView] action:@selector(zoomInSize)];
		[zoomInButton setFrameOrigin:NSMakePoint(20, 140)];
		[[self view] addSubview:zoomInButton];
		NSButton *zoomOutButton = [NSButton buttonWithImage:[NSImage imageWithSystemSymbolName:@"minus.magnifyingglass" accessibilityDescription:nil] target:[self itemView] action:@selector(zoomOutSize)];
		[zoomOutButton setFrameOrigin:NSMakePoint(70, 140)];
		[[self view] addSubview:zoomOutButton];
		
		
		[self addLocButtonNamed:@"chevron.up" withRect:NSMakeRect(50, 170, 30, 30) andAction:@selector(moveUp:)];
		[self addLocButtonNamed:@"chevron.down" withRect:NSMakeRect(50, 230, 30, 30) andAction:@selector(moveDown:)];
		[self addLocButtonNamed:@"chevron.left" withRect:NSMakeRect(20, 200, 30, 30) andAction:@selector(moveLeft:)];
		[self addLocButtonNamed:@"chevron.right" withRect:NSMakeRect(80, 200, 30, 30) andAction:@selector(moveRight:)];
		
		_frameInfoView = [NSTextField wrappingLabelWithString:[[NSString alloc] initWithFormat:@"Frame rectangle\n   Location: (%0.0f, %0.0f)\n   Size: (%0.0f, %0.0f)", aItemView.frame.origin.x, aItemView.frame.origin.y, aItemView.frame.size.width, aItemView.frame.size.height]];
		[[self frameInfoView] setTextColor:[NSColor redColor]];
		[[self frameInfoView] setFrame:NSMakeRect(130, 140, 160, 60)];
		[[self view] addSubview:[self frameInfoView]];
		
		_boundsInfoView = [NSTextField wrappingLabelWithString:[[NSString alloc] initWithFormat:@"Bounds rectangle\n   Location: (%0.0f, %0.0f)\n   Size: (%0.0f, %0.0f)", aItemView.bounds.origin.x, aItemView.bounds.origin.y, aItemView.bounds.size.width, aItemView.bounds.size.height]];
		[[self boundsInfoView] setFrame:NSMakeRect(130, 200, 160, 60)];
		[[self view] addSubview:[self boundsInfoView]];
		
		NSButton *showFR = [NSButton buttonWithTitle:@"First Responder" target:self action:@selector(switchShowFR)];
		[showFR setFrameOrigin:NSMakePoint(20, 260)];
		[showFR setButtonType:NSButtonTypeSwitch];
		[showFR setState:[[self logger] showFR] ? NSControlStateValueOn : NSControlStateValueOff];
		[[self view] addSubview:showFR];
		
		NSButton *showMouse = [NSButton buttonWithTitle:@"Mouse" target:self action:@selector(switchShowMouse)];
		[showMouse setFrameOrigin:NSMakePoint(20, 280)];
		[showMouse setButtonType:NSButtonTypeSwitch];
		[showMouse setState:[[self logger] showMouse] ? NSControlStateValueOn : NSControlStateValueOff];
		[[self view] addSubview:showMouse];
		
		NSButton *showKE = [NSButton buttonWithTitle:@"Key Equivalent" target:self action:@selector(switchShowKE)];
		[showKE setFrameOrigin:NSMakePoint(20, 300)];
		[showKE setButtonType:NSButtonTypeSwitch];
		[showKE setState:[[self logger] showKE] ? NSControlStateValueOn : NSControlStateValueOff];
		[[self view] addSubview:showKE];
		
		NSButton *showKIC = [NSButton buttonWithTitle:@"Key Interface Control" target:self action:@selector(switchShowKIC)];
		[showKIC setFrameOrigin:NSMakePoint(20, 320)];
		[showKIC setButtonType:NSButtonTypeSwitch];
		[showKIC setState:[[self logger] showKIC] ? NSControlStateValueOn : NSControlStateValueOff];
		[[self view] addSubview:showKIC];
		
		NSButton *showKA = [NSButton buttonWithTitle:@"Key Action" target:self action:@selector(switchShowKA)];
		[showKA setFrameOrigin:NSMakePoint(20, 340)];
		[showKA setButtonType:NSButtonTypeSwitch];
		[showKA setState:[[self logger] showKA] ? NSControlStateValueOn : NSControlStateValueOff];
		[[self view] addSubview:showKA];
		
		NSButton *clearOutput = [NSButton buttonWithTitle:@"CLEAR" target:[self logger] action:@selector(clear)];
		[clearOutput setFrame:NSMakeRect(10, 370, 80, 30)];
		[[self view] addSubview:clearOutput];
		
		[[[self logger] logView] setFrame:NSMakeRect(10, 400, 280, 180)];
		[[self view] addSubview:[[self logger] logView]];
		
		
	}
	return self;
}

- (void)addLocButtonNamed:(NSString *)name withRect:(NSRect) rect andAction:(SEL) selector {
	NSButton *button = [NSButton buttonWithImage:[NSImage imageWithSystemSymbolName:name accessibilityDescription:nil] target:[self itemView] action:selector];
	[button setFrame:rect];
	[button setImagePosition:NSImageOnly];
	[button setBezelStyle:NSBezelStyleRegularSquare];
	[[self view] addSubview:button];
}

- (void)loadView {
	InfoPaneView *infoPaneView = [[InfoPaneView alloc] initWithFrame:NSMakeRect(600, 0, 300, 600)];
	[infoPaneView setLogger:[self logger]];
	[self setView:infoPaneView];
}

- (void)updateFrameInfo:(NSRect)newFrame {
	[[self frameInfoView] setStringValue:[NSString stringWithFormat:@"Frame rectangle\n   Location: (%0.0f, %0.0f)\n   Size: (%0.0f, %0.0f)", newFrame.origin.x, newFrame.origin.y, newFrame.size.width, newFrame.size.height]];
	[[self frameInfoView] setNeedsDisplay:YES];
}

- (void)updateBoundsInfo:(NSRect)newFrame {
	[[self boundsInfoView] setStringValue:[NSString stringWithFormat:@"Bounds rectangle\n   Location: (%0.0f, %0.0f)\n   Size: (%0.0f, %0.0f)", newFrame.origin.x, newFrame.origin.y, newFrame.size.width, newFrame.size.height]];
	[[self boundsInfoView] setNeedsDisplay:YES];
}

- (void)switchRect {
	BOOL isFrame = [[self itemView] isFrame] ? NO : YES;
	[[self itemView] setIsFrame:isFrame];
	if (isFrame) {
		[[self frameInfoView] setTextColor:[NSColor redColor]];
		[[self boundsInfoView] setTextColor:[NSColor blackColor]];
	} else {
		[[self frameInfoView] setTextColor:[NSColor blackColor]];
		[[self boundsInfoView] setTextColor:[NSColor redColor]];
	}
}

- (void)switchShowFR {
	BOOL showFR = [[self logger] showFR] ? NO : YES;
	[[self logger] setShowFR:showFR];
}

- (void)switchShowMouse {
	BOOL showMouse = [[self logger] showMouse] ? NO : YES;
	[[self logger] setShowMouse:showMouse];
}

- (void)switchShowKIC {
	BOOL showKIC = [[self logger] showKIC] ? NO : YES;
	[[self logger] setShowKIC:showKIC];
}

- (void)switchShowKE {
	BOOL showKE = [[self logger] showKE] ? NO : YES;
	[[self logger] setShowKE:showKE];
}

- (void)switchShowKA {
	BOOL showKA = [[self logger] showKA] ? NO : YES;
	[[self logger] setShowKA:showKA];
}

- (void)mouseDown:(NSEvent *)event {
	if ([[self logger] showMouse]) {
[[self logger] log:[NSString stringWithFormat:@"[InfoPaneViewController mouseDown]\n"]];
	}
	[super mouseDown:event];
}

- (void)keyDown:(NSEvent *)event {
	if ([[self logger] showKA]) {
		[[self logger] log:[NSString stringWithFormat:@"[InfoPaneViewController keyDown]\n"]];
	}
	[super keyDown:event];
}

- (void)doCommandBySelector:(SEL)selector {
	if ([[self logger] showKA]) {
		[[self logger] log:[NSString stringWithFormat:@"[InfoPaneViewController doCommandBySelector] %s\n", sel_getName(selector)]];
	}
	[super doCommandBySelector:selector];
}

@end
