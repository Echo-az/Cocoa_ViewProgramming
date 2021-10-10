//
//  VPItemView.h
//  View_Programming
//
//  Created by yalinli on 2021/9/15.
//

#import <Cocoa/Cocoa.h>
#import "VPImageView.h"
#import "VPLog.h"

@protocol VPItemViewInfoUpdater

- (void)updateFrameInfo:(NSRect)newFrame;
- (void)updateBoundsInfo:(NSRect)newBounds;

@end

@interface VPItemView : NSView

@property (nonatomic, weak) id <VPItemViewInfoUpdater> delegate;

@property VPLog *logger;

@property BOOL isFrame;

- (id)initWithLogger:(VPLog *)logger;

- (void)resetAll;

- (void)zoomInSize;
- (void)zoomOutSize;

@end
