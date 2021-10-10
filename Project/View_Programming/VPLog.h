//
//  VPLog.h
//  View_Programming
//
//  Created by yalinli on 2021/9/17.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

@interface VPLog : NSObject

@property BOOL showFR;
@property BOOL showMouse;
@property BOOL showKE;
@property BOOL showKIC;
@property BOOL showKA;

@property NSScrollView *logView;

- (void)log:(NSString *)info;
- (void)clear;

@end

