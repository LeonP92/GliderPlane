//
//  GliderPlaneViewController.h
//  GliderPlane
//
//  Created by Leon Pham on 2/14/11.
//  Copyright 2011 Dark Steed Games. All rights reserved.
//
#import <GameKit/GameKit.h>
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <iAd/iAd.h>
#import <GameKit/GameKit.h>

@interface GliderPlaneViewController : UIViewController {
	IBOutlet UIButton *play1;
	IBOutlet UIButton *highScore1;
	IBOutlet UIButton *help1;
	IBOutlet UIButton *about1;
    IBOutlet UIButton *shop1;
    
	CAKeyframeAnimation* buttonAction;
	
}
@property(nonatomic, retain) IBOutlet UIButton *play1;
@property(nonatomic, retain) IBOutlet UIButton *highScore1;
@property(nonatomic, retain) IBOutlet UIButton *help1;
@property(nonatomic, retain) IBOutlet UIButton *about1;
@property(nonatomic, retain) IBOutlet UIButton *shop1;

-(IBAction) play;
-(IBAction) highScore;
-(IBAction) help;
-(IBAction) about;
-(IBAction) shop;


@end

