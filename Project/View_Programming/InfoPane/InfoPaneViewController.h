//
//  InfoPaneViewController.h
//  View_Programming
//
//  Created by yalinli on 2021/9/10.
//

#import <Cocoa/Cocoa.h>
#import "VPItemView.h"
#import "InfoPaneView.h"
#import "VPLog.h"

@interface InfoPaneViewController : NSViewController <VPItemViewInfoUpdater>

@property VPItemView *itemView;
@property VPLog *logger;

- (id)initWithItemView:(VPItemView *)aItemView andLogger:(VPLog *)logger;

@end
