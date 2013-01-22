//
//  HelpViewController.h
//  GliderPlane
//
//  Created by Leon Pham on 2/15/11.
//  Copyright 2011 Dark Steed Games. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <GameKit/GameKit.h>

@interface HelpViewController : UIViewController {
	IBOutlet UIButton *back11;
	
	CAKeyframeAnimation *buttonAction;
}
@property(nonatomic, retain) IBOutlet UIButton *back11;
-(IBAction) back1;
@end
