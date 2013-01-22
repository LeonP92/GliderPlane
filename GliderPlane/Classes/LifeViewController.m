//
//  LifeViewController.m
//  GliderPlane
//
//  Created by Leon Pham on 2/14/11.
//  Copyright 2011 Dark Steed Games. All rights reserved.
//

#import "GliderPlaneViewController.h"
#import "PlayViewContoller.h"
#import "SelectViewController.h"
#import "HelpViewController.h"
#import "HighScoreViewController.h"
#import "EndlessViewController.h"
#import "LifeViewController.h"
#import "ShopViewController.h"


@implementation LifeViewController
@synthesize cloud1, cloud2, cloud3, cloud4, cloud5, glider, sensitivity1;
@synthesize quit1, highScore, bannerIsVisible, lblhigh, lblscore, lbllife, selectedGlider;


-(IBAction) quit;{
    GliderPlaneViewController *Quit = [[GliderPlaneViewController alloc] initWithNibName:nil bundle:nil];
    [self presentModalViewController:Quit animated:YES];
}
//Touch anywhere to make glider begin to move only if it is not already moving
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	previousScore = score;
	
	if (gliderVelocity.x == 0 & gliderVelocity.y == 0) {
		gliderVelocity = CGPointMake(0, -6.5);
		
	}
	
}

//Take life
-(void) takeLife{
    
    if (life == 0) {
        score = 0;
        lblscore.text = [NSString stringWithFormat: @"Score: 0"] ;
        
        life = 3;
        lbllife.text = [NSString stringWithFormat:@"Lives: " @"%i", life];
        cloud4.center = CGPointMake(-500, -500);
        cloud5.center = CGPointMake(-200, -200);
    }
}
//Resets everything after collision
-(void) reset{
    life = life - 1;
    lbllife.text = [NSString stringWithFormat:@"Lives: " @"%i", life];
    
	glider.center = CGPointMake(160, 400);
	gliderVelocity = CGPointMake(0, 0);
    //glider Image reset
    if (selectedGlider == 0) {
        glider.image = [UIImage imageNamed:@"plane.png"];
    }    
    if (selectedGlider == 1) {
        glider.image = [UIImage imageNamed:@"jet.png"];
    }
    if (selectedGlider == 2) {
        glider.image = [UIImage imageNamed:@"Kite.png"];
    }
    if(selectedGlider == 3){
        glider.image = [UIImage imageNamed:@"Crane.png"];
    }
    if (selectedGlider == 4) {
        glider.image = [UIImage imageNamed:@"rocket2.png"];
    }
    if (selectedGlider == 5) {
        glider.image = [UIImage imageNamed:@"blimp.png"];
    }
    if (selectedGlider == 6) {
        glider.image = [UIImage imageNamed:@"saucer.png"];
    }
    if (selectedGlider == 7) {
        glider.image = [UIImage imageNamed:@"Sky_Dragon.png"];
    }
    if (selectedGlider == 8) {
        glider.image = [UIImage imageNamed:@"dragonfly copy.png"];
    }
    
    if (life == 0) {
        [self takeLife];
    }
    
}	

