//
//  SetViewController.h
//  GliderPlane
//
//  Created by Leon on 5/19/11.
//  Copyright 2011 Dark Steed Games. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <iAd/iAd.h>
#import <GameKit/GameKit.h>

@interface SetViewController : UIViewController<UIAccelerometerDelegate> {
    IBOutlet UIButton *back2;
    IBOutlet UIButton *upSen;
    IBOutlet UIButton *downSen;
    
    IBOutlet UIImageView *glider;
    IBOutlet UILabel *lblSen;
    
    NSInteger sensitivity1; 
    CGPoint gliderVelocity;
    CAKeyframeAnimation *buttonAction;
    
}

@property(nonatomic, retain) IBOutlet UIButton *back2;
@property(nonatomic, retain) IBOutlet UIButton *upSen;
@property(nonatomic, retain) IBOutlet UIButton *downSen;
@property(nonatomic, retain) IBOutlet UIImageView *glider;
@property(nonatomic, retain) IBOutlet UILabel *lblSen;

@property(nonatomic) NSInteger sensitivity1;

-(IBAction) back1;
-(IBAction) up;
-(IBAction) down;

@end
