//
//  InfoPaneView.h
//  View_Programming
//
//  Created by yalinli on 2021/9/15.
//

#import <Cocoa/Cocoa.h>
#import "VPLog.h"

@interface testView : NSView

@property VPLog *logger;

- (id)initWithFrame:(NSRect)aFrame andName:(NSString *)name andLogger:(VPLog *)logger;

@end

@interface InfoPaneView : NSView

@property VPLog *logger;

@end

