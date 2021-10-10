//
//  VPContentView.m
//  View_Programming
//
//  Created by yalinli on 2021/9/17.
//

#import "VPContentView.h"

@implementation VPContentView

- (BOOL)acceptsFirstResponder {
	BOOL result = [super acceptsFirstResponder];
	if ([[self logger] showFR]){
		[[self logger] log:[NSString stringWithFormat:@"[ContentView acceptFirstResponder] : %hhd\n", result]];
	}
	return result;
}

- (BOOL)becomeFirstResponder {
	BOOL result = [super becomeFirstResponder];
	if ([[self logger] showFR]){
		[[self logger] log:[NSString stringWithFormat:@"[ContentView becomeFirstResponder] : %hhd\n", result]];
	}
	return result;
}

- (BOOL)resignFirstResponder {
	BOOL result = [super resignFirstResponder];
	if ([[self logger] showFR]){
		[[self logger] log:[NSString stringWithFormat:@"[ContentView resignFirstResponder] : %hhd\n", result]];
	}
	return result;
}

//- (NSView *)hitTest:(NSPoint)point {
//	NSView *result = [super hitTest:point];
//	[[self logger] log:[NSString stringWithFormat:@"[ContentView hitTest] : %@\n", result.class]];
//	return result;
//}

- (void)mouseDown:(NSEvent *)event{
	if ([[self logger] showMouse]) {
		[[self logger] log:[NSString stringWithFormat:@"[ContentView mouseDown]\n"]];
	}
	[super mouseDown:event];
}

- (BOOL)performKeyEquivalent:(NSEvent *)event {
	if ([[self logger] showKE]) {
	[[self logger] log:[NSString stringWithFormat:@"Begin [ContentView performKeyEquivalent]\n"]];
	}
	BOOL result = [super performKeyEquivalent:event];
	if ([[self logger] showKE]) {
		[[self logger] log:[NSString stringWithFormat:@"[ContentView performKeyEquivalent] : %hhd\n", result]];
	}
	return result;
}

- (BOOL)canBecomeKeyView {
	BOOL result = [super canBecomeKeyView];
	if ([[self logger] showKIC]) {
	[[self logger] log:[NSString stringWithFormat:@"[ContentView canBecomeKeyView] : %hhd\n", result]];
	}
	return result;
}

- (void)keyDown:(NSEvent *)event {
	if ([[self logger] showKA]) {
		[[self logger] log:[NSString stringWithFormat:@"[ContentView keyDown]\n"]];
	}
	[super keyDown:event];
}

- (void)doCommandBySelector:(SEL)selector {
	if ([[self logger] showKA]) {
		[[self logger] log:[NSString stringWithFormat:@"[ContentView doCommandBySelector] %s\n", sel_getName(selector)]];
	}
	[super doCommandBySelector:selector];
}

@end