//Check for intersections
-(void) collisionCheck{
	if (CGRectIntersectsRect(glider.frame, cloud1.frame) || CGRectIntersectsRect(glider.frame, cloud2.frame) || CGRectIntersectsRect(glider.frame, cloud3.frame) || CGRectIntersectsRect(glider.frame, cloud4.frame)
		|| CGRectIntersectsRect(glider.frame, cloud5.frame)) {
        
        [self reset];

    }
}
//Makes glider move & moves clouds if score is more than 9
-(void) gliderMovement{
	glider.center = CGPointMake(glider.center.x + gliderVelocity.x, glider.center.y + gliderVelocity.y);
	
	//Allows moving across sides
	if (glider.center.x <-5.0) {
		glider.center = CGPointMake(315, glider.center.y - 1);
	}
	if (glider.center.x > 315) {
		glider.center = CGPointMake(-5, glider.center.y - 1);
	}
	//moves clouds
    
	//if Score is over 9
	if (score > 9) {
		cloud1.center = CGPointMake(cloud1.center.x + pos.x, cloud1.center.y + pos.y);
		cloud2.center = CGPointMake(cloud2.center.x + pos2.x, cloud2.center.y + pos2.y);
		cloud3.center = CGPointMake(cloud3.center.x + pos3.x, cloud3.center.y + pos3.y);
		cloud4.center = CGPointMake(cloud4.center.x + pos4.x, cloud4.center.y + pos4.y);
		cloud5.center = CGPointMake(cloud5.center.x + pos5.x, cloud5.center.y + pos5.y);
		
		//bounces off the walls
		//cloud1
		if (cloud1.center.x > 300 || cloud1.center.x < 30 || CGRectIntersectsRect(cloud2.frame, cloud1.frame) ||
			CGRectIntersectsRect(cloud3.frame, cloud1.frame) || CGRectIntersectsRect(cloud4.frame, cloud1.frame) ||
			CGRectIntersectsRect(cloud1.frame, cloud5.frame)){
			pos.x = -pos.x;
		}
		if (cloud1.center.y > 325 || cloud1.center.y < 30 || CGRectIntersectsRect(cloud2.frame, cloud1.frame) ||
			CGRectIntersectsRect(cloud3.frame, cloud1.frame) || CGRectIntersectsRect(cloud1.frame, cloud4.frame) ||
			CGRectIntersectsRect(cloud1.frame, cloud5.frame)) {
			pos.y = -pos.y;
		}
		//cloud2
		if (cloud2.center.x > 300 || cloud2.center.x < 30 || CGRectIntersectsRect(cloud2.frame, cloud1.frame) ||
			CGRectIntersectsRect(cloud2.frame, cloud3.frame) || CGRectIntersectsRect(cloud2.frame, cloud4.frame) ||
			CGRectIntersectsRect(cloud2.frame, cloud5.frame)){
			pos2.x = -pos2.x;
		}
		if (cloud2.center.y > 325 || cloud2.center.y < 30 || CGRectIntersectsRect(cloud2.frame, cloud1.frame) || 
			CGRectIntersectsRect(cloud2.frame, cloud3.frame) || CGRectIntersectsRect(cloud2.frame, cloud4.frame) ||
			CGRectIntersectsRect(cloud2.frame, cloud5.frame)) {
			pos2.y = -pos2.y;
		}
		//cloud3
		if (cloud3.center.x > 300 || cloud3.center.x < 30 || CGRectIntersectsRect(cloud3.frame, cloud1.frame) ||
			CGRectIntersectsRect(cloud2.frame, cloud3.frame) || CGRectIntersectsRect(cloud3.frame, cloud4.frame) ||
			CGRectIntersectsRect(cloud3.frame, cloud5.frame)){
			pos3.x = -pos3.x;
		}
		if (cloud3.center.y > 325 || cloud3.center.y < 30 || CGRectIntersectsRect(cloud3.frame, cloud1.frame) || 
			CGRectIntersectsRect(cloud2.frame, cloud3.frame) || CGRectIntersectsRect(cloud3.frame, cloud4.frame) ||
			CGRectIntersectsRect(cloud3.frame, cloud5.frame)) {
			pos3.y = -pos3.y;
		}
		//cloud4
		if (cloud4.center.x > 300 || cloud4.center.x < 30 || CGRectIntersectsRect(cloud4.frame, cloud1.frame) ||
			CGRectIntersectsRect(cloud4.frame, cloud2.frame) || CGRectIntersectsRect(cloud3.frame, cloud4.frame) ||
			CGRectIntersectsRect(cloud4.frame, cloud5.frame)){
			pos4.x = -pos4.x;
		}
		if (cloud4.center.y > 325 || cloud4.center.y < 30 || CGRectIntersectsRect(cloud4.frame, cloud1.frame) || 
			CGRectIntersectsRect(cloud2.frame, cloud4.frame) || CGRectIntersectsRect(cloud3.frame, cloud4.frame) || 
			CGRectIntersectsRect(cloud4.frame, cloud5.frame)) {
			pos4.y = -pos4.y;
		}
		//cloud5
		if (cloud5.center.x > 300 || cloud5.center.x < 30 || CGRectIntersectsRect(cloud5.frame, cloud1.frame) ||
			CGRectIntersectsRect(cloud5.frame, cloud2.frame) || CGRectIntersectsRect(cloud5.frame, cloud3.frame) ||
			CGRectIntersectsRect(cloud5.frame, cloud4.frame)){
			pos5.x = -pos5.x;
		}
		if (cloud5.center.y > 325 || cloud5.center.y < 30 || CGRectIntersectsRect(cloud5.frame, cloud1.frame) || 
			CGRectIntersectsRect(cloud5.frame, cloud2.frame) || CGRectIntersectsRect(cloud5.frame, cloud3.frame) || 
			CGRectIntersectsRect(cloud5.frame, cloud4.frame)) {
			pos5.y = -pos5.y;
		}
	}
    
}

