//
//  InfoPaneView.m
//  View_Programming
//
//  Created by yalinli on 2021/9/15.
//

#import "InfoPaneView.h"

@implementation testView{
	BOOL changed;
	NSString *name;
}

- (id)initWithFrame:(NSRect) aFrame andName:(NSString *)aName andLogger:(VPLog *)logger{
	self = [super initWithFrame:aFrame];
	if (self) {
		_logger = logger;
		name = aName;
		changed = NO;
		[self setWantsLayer:YES];
		[[self layer] setBackgroundColor:[[NSColor blackColor] CGColor]];
	}
	return self;
}

- (void)changeColor {
	changed = changed ? NO : YES;
	if (changed) {
		[[self layer] setBackgroundColor:[[NSColor whiteColor] CGColor]];
	} else {
		[[self layer] setBackgroundColor:[[NSColor blackColor] CGColor]];
	}
}

- (BOOL)acceptsFirstResponder {
	BOOL result = YES;
	if ([[self logger] showFR]){
		[[self logger] log:[NSString stringWithFormat:@"[testView%@ acceptFirstResponder] : %hhd\n", name, result]];
	}
	return result;
}

- (BOOL)becomeFirstResponder {
	BOOL result = [super becomeFirstResponder];
	if ([[self logger] showFR]){
		[[self logger] log:[NSString stringWithFormat:@"[testView%@ becomeFirstResponder] : %hhd\n", name, result]];
	}
	return result;
}

- (BOOL)resignFirstResponder {
	BOOL result = [super resignFirstResponder];
	if ([[self logger] showFR]){
		[[self logger] log:[NSString stringWithFormat:@"[testView%@ resignFirstResponder] : %hhd\n", name, result]];
	}
	return result;
}

- (void)mouseDown:(NSEvent *)event {
	[self changeColor];
	if ([[self logger] showMouse]) {
		[[self logger] log:[NSString stringWithFormat:@"[testView%@ mouseDown]\n", name]];
	}
	[super mouseDown:event];
}

- (BOOL)performKeyEquivalent:(NSEvent *)event {
	if ([[self logger] showKE]) {
		[[self logger] log:[NSString stringWithFormat:@"Begin [testView%@ performKeyEquivalent]]\n", name]];
	}
	BOOL result = [super performKeyEquivalent:event];
	if ([[self logger] showKE]) {
		[[self logger] log:[NSString stringWithFormat:@"[testView%@ performKeyEquivalent] : %hhd\n", name, result]];
	}
	return result;
}

- (BOOL)canBecomeKeyView {
	BOOL result = [super canBecomeKeyView];
	if ([[self logger] showKIC]) {
		[[self logger] log:[NSString stringWithFormat:@"[testView%@ canBecomeKeyView] : %hhd\n", name, result]];
	}
	return result;
}

- (void)keyDown:(NSEvent *)event {
	if ([[self logger] showKA]) {
		[[self logger] log:[NSString stringWithFormat:@"[testView%@ keyDown]\n", name]];
	}
	[self interpretKeyEvents:[NSArray arrayWithObject:event]];
//	[super keyDown:event];
}

//- (void)moveUp:(id)sender{
//	[self changeColor];
//}

- (void)doCommandBySelector:(SEL)selector {
	if ([[self logger] showKA]) {
		[[self logger] log:[NSString stringWithFormat:@"[testView%@ doCommandBySelector] %s\n", name, sel_getName(selector)]];
	}
	[super doCommandBySelector:selector];
}

@end

@implementation InfoPaneView

- (BOOL)isFlipped {
	return YES;
}

- (BOOL)acceptsFirstResponder {
	BOOL result = YES;
	if ([[self logger] showFR]){
		[[self logger] log:[NSString stringWithFormat:@"[InfoPaneView acceptFirstResponder] : %hhd\n", result]];
	}
	return result;
}

- (BOOL)becomeFirstResponder {
	BOOL result = [super becomeFirstResponder];
	if ([[self logger] showFR]){
		[[self logger] log:[NSString stringWithFormat:@"[InfoPaneView becomeFirstResponder] : %hhd\n", result]];
	}
	return result;
}

- (BOOL)resignFirstResponder {
	BOOL result = [super resignFirstResponder];
	if ([[self logger] showFR]){
		[[self logger] log:[NSString stringWithFormat:@"[InfoPaneView resignFirstResponder] : %hhd\n", result]];
	}
	return result;
}

- (void)mouseDown:(NSEvent *)event{
	if ([[self logger] showMouse]) {
		[[self logger] log:[NSString stringWithFormat:@"[InfoPaneView mouseDown]\n"]];
	}
	[super mouseDown:event];
}

- (BOOL)performKeyEquivalent:(NSEvent *)event {
	if ([[self logger] showKE]) {
		[[self logger] log:[NSString stringWithFormat:@"Begin [InfoPaneView performKeyEquivalent]\n"]];
	}
	BOOL result = [super performKeyEquivalent:event];
	if ([[self logger] showKE]) {
		[[self logger] log:[NSString stringWithFormat:@"[InfoPaneView performKeyEquivalent] : %hhd\n", result]];
	}
	return result;
}

- (BOOL)canBecomeKeyView {
	BOOL result = [super canBecomeKeyView];
	if ([[self logger] showKIC]) {
		[[self logger] log:[NSString stringWithFormat:@"[InfoPaneView canBecomeKeyView] : %hhd\n", result]];
	}
	return result;
}

- (void)keyDown:(NSEvent *)event {
	if ([[self logger] showKA]) {
		[[self logger] log:[NSString stringWithFormat:@"[InfoPaneView keyDown]\n"]];
	}
	[super keyDown:event];
}

- (void)doCommandBySelector:(SEL)selector {
	if ([[self logger] showKA]) {
		[[self logger] log:[NSString stringWithFormat:@"[InfoPaneView doCommandBySelector] %s\n", sel_getName(selector)]];
	}
	[super doCommandBySelector:selector];
}

//- (void)moveUp:(id)sender {
//	if ([[self logger] showKA]) {
//		[[self logger] log:[NSString stringWithFormat:@"[InfoPaneView moveUp]\n"]];
//	}
//	[super moveUp:sender];
//}

@end
