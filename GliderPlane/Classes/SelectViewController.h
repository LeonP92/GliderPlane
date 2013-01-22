//
//  SelectViewController.h
//  GliderPlane
//
//  Created by Leon Pham on 2/14/11.
//  Copyright 2011 Dark Steed Games. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <iAd/iAd.h>
#import <GameKit/GameKit.h>

@interface SelectViewController : UIViewController {
    
	IBOutlet UIButton *classic1;
    IBOutlet UIButton *endless1;
    IBOutlet UIButton *life1;
	IBOutlet UIButton *back1;
	
	CAKeyframeAnimation *buttonAction;
	
}
@property(nonatomic, retain) IBOutlet UIButton *classic1;
@property(nonatomic, retain) IBOutlet UIButton *endless1;
@property(nonatomic, retain) IBOutlet UIButton *life1;
@property(nonatomic, retain) IBOutlet UIButton *back1;

-(IBAction) classic;
-(IBAction) endless;
-(IBAction) life;
-(IBAction) back;

@end