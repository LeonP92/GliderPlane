//
//  ShopViewController.h
//  GliderPlane
//
//  Created by Leon on 4/14/11.
//  Copyright 2011 Dark Steed Games. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <iAd/iAd.h>
#import <GameKit/GameKit.h>


@interface ShopViewController : UIViewController{
    IBOutlet UIButton *original;
    IBOutlet UIButton *glider1;
    IBOutlet UIButton *glider2;
    IBOutlet UIButton *glider3;
    IBOutlet UIButton *glider4;
    IBOutlet UIButton *glider5;
    IBOutlet UIButton *glider6;
    IBOutlet UIButton *glider7;
    IBOutlet UIButton *glider8;
    IBOutlet UIButton *back;
    
    NSInteger GliderC;
    NSInteger GliderC1;
    NSInteger GliderC2;
    NSInteger Selected;
    NSInteger Endless;
    NSInteger Life;
    NSInteger Play;
    
    CAKeyframeAnimation *buttonAction;
}

@property(nonatomic, retain) IBOutlet UIButton *original;
@property(nonatomic, retain) IBOutlet UIButton *glider1;
@property(nonatomic, retain) IBOutlet UIButton *glider2;
@property(nonatomic, retain) IBOutlet UIButton *glider3;
@property(nonatomic, retain) IBOutlet UIButton *glider4;
@property(nonatomic, retain) IBOutlet UIButton *glider5;
@property(nonatomic, retain) IBOutlet UIButton *glider6;
@property(nonatomic, retain) IBOutlet UIButton *glider7;
@property(nonatomic, retain) IBOutlet UIButton *glider8;
@property(nonatomic, retain) IBOutlet UIButton *back;
@property(nonatomic) NSInteger GliderC;
@property(nonatomic) NSInteger GliderC1;
@property(nonatomic) NSInteger GliderC2;
@property(nonatomic) NSInteger Selected; 
@property(nonatomic) NSInteger Endless;
@property(nonatomic) NSInteger Life;
@property(nonatomic) NSInteger Play;

-(IBAction) pick;
-(IBAction) pick1;
-(IBAction) pick2; 
-(IBAction) pick3;
-(IBAction) pick4;
-(IBAction) pick5;
-(IBAction) pick6;
-(IBAction) pick7;
-(IBAction) pick8;
-(IBAction) back1;
@end
