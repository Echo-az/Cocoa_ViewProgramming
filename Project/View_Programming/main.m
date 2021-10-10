//
//  main.m
//  View_Programming
//
//  Created by yalinli on 2021/8/26.
//

#import <Cocoa/Cocoa.h>
#import "AppDelegate.h"

int main(int argc, const char * argv[]) {	
	AppDelegate *delegate = [[AppDelegate alloc] init];
	[[NSApplication sharedApplication] setDelegate:delegate];
	return NSApplicationMain(argc, argv);
}
