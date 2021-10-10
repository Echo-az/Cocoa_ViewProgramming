//
//  VPImageView.m
//  View_Programming
//
//  Created by yalinli on 2021/9/17.
//

#import "VPImageView.h"

@implementation VPImageView

- (BOOL)acceptsFirstResponder {
	BOOL result = [super acceptsFirstResponder];
	if ([[self logger] showFR]){
		[[self logger] log:[NSString stringWithFormat:@"[VPImageView acceptFirstResponder] : %hhd\n", result]];
	}
	return result;
}

- (BOOL)becomeFirstResponder {
	BOOL result = [super becomeFirstResponder];
	if ([[self logger] showFR]){
		[[self logger] log:[NSString stringWithFormat:@"[VPImageView becomeFirstResponder] : %hhd\n", result]];
	}
	return result;
}

- (BOOL)resignFirstResponder {
	BOOL result = [super resignFirstResponder];
	if ([[self logger] showFR]){
		[[self logger] log:[NSString stringWithFormat:@"[VPImageView resignFirstResponder] : %hhd\n", result]];
	}
	return result;
}

- (void)mouseDown:(NSEvent *)event {
	if ([[self logger] showMouse]) {
		[[self logger] log:[NSString stringWithFormat:@"[VPImageView mouseDown]\n"]];
	}
	[super mouseDown:event];
}

- (BOOL)performKeyEquivalent:(NSEvent *)event {
	if ([[self logger] showKE]) {
		[[self logger] log:[NSString stringWithFormat:@"Begin [VPImageView performKeyEquivalent]\n"]];
	}
	BOOL result = [super performKeyEquivalent:event];
	if ([[self logger] showKE]) {
		[[self logger] log:[NSString stringWithFormat:@"[VPImageView performKeyEquivalent] : %hhd\n", result]];
	}
	return result;
}

- (BOOL)canBecomeKeyView {
	BOOL result = [super canBecomeKeyView];
	if ([[self logger] showKIC]) {
		[[self logger] log:[NSString stringWithFormat:@"[VPImageView canBecomeKeyView] : %hhd\n", result]];
	}
	return result;
}

- (void)keyDown:(NSEvent *)event {
	if ([[self logger] showKA]) {
		[[self logger] log:[NSString stringWithFormat:@"[VPImageView keyDown]\n"]];
	}
	[super keyDown:event];
}

@end
