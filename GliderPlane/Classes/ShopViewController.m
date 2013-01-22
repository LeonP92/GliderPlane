//
//  ShopViewController.m
//  GliderPlane
//
//  Created by Leon on 4/14/11.
//  Copyright 2011 Dark Steed Games. All rights reserved.
//

#import "ShopViewController.h"
#import "HelpViewController.h"
#import "SelectViewController.h"
#import "GliderPlaneViewController.h"
#import "PlayViewContoller.h"
#import "HighScoreViewController.h"
#import "EndlessViewController.h"
#import "LifeViewController.h"


@implementation ShopViewController
@synthesize original, glider1, glider2, glider3, glider4, GliderC, GliderC1, GliderC2, Selected, Endless, Life, Play, back, glider5, glider6, glider7, glider8;

-(IBAction) pick{
    UIAlertView *info = [[UIAlertView alloc]
                         initWithTitle:@"Success!" message:@"Original Glider selected!"
                         delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
	[info show];
	[info release];
    
    Selected = 0;
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setInteger:Selected forKey:@"selected"];
}
-(IBAction) pick1{
    if (GliderC < 1) {
        UIAlertView *no = [[UIAlertView alloc] 
                           initWithTitle:@"Not Avaialable!" message:@"Get 10 points in Classic Mode!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [no show];
        [no release];
    }
    if (GliderC >= 1) {
        UIAlertView *yes = [[UIAlertView alloc]
                            initWithTitle:@"Success!" message:@"Glider Selected!" delegate:nil cancelButtonTitle:@"Ok"
                            otherButtonTitles:nil];
        [yes show];
        [yes release];
        Selected = 1;
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        [prefs setInteger: Selected forKey:@"selected"];
    }
}
-(IBAction) pick2{
    if (GliderC < 2) {
        UIAlertView *no = [[UIAlertView alloc] 
                           initWithTitle:@"Not Avaialable!" message:@"Get 20 points in Classic Mode!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [no show];
        [no release];
    }
    if (GliderC >= 2) {
        UIAlertView *yes = [[UIAlertView alloc]
                            initWithTitle:@"Success!" message:@"Glider Selected!" delegate:nil cancelButtonTitle:@"Ok"
                            otherButtonTitles:nil];
        [yes show];
        [yes release];
        Selected = 2;
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        [prefs setInteger: Selected forKey:@"selected"];
    } 
}
-(IBAction) pick3{
    if (GliderC1 < 1) {
        UIAlertView *no = [[UIAlertView alloc] 
                           initWithTitle:@"Not Avaialable!" message:@"Get 10000 points in Endless Mode!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [no show];
        [no release];
    }
    if (GliderC1 >= 1) {
        UIAlertView *yes = [[UIAlertView alloc]
                            initWithTitle:@"Success!" message:@"Glider Selected!" delegate:nil cancelButtonTitle:@"Ok"
                            otherButtonTitles:nil];
        [yes show];
        [yes release];
        Selected = 3;
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        [prefs setInteger: Selected forKey:@"selected"];
    }}
-(IBAction) pick4{
    if (GliderC2 < 1) {
        UIAlertView *no = [[UIAlertView alloc] 
                           initWithTitle:@"Not Avaialable!" message:@"Get 20 points in Life Mode!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [no show];
        [no release];
    }
    if (GliderC2 >= 1) {
        UIAlertView *yes = [[UIAlertView alloc]
                            initWithTitle:@"Success!" message:@"Glider Selected!" delegate:nil cancelButtonTitle:@"Ok"
                            otherButtonTitles:nil];
        [yes show];
        [yes release];
        Selected = 4;
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        [prefs setInteger: Selected forKey:@"selected"];
    }
}
-(IBAction) pick5{
    if (GliderC < 3) {
        UIAlertView *no = [[UIAlertView alloc] 
                           initWithTitle:@"Not Avaialable!" message:@"Get 25 points in Play Mode!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [no show];
        [no release];
    }
    if (GliderC >= 3) {
        UIAlertView *yes = [[UIAlertView alloc]
                            initWithTitle:@"Success!" message:@"Glider Selected!" delegate:nil cancelButtonTitle:@"Ok"
                            otherButtonTitles:nil];
        [yes show];
        [yes release];
        Selected = 5;
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        [prefs setInteger: Selected forKey:@"selected"];
    }
}
-(IBAction) pick6{
    if (GliderC1 < 2) {
        UIAlertView *no = [[UIAlertView alloc] 
                           initWithTitle:@"Not Avaialable!" message:@"Get 15000 points in Endless Mode!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [no show];
        [no release];
    }
    if (GliderC1 >= 2) {
        UIAlertView *yes = [[UIAlertView alloc]
                            initWithTitle:@"Success!" message:@"Glider Selected!" delegate:nil cancelButtonTitle:@"Ok"
                            otherButtonTitles:nil];
        [yes show];
        [yes release];
        Selected = 6;
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        [prefs setInteger: Selected forKey:@"selected"];
    }
}
-(IBAction) pick7{
    if (GliderC2 < 2) {
        UIAlertView *no = [[UIAlertView alloc] 
                           initWithTitle:@"Not Avaialable!" message:@"Get 25 points in Life Mode!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [no show];
        [no release];
    }
    if (GliderC2 >= 2) {
        UIAlertView *yes = [[UIAlertView alloc]
                            initWithTitle:@"Success!" message:@"Glider Selected!" delegate:nil cancelButtonTitle:@"Ok"
                            otherButtonTitles:nil];
        [yes show];
        [yes release];
        Selected = 7;
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        [prefs setInteger: Selected forKey:@"selected"];
    }
}
-(IBAction) pick8{
    if (GliderC1 < 3) {
        UIAlertView *no = [[UIAlertView alloc] 
                           initWithTitle:@"Not Avaialable!" message:@"Get 20000 points in Endless Mode!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [no show];
        [no release];
    }
    if (GliderC1 >= 3) {
        UIAlertView *yes = [[UIAlertView alloc]
                            initWithTitle:@"Success!" message:@"Glider Selected!" delegate:nil cancelButtonTitle:@"Ok"
                            otherButtonTitles:nil];
        [yes show];
        [yes release];
        Selected = 8;
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        [prefs setInteger: Selected forKey:@"selected"];
    }

}
-(void) scoreCheck{
    if (Play >= 10) {
        GliderC = 1;
        
        UIImage *btnImage = [UIImage imageNamed:@"jet.png"];
        [glider1 setImage:btnImage forState:UIControlStateNormal];
        
    }
    if (Play >= 20) {
        GliderC = 2;
    
        UIImage *btnImage1 = [UIImage imageNamed:@"Kite.png"];
        [glider2 setImage:btnImage1 forState:UIControlStateNormal];
    }
    if(Play >= 25){
        GliderC = 3;
        
        UIImage *btnImage5 = [UIImage imageNamed: @"blimp.png"];
        [glider5 setImage:btnImage5 forState:UIControlStateNormal];
    }
    if (Endless >= 10000) {
        GliderC1 = 1;
        
        UIImage *btnImage3 = [UIImage imageNamed:@"Crane.png"];
        [glider3 setImage:btnImage3 forState:UIControlStateNormal];
    }
    if(Endless >= 15000){
        GliderC1 = 2;
        
        UIImage *btnImage6 = [UIImage imageNamed:@"saucer.png"];
        [glider6 setImage:btnImage6 forState:UIControlStateNormal];
    }
    if(Endless >= 20000){
        GliderC1 =3;
        
        UIImage *btnImage8 = [UIImage imageNamed:@"dragonfly copy.png"];
        [glider8 setImage:btnImage8 forState:UIControlStateNormal];
        
    }
    if (Life >= 2.0) {
        GliderC2 = 1;

        UIImage *btnImage4 = [UIImage imageNamed:@"rocket2.png"];
        [glider4 setImage:btnImage4 forState:UIControlStateNormal];
    }
    if (Life >= 25) {
        GliderC2 = 2;
        
        UIImage *btnImage7 = [UIImage imageNamed:@"Sky_Dragon.png"];
        [glider7 setImage:btnImage7 forState:UIControlStateNormal];
    }
}
-(IBAction) back1{
    GliderPlaneViewController *Main = [[GliderPlaneViewController alloc] initWithNibName:nil bundle:nil];
    [self presentModalViewController:Main animated:YES];
}
-(void) popView: (UIView*) view {
	[view setHidden: NO];
	[[view layer] addAnimation: buttonAction
						forKey: @"trasnform.scale"]; 
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
    [original release];
    [glider1 release];
    [glider2 release];
    [glider3 release];
    [glider4 release];
    [glider5 release];
    [glider6 release];
    [glider7 release];
    [glider8 release];
    [back release];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

-(void) viewWillAppear:(BOOL)animated {
	[buttonAction setDuration:0.3];
    [original setHidden:YES];
    [glider1 setHidden:YES];
    [glider2 setHidden:YES];
    [glider3 setHidden:YES];
    [glider4 setHidden:YES];
    [glider5 setHidden:YES];
    [glider6 setHidden:YES];
    [glider7 setHidden:YES];
    [glider8 setHidden:YES]; 
    [back setHidden:YES];
    
	[self performSelector:@selector(popView:)
			   withObject: original afterDelay: 0.30];
	[self performSelector:@selector(popView:)
			   withObject: glider1 afterDelay: 0.35];
    [self performSelector:@selector(popView:)
               withObject:glider2 afterDelay:0.40];
    [self performSelector:@selector(popView:)
			   withObject: glider3 afterDelay: 0.45];
	[self performSelector: @selector(popView:) 
               withObject:glider4 afterDelay:0.50];
    [self performSelector: @selector(popView:) 
               withObject:glider5 afterDelay:0.55];
    [self performSelector: @selector(popView:) 
               withObject:glider6 afterDelay:0.60];
    [self performSelector: @selector(popView:) 
               withObject:glider7 afterDelay:0.65];
    [self performSelector: @selector(popView:) 
               withObject:glider8 afterDelay:0.70];
    [self performSelector:@selector(popView:) 
               withObject:back afterDelay:0.75];

}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
	GliderC = 0;
    GliderC1 = 0;
    GliderC2 = 0;
    Selected = [prefs integerForKey:@"selected"];
    
    [prefs setInteger:Selected forKey:@"selected"];
    Endless = [prefs integerForKey:@"highscores1"];
    Play = [prefs integerForKey:@"highscores"];
    Life = [prefs integerForKey:@"highscores2"];
    [prefs synchronize];
    
    buttonAction = [CAKeyframeAnimation 
					animationWithKeyPath:@"transform.scale"];
	buttonAction.keyTimes =[NSArray arrayWithObjects:
							[NSNumber numberWithFloat:0.0],
							[NSNumber numberWithFloat:0.7], [NSNumber numberWithFloat:1.0], nil];
	buttonAction.values = [NSArray arrayWithObjects:
						   [NSNumber numberWithFloat:0.01],
						   [NSNumber numberWithFloat:1.1], [NSNumber numberWithFloat:1.0], nil];
	[buttonAction retain];
    
    [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(scoreCheck) userInfo:nil repeats:NO];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.original = nil;
    self.glider1 = nil;
    self.glider2 = nil;
    self.glider3 = nil;
    self.glider4 = nil;
    self.glider5 = nil;
    self.glider6 = nil;
    self.glider7 = nil;
    self.glider8 = nil;
    self.back = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
