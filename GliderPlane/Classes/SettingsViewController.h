//
//  SettingsViewController.h
//  GliderPlane
//
//  Created by Leon Pham on 2/14/11.
//  Copyright 2011 PhamDwyer Development. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface SettingsViewController : UIViewController {
	IBOutlet UIButton *back11;
	IBOutlet UIButton *back22;
	
	CAKeyframeAnimation *buttonAction;
}
@property(nonatomic, retain) IBOutlet UIButton *back11;
@property(nonatomic, retain) IBOutlet UIButton *back22;

-(IBAction) back1;
-(IBAction) back2;

@end
