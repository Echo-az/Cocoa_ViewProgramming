//
//  VPItemView.m
//  View_Programming
//
//  Created by yalinli on 2021/9/15.
//

#import "VPItemView.h"

@implementation VPItemView{
	NSRect original;
}

- (id)initWithLogger:(VPLog *)logger {
	NSImage *image = [NSImage imageNamed:@"Cat"];
	original = NSMakeRect(0, 0, image.size.width/10, image.size.height/10);
	self = [super initWithFrame:original];
	if (self) {
		_logger = logger;
		VPImageView *imageView = [[VPImageView alloc] initWithFrame:original];
		[imageView setLogger:[self logger]];
		[imageView setImage:image];
		[self addSubview:imageView];
		
		[self setWantsLayer:YES];
		[[self layer] setBorderWidth:2];
		[[self layer] setBorderColor:[[NSColor redColor] CGColor]];
		
		[self setIsFrame:YES];
	}
	return self;
}

- (void)resetAll {
	[self setFrame:original];
	[self setBounds:original];
}

- (void)setFrame:(NSRect)frame {
	[super setFrame:frame];
	[[self delegate] updateFrameInfo:frame];
}

- (void)setBounds:(NSRect)bounds {
	[super setBounds:bounds];
	[[self delegate] updateBoundsInfo:bounds];
}

- (BOOL)acceptsFirstResponder {
	BOOL result = YES;
	if ([[self logger] showFR]){
		[[self logger] log:[NSString stringWithFormat:@"[VPItemView acceptFirstResponder] : %hhd\n", result]];
	}
	return result;
}

- (BOOL)becomeFirstResponder {
	BOOL result = [super becomeFirstResponder];
	if ([[self logger] showFR]){
		[[self logger] log:[NSString stringWithFormat:@"[VPItemView becomeFirstResponder] : %hhd\n", result]];
	}
	return result;
}

- (BOOL)resignFirstResponder {
	BOOL result = YES;
	if ([[self logger] showFR]){
		[[self logger] log:[NSString stringWithFormat:@"[VPItemView resignFirstResponder] : %hhd\n", result]];
	}
	return result;
}

- (void)mouseDown:(NSEvent *)event {
	[[self window] makeFirstResponder:self];
	if ([[self logger] showMouse]) {
	[[self logger] log:[NSString stringWithFormat:@"[VPItemView mouseDown]\n"]];
	}
	[super mouseDown:event];
}

- (BOOL)performKeyEquivalent:(NSEvent *)event {
	if ([[self logger] showKE]) {
	[[self logger] log:[NSString stringWithFormat:@"Begin [VPItemView performKeyEquivalent]\n"]];
	}
	BOOL result = [super performKeyEquivalent:event];
	if ([[self logger] showKE]) {
		[[self logger] log:[NSString stringWithFormat:@"[VPItemView performKeyEquivalent] : %hhd\n", result]];
	}
	return result;
}

- (BOOL)canBecomeKeyView {
	BOOL result = [super canBecomeKeyView];
	if ([[self logger] showKIC]) {
	[[self logger] log:[NSString stringWithFormat:@"[VPItemView canBecomeKeyView] : %hhd\n", result]];
	}
	return result;
}

- (void)keyDown:(NSEvent *)event {
	if ([[self logger] showKA]) {
		[[self logger] log:[NSString stringWithFormat:@"[VPItemView keyDown]\n"]];
	}
//	[self interpretKeyEvents:[NSArray arrayWithObject:event]];
	[super keyDown:event];
}

- (void)doCommandBySelector:(SEL)selector {
	if ([[self logger] showKA]) {
		[[self logger] log:[NSString stringWithFormat:@"[VPItemView doCommandBySelector] %s\n", sel_getName(selector)]];
	}
	[super doCommandBySelector:selector];
}

- (void)moveUp:(id)sender {
	if ([self isFrame]) {
		NSRect old = [self frame];
		[self setFrame:NSMakeRect(old.origin.x, old.origin.y + 10, old.size.width, old.size.height)];
	} else {
		NSRect old = [self bounds];
		[self setBounds:NSMakeRect(old.origin.x, old.origin.y + 10, old.size.width, old.size.height)];
	}
	if ([[self logger] showKA]) {
		[[self logger] log:[NSString stringWithFormat:@"[VPItemView moveUp]\n"]];
	}
}

- (void)moveDown:(id)sender {
	if ([self isFrame]) {
		NSRect old = [self frame];
		[self setFrame:NSMakeRect(old.origin.x, old.origin.y - 10, old.size.width, old.size.height)];
	} else {
		NSRect old = [self bounds];
		[self setBounds:NSMakeRect(old.origin.x, old.origin.y - 10, old.size.width, old.size.height)];
	}
	if ([[self logger] showKA]) {
		[[self logger] log:[NSString stringWithFormat:@"[VPItemView moveDown]\n"]];
	}
}

- (void)moveLeft:(id)sender {
	if ([self isFrame]) {
		NSRect old = [self frame];
		[self setFrame:NSMakeRect(old.origin.x - 10, old.origin.y, old.size.width, old.size.height)];
	} else {
		NSRect old = [self bounds];
		[self setBounds:NSMakeRect(old.origin.x - 10, old.origin.y, old.size.width, old.size.height)];
	}
	if ([[self logger] showKA]) {
		[[self logger] log:[NSString stringWithFormat:@"[VPItemView moveLeft]\n"]];
	}
}

- (void)moveRight:(id)sender {
	if ([self isFrame]) {
		NSRect old = [self frame];
		[self setFrame:NSMakeRect(old.origin.x + 10, old.origin.y, old.size.width, old.size.height)];
	} else {
		NSRect old = [self bounds];
		[self setBounds:NSMakeRect(old.origin.x + 10, old.origin.y, old.size.width, old.size.height)];
	}
	if ([[self logger] showKA]) {
		[[self logger] log:[NSString stringWithFormat:@"[VPItemView moveRight]\n"]];
	}
}

- (void)zoomInSize {
	if ([self isFrame]) {
		NSRect old = [self frame];
		[self setFrame:NSMakeRect(old.origin.x, old.origin.y, old.size.width + 30, old.size.height + 10)];
	} else {
		NSRect old = [self bounds];
		[self setBounds:NSMakeRect(old.origin.x, old.origin.y, old.size.width + 30, old.size.height + 10)];
	}
}

- (void)zoomOutSize {
	if ([self isFrame]) {
		NSRect old = [self frame];
		[self setFrame:NSMakeRect(old.origin.x, old.origin.y, old.size.width - 30, old.size.height - 10)];
	} else {
		NSRect old = [self bounds];
		[self setBounds:NSMakeRect(old.origin.x, old.origin.y, old.size.width - 30, old.size.height - 10)];
	}
}

@end

