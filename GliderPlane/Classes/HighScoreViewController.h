//
//  HighScoreViewController.h
//  GliderPlane
//
//  Created by user on 3/16/11.
//  Copyright 2011 Dark Steed Games. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <iAd/iAd.h>
#import <GameKit/GameKit.h>

@interface HighScoreViewController : UIViewController< GKLeaderboardViewControllerDelegate> {
    IBOutlet UIButton *backToMenu;
    IBOutlet UIButton *classic;
    IBOutlet UIButton *endless;
    IBOutlet UIButton *life;
    
    //labels
    IBOutlet UILabel *lblclassic;
    IBOutlet UILabel *lblendless;
    IBOutlet UILabel *lbllife;
    
    CAKeyframeAnimation *buttonAction;
}

@property(retain, nonatomic) IBOutlet UIButton *backToMenu;
@property(retain, nonatomic) IBOutlet UIButton *classic;
@property(retain, nonatomic) IBOutlet UIButton *endless;
@property(retain, nonatomic) IBOutlet UIButton *life;
@property(retain, nonatomic) IBOutlet UILabel *lblclassic;
@property(retain, nonatomic) IBOutlet UILabel *lblendless;
@property(retain, nonatomic) IBOutlet UILabel *lbllife;


-(IBAction) backToMenu1;
-(IBAction) classic1;
-(IBAction) endless1;
-(IBAction) life1;
@end
