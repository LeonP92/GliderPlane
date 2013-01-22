//
//  HighScoreViewController.m
//  GliderPlane
//
//  Created by user on 3/16/11.
//  Copyright 2011 Dark Steed Games. All rights reserved.
//
#import "HighScoreViewController.h"
#import "GliderPlaneViewController.h"
#import "PlayViewContoller.h"
#import "SelectViewController.h"
#import "HelpViewController.h"
#import "EndlessViewController.h"
#import "LifeViewController.h"
#import "ShopViewController.h"


@implementation HighScoreViewController
@synthesize backToMenu, classic, endless, life;
@synthesize lblclassic, lblendless, lbllife;

-(IBAction) classic1{
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSInteger hS = [prefs integerForKey:@"highscores"]; 
    
    GKScore *scoreSubmit = [[[GKScore alloc] initWithCategory:@"11181992"] autorelease];
    scoreSubmit.value = hS;
    
    [scoreSubmit reportScoreWithCompletionHandler:^(NSError *error) {
        if (error != nil) {
            NSLog(@"Failed! Try Again!");
            
            UIAlertView *alert1 = [[UIAlertView alloc]
                                   initWithTitle:@"High Score" message:@"There was an error! Try again!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert1 show];
            [alert1 release];
        }
        else{
            
            GKLeaderboardViewController *leaderboardController = [[GKLeaderboardViewController alloc] init];
            if (leaderboardController != nil)
            {
                leaderboardController.leaderboardDelegate = self;
                [self presentModalViewController: leaderboardController animated: YES];
            }
        }
    }];
}
-(IBAction) endless1{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSInteger hS = [prefs integerForKey:@"highscores1"];
    
    GKScore *scoreSubmit = [[[GKScore alloc] initWithCategory:@"11181993"] autorelease];
    scoreSubmit.value = hS;
    [scoreSubmit reportScoreWithCompletionHandler:^(NSError *error) {
        if (error != nil) {
            NSLog(@"Failed! Try Again!");
            
            UIAlertView *alert1 = [[UIAlertView alloc]
                                   initWithTitle:@"High Score" message:@"There was an error! Try again!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert1 show];
            [alert1 release];
        }
        else{
            
            GKLeaderboardViewController *leaderboardController = [[GKLeaderboardViewController alloc] init];
            if (leaderboardController != nil)
            {
                leaderboardController.leaderboardDelegate = self;
                [self presentModalViewController: leaderboardController animated: YES];
            }
        }
    }];
    
}
-(IBAction) life1{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSInteger hS = [prefs integerForKey:@"highscores2"];
    
    GKScore *scoreSubmit = [[[GKScore alloc] initWithCategory:@"11181994"] autorelease];
    scoreSubmit.value = hS;
    [scoreSubmit reportScoreWithCompletionHandler:^(NSError *error) {
        if (error != nil) {
            NSLog(@"Failed! Try Again!");
            
            UIAlertView *alert1 = [[UIAlertView alloc]
                                   initWithTitle:@"High Score" message:@"There was an error! Try again!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert1 show];
            [alert1 release];
        }
        else{
            
            GKLeaderboardViewController *leaderboardController = [[GKLeaderboardViewController alloc] init];
            if (leaderboardController != nil)
            {
                leaderboardController.leaderboardDelegate = self;
                [self presentModalViewController: leaderboardController animated: YES];
            }
        }
    }];

}
-(IBAction) backToMenu1{
    GliderPlaneViewController *Menu = [[GliderPlaneViewController alloc] initWithNibName:nil bundle:nil];
    [self presentModalViewController:Menu animated: YES];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
BOOL isGameCenterAPIAvailable()
{
    // Check for presence of GKLocalPlayer class.
    BOOL localPlayerClassAvailable = (NSClassFromString(@"GKLocalPlayer")) != nil;
    
    // The device must be running iOS 4.1 or later.
    NSString *reqSysVer = @"4.1";
    NSString *currSysVer = [[UIDevice currentDevice] systemVersion];
    BOOL osVersionSupported = ([currSysVer compare:reqSysVer options:NSNumericSearch] != NSOrderedAscending);
    
    return (localPlayerClassAvailable && osVersionSupported);
}


- (void)dealloc
{
    [super dealloc];
    [backToMenu release];
    [classic release];
    [endless release];
    [life release];
    [lblclassic release];
    [lblendless release];
    [lbllife release];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle
-(void) popView: (UIView*) view {
	[view setHidden: NO];
	[[view layer] addAnimation: buttonAction
						forKey: @"trasnform.scale"]; 
}

-(void) viewWillAppear:(BOOL)animated {
	[buttonAction setDuration:0.3];
    [backToMenu setHidden:YES];
    [endless setHidden:YES];
    [classic setHidden:YES];
    [life setHidden:YES];
	[self performSelector:@selector(popView:)
			   withObject: classic afterDelay: 0.30];
	[self performSelector:@selector(popView:)
			   withObject: endless afterDelay: 0.35];
    [self performSelector:@selector(popView:)
               withObject:life afterDelay:0.40];
    [self performSelector:@selector(popView:)
			   withObject: backToMenu afterDelay: 0.45];
	
}
-(void) leaderboardViewControllerDidFinish: (GKLeaderboardViewController *) viewController{
    [self dismissModalViewControllerAnimated:YES];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSInteger hS = [prefs integerForKey:@"highscores"]; 
    lblclassic.text = [NSString stringWithFormat:@"Classic Mode: " @"%i", hS];
    
    NSInteger hS1 = [prefs integerForKey:@"highscores1"];
    lblendless.text = [NSString stringWithFormat:@"Endless Mode: " @"%i", hS1];
    
    NSInteger hS2 = [prefs integerForKey:@"highscores2"];
    lbllife.text = [NSString stringWithFormat:@"Life Mode: " @"%i", hS2];
    
    [[GKLocalPlayer localPlayer] authenticateWithCompletionHandler:^(NSError *error) {
        if (error == nil) {
            NSLog(@"Authentication Successful!");
        }
        else{
            NSLog(@"Authentication Failed!");
        }
    }];
    
    buttonAction = [CAKeyframeAnimation 
					animationWithKeyPath:@"transform.scale"];
	
	buttonAction.keyTimes =[NSArray arrayWithObjects:
							[NSNumber numberWithFloat:0.0],
							[NSNumber numberWithFloat:0.7], [NSNumber numberWithFloat:1.0], nil];
	
	buttonAction.values = [NSArray arrayWithObjects:
						   [NSNumber numberWithFloat:0.01],
						   [NSNumber numberWithFloat:1.1], [NSNumber numberWithFloat:1.0], nil];
	[buttonAction retain];
    
    
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.backToMenu = nil;
    self.classic = nil;
    self.endless = nil;
    self.life = nil;
    self.lblclassic = nil;
    self.lblendless = nil;
    self.lbllife = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end