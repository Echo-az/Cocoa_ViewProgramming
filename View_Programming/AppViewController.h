//
//  AppViewController.h
//  View_Programming
//
//  Created by yalinli on 2021/8/26.
//

#import <Cocoa/Cocoa.h>
#import "VPContentView.h"
#import "VPLog.h"
#import "DrawArea/DrawAreaViewController.h"
#import "InfoPane/InfoPaneViewController.h"

@interface AppViewController : NSViewController

@property (strong) DrawAreaViewController *drawAreaViewController;
@property (strong) InfoPaneViewController *infoPaneViewController;
@property (strong) VPLog *logger;

- (id)initWithLogger:(VPLog *)logger;

@end