//scoring & resets positions
-(void) addScore{	
	if(glider.center.y <0){
		glider.center = CGPointMake(160, 400);
		gliderVelocity = CGPointMake(0, 0);
		score = score + 1 ;
		lblscore.text = [NSString stringWithFormat:@"Score: " @"%i", score];
		
        //resets Glider Image
        if (selectedGlider == 0) {
            glider.image = [UIImage imageNamed:@"plane.png"];
        }    
        if (selectedGlider == 1) {
            glider.image = [UIImage imageNamed:@"jet.png"];
        }
        if (selectedGlider == 2) {
            glider.image = [UIImage imageNamed:@"Kite.png"];
        }
        if(selectedGlider == 3){
            glider.image = [UIImage imageNamed:@"Crane.png"];
        }
        if (selectedGlider == 4) {
            glider.image = [UIImage imageNamed:@"rocket2.png"];
        }
        if (selectedGlider == 5) {
            glider.image = [UIImage imageNamed:@"blimp.png"];
        }
        if (selectedGlider == 6) {
            glider.image = [UIImage imageNamed:@"saucer.png"];
        }
        if (selectedGlider == 7) {
            glider.image = [UIImage imageNamed:@"Sky_Dragon.png"];
        }
        if (selectedGlider == 8) {
            glider.image = [UIImage imageNamed:@"dragonfly copy.png"];
        }
        
        
        //score
		if (score <= 3) {
			cloud1.center = CGPointMake(random() % 220 + 50, random() % 200 +57);
			cloud2.center = CGPointMake(random() % 220 + 50, random() % 200 +57);
			cloud3.center = CGPointMake(random() % 220 + 50, random() % 200 +57);
			
		}
		if (score > 3 && score <= 6) {
			cloud1.center = CGPointMake(random() % 220 + 50, random() % 200 +57);
			cloud2.center = CGPointMake(random() % 220 + 50, random() % 200 +57);
			cloud3.center = CGPointMake(random() % 220 + 50, random() % 200 +57);
			cloud4.center = CGPointMake(random() % 220 + 50, random() % 200 +57);
			
		}
		if (score > 6 && score <= 9) {
			cloud1.center = CGPointMake(random() % 220 + 50, random() % 200 +57);
			cloud2.center = CGPointMake(random() % 220 + 50, random() % 200 +57);
			cloud3.center = CGPointMake(random() % 220 + 50, random() % 200 +57);
			cloud4.center = CGPointMake(random() % 220 + 50, random() % 200 +57);
			cloud5.center = CGPointMake(random() % 220 + 50, random() % 200 +57);
			
		}
		if (CGRectIntersectsRect(cloud1.frame, cloud2.frame) ||
			CGRectIntersectsRect(cloud1.frame, cloud3.frame) ||
			CGRectIntersectsRect(cloud1.frame, cloud4.frame) ||
			CGRectIntersectsRect(cloud1.frame, cloud5.frame)) {
			cloud1.center = CGPointMake(random() % 220 + 50, random() % 200 +57);
		}
		if (CGRectIntersectsRect(cloud2.frame, cloud3.frame) ||
			CGRectIntersectsRect(cloud2.frame, cloud4.frame) ||
			CGRectIntersectsRect(cloud2.frame, cloud5.frame)) {
			cloud2.center = CGPointMake(random() % 220 + 50, random() % 200 +57);
		}
		if (CGRectIntersectsRect(cloud3.frame, cloud4.frame) ||
			CGRectIntersectsRect(cloud3.frame, cloud5.frame)) {
			cloud3.center = CGPointMake(random() % 220 + 50, random() % 200 +57);
		}
		if (CGRectIntersectsRect(cloud4.frame, cloud5.frame)) {
			cloud5.center = CGPointMake(random() % 220 + 50, random() % 200 +57);
		}
        
		if (score > highScore) {
			highScore = score;
			lblhigh.text = [NSString stringWithFormat:@"High Score: " @"%i", highScore];
			
			NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
			[prefs setInteger:highScore forKey: @"highscores2"];
			[prefs synchronize];
			
		}	
	}
}

