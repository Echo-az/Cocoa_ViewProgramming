//
//  AppDelegate.m
//  View_Programming
//
//  Created by yalinli on 2021/8/26.
//

#import "AppDelegate.h"
#import "AppViewController.h"
#import "VPLog.h"

@interface AppDelegate ()
@property (strong) VPWindow *window;

@property VPLog *logger;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	_logger = [[VPLog alloc] init];
	_window = [[VPWindow alloc] init];
	[_window setLogger:[self logger]];
	[_window setDelegate:self];
	//[_window setContentViewController:[[AppViewController alloc] initWithLogger:[self logger]]];
	[_window makeKeyAndOrderFront:nil];
}

- (BOOL)windowShouldClose:(NSWindow *)sender {
	[sender orderOut:self];
	[[self logger] clear];
	[sender setContentViewController:[[AppViewController alloc] initWithLogger:[self logger]]];
	return false;
}

- (BOOL)applicationShouldHandleReopen:(NSApplication *)sender hasVisibleWindows:(BOOL)flag {
	if(!flag) {
		[_window makeKeyAndOrderFront:self];
		return YES;
	}
	return NO;
}

@end
