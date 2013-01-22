//
//  GliderPlaneAppDelegate.h
//  GliderPlane
//
//  Created by Leon Pham on 2/14/11.
//  Copyright 2011 Dark Steed Games. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GameKit/GameKit.h>
@class GliderPlaneViewController;

@interface GliderPlaneAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    GliderPlaneViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet GliderPlaneViewController *viewController;

@end