//AD
- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
	if (!self.bannerIsVisible)
	{
		[UIView beginAnimations:@"animateAdBannerOn" context:NULL];
		// banner is invisible now and moved out of the screen on 50 px
		banner.frame = CGRectOffset(banner.frame, 0, 480);
		[UIView commitAnimations];
		self.bannerIsVisible = YES;
	}
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
	if (self.bannerIsVisible)
	{
		[UIView beginAnimations:@"animateAdBannerOff" context:NULL];
		// banner is visible and we move it out of the screen, due to connection issue
		banner.frame = CGRectOffset(banner.frame, 0, -480);
		[UIView commitAnimations];
		self.bannerIsVisible = NO;
	}
}
- (BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave
{
	NSLog(@"Banner view is beginning an ad action");
	BOOL shouldExecuteAction = YES;
	if (!willLeave && shouldExecuteAction)
    {
		
    }
	return shouldExecuteAction;
}

- (void)bannerViewActionDidFinish:(ADBannerView *)banner
{
	
}

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
 if (self) {
 // Custom initialization.
 }
 return self;
 }
 */

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    
    adView = [[ADBannerView alloc] initWithFrame:CGRectZero];
    adView.frame = CGRectOffset(adView.frame, 0, -50);
    [self.view addSubview:adView];
    adView.delegate=self;
    self.bannerIsVisible=NO;
    [super viewDidLoad];
    
    
	glider.hidden = NO;
	//Original velocity and score will equal zero
	score = 0;
	previousScore = 0;
    
    //life
    previousLife = 3;
    life = 3;
    lbllife.text = [NSString stringWithFormat:@"Lives: " @"%i", life];
    
    
	glider.center = CGPointMake(160, 400);
	gliderVelocity = CGPointMake(0, 0);
	cloud1.center = CGPointMake(random() % 220 + 50, random() % 200 +57);
	cloud2.center = CGPointMake(random() % 220 + 50, random() % 200 +57);
	cloud3.center = CGPointMake(random() % 220 + 50, random() % 200 +57);
	cloud4.center = CGPointMake(-500, -500);
	cloud5.center = CGPointMake(-200, -200);
	
	//HighScore settings
	NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
	highScore = [prefs integerForKey:@"highscores2"];
	lblhigh.text = [NSString stringWithFormat:@"High Score: " @"%i", highScore]; 
	sensitivity1 = [prefs integerForKey:@"sense"];
    selectedGlider = [prefs integerForKey:@"selected"];
    
    //Glider Image
    if (selectedGlider == 0) {
        glider.image = [UIImage imageNamed:@"plane.png"];
    }    
    if (selectedGlider == 1) {
        glider.image = [UIImage imageNamed:@"jet.png"];
    }
    if (selectedGlider == 2) {
        glider.image = [UIImage imageNamed:@"Kite.png"];
    }
    if(selectedGlider == 3){
        glider.image = [UIImage imageNamed:@"Crane.png"];
    }
    if (selectedGlider == 4) {
        glider.image = [UIImage imageNamed:@"rocket2.png"];
    }
    if (selectedGlider == 5) {
        glider.image = [UIImage imageNamed:@"blimp.png"];
    }
    if (selectedGlider == 6) {
        glider.image = [UIImage imageNamed:@"saucer.png"];
    }
    if (selectedGlider == 7) {
        glider.image = [UIImage imageNamed:@"Sky_Dragon.png"];
    }
    if (selectedGlider == 8) {
        glider.image = [UIImage imageNamed:@"dragonfly copy.png"];
    }
    
    
	pos = CGPointMake(-1, -1);
	pos2 = CGPointMake(-1, 1);
	pos3 = CGPointMake(1, 1);
	pos4 = CGPointMake(1, -1);
	pos5 = CGPointMake(-2, -2);
	//Timer for each method
	[NSTimer scheduledTimerWithTimeInterval: .019 
									 target:self 
								   selector:@selector (gliderMovement)
								   userInfo:nil
									repeats:YES];
	[NSTimer scheduledTimerWithTimeInterval: 0.05 
									 target:self
                                   selector:@selector (collisionCheck) 
                                   userInfo:nil 
									repeats:YES];
	[NSTimer scheduledTimerWithTimeInterval: 0.9
									 target:self 
								   selector:@selector (addScore) 
								   userInfo: nil 
									repeats:YES];
    
	
	[[ UIAccelerometer sharedAccelerometer] setUpdateInterval:0.01];
	[[ UIAccelerometer sharedAccelerometer] setDelegate:self];
}


