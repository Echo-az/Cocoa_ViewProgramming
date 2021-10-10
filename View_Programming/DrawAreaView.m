//
//  DrawAreaView.m
//  View_Programming
//
//  Created by yalinli on 2021/9/17.
//

#import "DrawAreaView.h"

@implementation DrawAreaView

- (BOOL)acceptsFirstResponder {
	BOOL result = [super acceptsFirstResponder];
	if ([[self logger] showFR]){
		[[self logger] log:[NSString stringWithFormat:@"[DrawAreaView acceptFirstResponder] : %hhd\n", result]];
	}
	return result;
}

- (BOOL)becomeFirstResponder {
	BOOL result = [super becomeFirstResponder];
	if ([[self logger] showFR]){
		[[self logger] log:[NSString stringWithFormat:@"[DrawAreaView becomeFirstResponder] : %hhd\n", result]];
	}
	return result;
}

- (BOOL)resignFirstResponder {
	BOOL result = [super resignFirstResponder];
	if ([[self logger] showFR]){
		[[self logger] log:[NSString stringWithFormat:@"[DrawAreaView resignFirstResponder] : %hhd\n", result]];
	}
	return result;
}

- (void)mouseDown:(NSEvent *)event {
	if ([[self logger] showMouse]) {
	[[self logger] log:[NSString stringWithFormat:@"[DrawAreaView mouseDown]\n"]];
	}
	[super mouseDown:event];
}

- (BOOL)performKeyEquivalent:(NSEvent *)event {
	if ([[self logger] showKE]) {
	[[self logger] log:[NSString stringWithFormat:@"Begin [DrawAreaView performKeyEquivalent]\n"]];
	}
	BOOL result = [super performKeyEquivalent:event];
	if ([[self logger] showKE]) {
		[[self logger] log:[NSString stringWithFormat:@"[DrawAreaView performKeyEquivalent] : %hhd\n", result]];
	}
	return result;
}

- (BOOL)canBecomeKeyView {
	BOOL result = [super canBecomeKeyView];
	if ([[self logger] showKIC]) {
	[[self logger] log:[NSString stringWithFormat:@"[DrawAreaView canBecomeKeyView] : %hhd\n", result]];
	}
	return result;
}

- (void)keyDown:(NSEvent *)event {
	if ([[self logger] showKA]) {
		[[self logger] log:[NSString stringWithFormat:@"[DrawAreaView keyDown]\n"]];
	}
	[super keyDown:event];
}
@end
