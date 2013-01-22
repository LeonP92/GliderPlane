//
//  LifeViewController.h
//  GliderPlane
//
//  Created by Leon Pham on 2/14/11.
//  Copyright 2011 Dark Steed Games. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <iAd/iAd.h>
#import <GameKit/GameKit.h>

@interface LifeViewController : UIViewController <UIAccelerometerDelegate, ADBannerViewDelegate> {
    //buttons
	IBOutlet UIButton *quit1;
	//objects & images
	IBOutlet UIImageView *cloud1;
	IBOutlet UIImageView *cloud2;
	IBOutlet UIImageView *cloud3;
	IBOutlet UIImageView *cloud4;
	IBOutlet UIImageView *cloud5;
	IBOutlet UIImageView *glider;
	
    ADBannerView *adView;
    BOOL bannerIsVisible;
	
	//Score label
	IBOutlet UILabel *lblscore; 
	IBOutlet UILabel *lblhigh;
	
	//scores
	int score;
	int previousScore;
	NSInteger highScore;
    NSInteger selectedGlider;
    NSInteger sensitivity1;
    //Lives
    int life;
    int previousLife;
    IBOutlet UILabel *lbllife;
    
	CGPoint gliderVelocity;
	CAKeyframeAnimation *buttonAction;
	float valueY;
	
	//Pos Points for goals
	CGPoint pos;
	CGPoint pos2;
	CGPoint pos3;
	CGPoint pos4;
	CGPoint pos5;
	
}
@property(nonatomic, retain) IBOutlet UIButton *quit1;
@property(nonatomic, retain) IBOutlet UIImageView *cloud1;
@property(nonatomic, retain) IBOutlet UIImageView *cloud2;
@property(nonatomic, retain) IBOutlet UIImageView *cloud3;
@property(nonatomic, retain) IBOutlet UIImageView *cloud4;
@property(nonatomic, retain) IBOutlet UIImageView *cloud5;
@property(nonatomic, retain) IBOutlet UIImageView *glider;
@property(nonatomic, retain) IBOutlet UILabel *lblscore;
@property(nonatomic, retain) IBOutlet UILabel *lblhigh;
@property(nonatomic, retain) IBOutlet UILabel *lbllife;

@property(nonatomic, assign) BOOL bannerIsVisible;

@property(nonatomic) NSInteger highScore;
@property(nonatomic) NSInteger selectedGlider;
@property(nonatomic) NSInteger sensitivity1;
-(IBAction) quit;

@end
