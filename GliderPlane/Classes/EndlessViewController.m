//
//  EndlessViewController.m
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

@implementation EndlessViewController
@synthesize cloud1, cloud2, cloud3, cloud4, cloud5, glider, sensitivity1;
@synthesize quit1, highScore, bannerIsVisible, lblhigh, lblscore, selectedGlider;

//Buttons that will lead to other screens
-(IBAction) quit;
{
	GliderPlaneViewController *Back = [[GliderPlaneViewController alloc] initWithNibName: nil bundle: nil];
	[self presentModalViewController: Back animated:YES];	
	
}

//Touch anywhere to make glider begin to move only if it is not already moving
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	previousScore = score;
	
	if (gliderVelocity.x == 0 & gliderVelocity.y == 0) {
		gliderVelocity = CGPointMake(0, -2.1);
		
	}
	
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
    [adView release];
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle
-(void) gliderMovement{
	glider.center = CGPointMake(glider.center.x + gliderVelocity.x, glider.center.y + gliderVelocity.y);
	
	//Allows moving across sides
	if (glider.center.x <-5.0) {
		glider.center = CGPointMake(315, glider.center.y - 1);
	}
	if (glider.center.x > 315) {
		glider.center = CGPointMake(-5, glider.center.y - 1);
	}
}
//Resets everything after collision
-(void) reset{
	score = 0;
	lblscore.text = [NSString stringWithFormat: @"Score: 0"] ; 
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
    
    cloud1.center = CGPointMake(random() % 220 + 50, random() % 200 +57);
	cloud2.center = CGPointMake(random() % 220 + 50, random() % 200 +57);
	cloud3.center = CGPointMake(random() % 220 + 50, random() % 200 +57);
	cloud4.center = CGPointMake(random() % 220 + 50, random() % 200 +57);
	cloud5.center = CGPointMake(random() % 220 + 50, random() % 200 +57);
    
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setInteger:highScore forKey: @"highscores1"];
    [prefs synchronize];
    lblhigh.text = [NSString stringWithFormat:@"High Score: " @"%i", highScore];
}	
//keeps screen moving
- (void) adjust{
    if (glider.center.y < (self.view.bounds.size.height/ 1.6)) {
        float difference = (self.view.bounds.size.height/ 1.6) - glider.center.y;
        score += (int)difference;
        NSString *nssScore = [NSString stringWithFormat:@"Score: " @"%i", score];
        lblscore.text = nssScore;
        glider.center = CGPointMake(glider.center.x, glider.center.y + difference);
        cloud1.center = CGPointMake(cloud1.center.x, cloud1.center.y + difference);
        cloud2.center = CGPointMake(cloud2.center.x, cloud2.center.y + difference);
        cloud3.center = CGPointMake(cloud3.center.x, cloud3.center.y + difference);
        cloud4.center = CGPointMake(cloud4.center.x, cloud4.center.y + difference);
        cloud5.center = CGPointMake(cloud5.center.x, cloud5.center.y + difference);
    }
    if (score > highScore) {
        highScore = score;
    }
    
    float viewWidth = self.view.bounds.size.width;
    float fViewWidthMinusPlatformWidth = viewWidth - 20.0f;
    int iViewWidthMinusPlatformWidth = (int)fViewWidthMinusPlatformWidth;
    // If the clouds move off the screen, then reset them at a random spot at the top
    if (cloud1.center.y >= glider.center.y + 60) {
        float x = random() % iViewWidthMinusPlatformWidth;
        x = x + 22.5f;
        float y = (random() % 20)-8;
        cloud1.center = CGPointMake(x,y);
    }
    if (cloud2.center.y >= glider.center.y + 60) {
        float x = random() % iViewWidthMinusPlatformWidth;
        x = x + 22.5f;
        float y = (random() % 20)-8;
        cloud2.center = CGPointMake(x,y);
    }
    if (cloud3.center.y >= glider.center.y + 50) {
        float x = random() % iViewWidthMinusPlatformWidth;
        x = x + 22.5f;
        float y = (random() % 20)-8;
        cloud3.center = CGPointMake(x,y);
    }
    if (cloud4.center.y >= glider.center.y + 50) {
        float x = random() % iViewWidthMinusPlatformWidth;
        x = x + 22.5f;
        float y = (random() % 20)-8;
        cloud4.center = CGPointMake(x,y);
    }
    if (cloud5.center.y >= glider.center.y + 40) {
        float x = random() % iViewWidthMinusPlatformWidth;
        x = x + 22.5f;
        float y = (random() % 20)-8;
        cloud5.center = CGPointMake(x,y);
    }
    
    //Reset
    if (CGRectIntersectsRect(glider.frame, cloud1.frame) || CGRectIntersectsRect(glider.frame, cloud2.frame) || CGRectIntersectsRect(glider.frame, cloud3.frame) || CGRectIntersectsRect(glider.frame, cloud4.frame)
		|| CGRectIntersectsRect(glider.frame, cloud5.frame)) {
		[self reset];
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //iAd
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
	glider.center = CGPointMake(160, 400);
	gliderVelocity = CGPointMake(0, 0);
	cloud1.center = CGPointMake(random() % 220 + 50, random() % 200 +57);
	cloud2.center = CGPointMake(random() % 220 + 50, random() % 200 +57);
	cloud3.center = CGPointMake(random() % 220 + 50, random() % 200 +57);
	cloud4.center = CGPointMake(random() % 220 + 50, random() % 200 +57);
	cloud5.center = CGPointMake(random() % 220 + 50, random() % 200 +57);
    
    
    //High score settings
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
	highScore = [prefs integerForKey:@"highscores1"];
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
    
    //method timer
    [NSTimer scheduledTimerWithTimeInterval: 0.01 target:self selector:@selector(adjust) userInfo:nil repeats:YES];
    [NSTimer scheduledTimerWithTimeInterval: 0.01 target:self selector:@selector(gliderMovement) userInfo:nil repeats:YES];
    //tilting
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
    
}//allows tilting
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
- (void)viewDidUnload
{
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
	self.quit1 = nil;
    adView.delegate=nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