//Move glider only left or right
-(void) moveGliderWithX:(float) xAmount{
	CGPoint gliderCenter = glider.center;
	
	gliderCenter.x += xAmount;
	glider.center = CGPointMake(gliderCenter.x, glider.center.y);
	
    if (xAmount >= 1) {
        if (selectedGlider == 0) {
            glider.image = [UIImage imageNamed:@"plane_right.png"];
        }    
        if (selectedGlider == 1) {
            glider.image = [UIImage imageNamed:@"jet_right.png"];
        }
        if (selectedGlider == 2) {
            glider.image = [UIImage imageNamed:@"Kite_tiltright.png"];
        }
        if(selectedGlider == 3){
            glider.image = [UIImage imageNamed:@"Crane_tiltright2.png"];
        }
        if (selectedGlider == 4) {
            glider.image = [UIImage imageNamed:@"rocket2_tiltright.png"];
        }
        if (selectedGlider == 5) {
            glider.image = [UIImage imageNamed:@"blimp2_right.png"];
        }
        if (selectedGlider == 6) {
            glider.image = [UIImage imageNamed:@"saucer_right.png"];
        }
        if (selectedGlider == 7) {
            glider.image = [UIImage imageNamed:@"Sky_Dragon_Right.png"];
        }
        if (selectedGlider == 8) {
            glider.image = [UIImage imageNamed:@"dragonfly_right.png"];
        }
    }
    if (xAmount <= -1) {
        if (selectedGlider == 0) {
            glider.image = [UIImage imageNamed:@"plane_left.png"];
        }    
        if (selectedGlider == 1) {
            glider.image = [UIImage imageNamed:@"jet_left.png"];
        }
        if (selectedGlider == 2) {
            glider.image = [UIImage imageNamed:@"Kite_tiltleft.png"];
        }
        if(selectedGlider == 3){
            glider.image = [UIImage imageNamed:@"Crane_tiltleft2.png"];
        }
        if (selectedGlider == 4) {
            glider.image = [UIImage imageNamed:@"rocket2_tiltleft.png"];
        }
        if (selectedGlider == 5) {
            glider.image = [UIImage imageNamed:@"blimp_left.png"];
        }
        if (selectedGlider == 6) {
            glider.image = [UIImage imageNamed:@"saucer_left.png"];
        }
        if (selectedGlider == 7) {
            glider.image = [UIImage imageNamed:@"Sky_Dragon_Left.png"];
        }
        if (selectedGlider == 8) {
            glider.image = [UIImage imageNamed:@"dragonfly_left.png"];
        }
    }
    if(xAmount > -1 && xAmount < 1) {
        if (selectedGlider == 0) {
            glider.image = [UIImage imageNamed:@"plane.png"];
        }    
        if (selectedGlider == 1) {
            glider.image = [UIImage imageNamed:@"jet.png"];
        }
        if (selectedGlider == 2) {
            glider.image = [UIImage imageNamed:@"Kite.png"];
        }
        if(selectedGlider == 3){
            glider.image = [UIImage imageNamed:@"Crane.png"];
        }
        if (selectedGlider == 4) {
            glider.image = [UIImage imageNamed:@"rocket2.png"];
        }
        if (selectedGlider == 5) {
            glider.image = [UIImage imageNamed:@"blimp.png"];
        }
        if (selectedGlider == 6) {
            glider.image = [UIImage imageNamed:@"saucer.png"];
        }
        if (selectedGlider == 7) {
            glider.image = [UIImage imageNamed:@"Sky_Dragon.png"];
        }
        if (selectedGlider == 8) {
            glider.image = [UIImage imageNamed:@"dragonfly copy.png"];
        }
    }

}
//allows tilting
- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration{
	if (sensitivity1 == 0) {
        float sensitivity = 3.0f;
        float xDistance = acceleration.x * sensitivity;
        
        if (glider.center.y < 350) {
            [self moveGliderWithX:xDistance];
        }
    }
    if (sensitivity1 == 1) {
        float sensitivity = 4.0f;
        float xDistance = acceleration.x * sensitivity;
        
        if (glider.center.y < 350) {
            [self moveGliderWithX:xDistance];
        }
    }
    if (sensitivity1 == 2) {
        float sensitivity = 5.0f;
        float xDistance = acceleration.x * sensitivity;
        
        if (glider.center.y < 350) {
            [self moveGliderWithX:xDistance];
        }
    }
    if (sensitivity1 == 3) {
        float sensitivity = 6.0f;
        float xDistance = acceleration.x * sensitivity;
        
        if (glider.center.y < 350) {
            [self moveGliderWithX:xDistance];
        }
    }
	if (sensitivity1 == 4) {
        float sensitivity = 7.0f;
        float xDistance = acceleration.x * sensitivity;
        
        if (glider.center.y < 350) {
            [self moveGliderWithX:xDistance];
        }
    }
    if (sensitivity1 == 5) {
        float sensitivity = 8.0f;
        float xDistance = acceleration.x * sensitivity;
        
        if (glider.center.y < 350) {
            [self moveGliderWithX:xDistance];
        }
    }
}
/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations.
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
	self.glider = nil;
	self.cloud1 = nil;
	self.cloud2 = nil;
	self.cloud3 = nil;
	self.cloud4 = nil;
	self.cloud5 = nil;
	self.lblhigh = nil;
	self.lblscore = nil;
    self.lbllife = nil;
	self.quit1 = nil;
    adView.delegate=nil;
}


- (void)dealloc {
    [super dealloc];
	[cloud1 release];
	[cloud2 release];
	[cloud3 release];
	[cloud4 release];
	[cloud5 release];
	[glider release];
	[lblhigh release];
	[lblscore release];
	[quit1 release];
    [lbllife release];
	[adView release];
}


@end