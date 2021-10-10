//
//  VPWindow.m
//  View_Programming
//
//  Created by yalinli on 2021/9/15.
//

#import "VPWindow.h"

@implementation VPWindow

//- (BOOL)makeFirstResponder:(NSResponder *)responder {
//	if ([[self logger] showFR]){
//		[[self logger] log:[NSString stringWithFormat:@"[VPWindow makeFirstResponder: %@]\n",responder.class]];
//	}
//	return [super makeFirstResponder:responder];
//}


- (id)init {
	self = [super initWithContentRect:NSMakeRect(300, 200, 800, 600)
							styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable
							  backing:NSBackingStoreBuffered
								defer:false];
	[self setTitle:@"This is a window"];
	return self;
}

- (void)mouseDown:(NSEvent *)event{
	if ([[self logger] showMouse]) {
		[[self logger] log:[NSString stringWithFormat:@"[VPWindow mouseDown]\n"]];
	}
	[super mouseDown:event];
}

- (BOOL)performKeyEquivalent:(NSEvent *)event {
	BOOL result = [super performKeyEquivalent:event];
	if ([[self logger] showKE]) {
		[[self logger] log:[NSString stringWithFormat:@"[VPWindow performKeyEquivalent] : %hhd\n", result]];
	}
	return result;
}

- (void)selectNextKeyView:(id)sender {
	if ([[self logger] showKIC]) {
		[[self logger] log:[NSString stringWithFormat:@"[VPWindow selectNextKeyView]\n"]];
	}
	[super selectNextKeyView:sender];
}
- (void)selectPreviousKeyView:(id)sender {
	if ([[self logger] showKIC]) {
		[[self logger] log:[NSString stringWithFormat:@"[VPWindow selectPreviousKeyView]\n"]];
	}
	[super selectPreviousKeyView:sender];
}

- (void)keyDown:(NSEvent *)event {
	if ([[self logger] showKA]) {
		[[self logger] log:[NSString stringWithFormat:@"[VPWindow keyDown]\n"]];
	}
	[super keyDown:event];
}

- (void)doCommandBySelector:(SEL)selector {
	if ([[self logger] showKA]) {
		[[self logger] log:[NSString stringWithFormat:@"[VPWindow doCommandBySelector] %s\n", sel_getName(selector)]];
	}
	[super doCommandBySelector:selector];
}

@end
