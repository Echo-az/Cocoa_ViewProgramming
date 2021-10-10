//
//  DrawAreaViewController.h
//  View_Programming
//
//  Created by yalinli on 2021/9/10.
//

#import <Cocoa/Cocoa.h>
#import "DrawAreaView.h"
#import "VPItemView.h"
#import "VPLog.h"

@interface DrawAreaViewController : NSViewController

@property VPItemView *itemView;
@property VPLog *logger;

- (id)initWithLogger:(VPLog *)logger;

@end
