//
//  VPContentView.h
//  View_Programming
//
//  Created by yalinli on 2021/9/17.
//

#import <Cocoa/Cocoa.h>
#import "VPLog.h"

@interface VPContentView : NSView

@property VPLog *logger;

-(instancetype)initWithFrame:(NSRect)frameRect;

- (void)setFrame:(NSRect)frame;
- (void)setFrameOrigin:(NSPoint)newOrigin;
- (void)setFrameSize:(NSSize)newSize;

-(void)setBounds:(NSRect)bounds;
-(void)setBoundsOrigin:(NSPoint)newOrigin;
-(void)setBoundsSize:(NSSize)newSize;

@end
