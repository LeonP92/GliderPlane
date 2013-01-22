//
//  SetViewController.m
//  GliderPlane
//
//  Created by Leon on 5/19/11.
//  Copyright 2011 Dark Steed Games. All rights reserved.
//

#import "SetViewController.h"
#import "GliderPlaneViewController.h"

@implementation SetViewController
@synthesize back2, upSen, downSen, glider, sensitivity1, lblSen;

-(IBAction) back1{
    GliderPlaneViewController *Main = [[GliderPlaneViewController alloc] initWithNibName:nil bundle:nil];
    [self presentModalViewController:Main animated:YES];
}
-(IBAction) up{
    if(sensitivity1 < 5){  
        sensitivity1 = sensitivity1 + 1;
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        [prefs setInteger:sensitivity1 forKey:@"sense"];
        [prefs synchronize];
    
        lblSen.text = [NSString stringWithFormat:@"%i", sensitivity1];
    }
}
-(IBAction) down{
    if(sensitivity1 > 0){
        sensitivity1 = sensitivity1 - 1;
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        [prefs setInteger:sensitivity1 forKey:@"sense"];
        [prefs synchronize];
    
        lblSen.text = [NSString stringWithFormat:@"%i", sensitivity1];
    }
}
-(void) reset{
    if (glider.center.y < 0) {
        glider.image = [UIImage imageNamed:@"plane.png"];
        glider.center = CGPointMake(160, 350);
        gliderVelocity = CGPointMake(0, 0);
        
    }
}
//Touch anywhere to make glider begin to move only if it is not already moving
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	
	if (gliderVelocity.x == 0 & gliderVelocity.y == 0) {
		gliderVelocity = CGPointMake(0, -6.5);
		
	}
	
}
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
    [back2 release];
    [upSen release];
    [downSen release];
    [glider release];
    [lblSen release];
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
    [back2 setHidden:YES];
    [upSen setHidden:YES];
    [downSen setHidden:YES];

	[self performSelector:@selector(popView:)
			   withObject: downSen afterDelay: 0.30];
	[self performSelector:@selector(popView:)
			   withObject: upSen afterDelay: 0.35];
    [self performSelector:@selector(popView:)
               withObject:back2 afterDelay:0.40];
  
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    gliderVelocity = CGPointMake(0, 0);
    glider.center = CGPointMake(160, 350);
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    sensitivity1 = [prefs integerForKey:@"sense"];
    lblSen.text = [NSString stringWithFormat: @"%i", sensitivity1];
    
    [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(reset) userInfo:nil repeats:YES]; 
    [NSTimer scheduledTimerWithTimeInterval:.019 target:self selector:@selector(gliderMovement) userInfo:nil repeats:YES];
    
    buttonAction = [CAKeyframeAnimation 
					animationWithKeyPath:@"transform.scale"];
	buttonAction.keyTimes =[NSArray arrayWithObjects:
							[NSNumber numberWithFloat:0.0],
							[NSNumber numberWithFloat:0.7], [NSNumber numberWithFloat:1.0], nil];
	buttonAction.values = [NSArray arrayWithObjects:
						   [NSNumber numberWithFloat:0.01],
						   [NSNumber numberWithFloat:1.1], [NSNumber numberWithFloat:1.0], nil];
	[buttonAction retain];
    
    [[ UIAccelerometer sharedAccelerometer] setUpdateInterval:0.01];
	[[ UIAccelerometer sharedAccelerometer] setDelegate:self];
}

//Move glider only left or right
-(void) moveGliderWithX:(float) xAmount{
	CGPoint gliderCenter = glider.center;
	
	gliderCenter.x += xAmount;
	glider.center = CGPointMake(gliderCenter.x, glider.center.y);
	
    if (xAmount >= 1) {
            glider.image = [UIImage imageNamed:@"plane_right.png"];
  
    }
    if (xAmount <= -1) {
            glider.image = [UIImage imageNamed:@"plane_left.png"];
  
    }
    if(xAmount > -1 && xAmount < 1) {
            glider.image = [UIImage imageNamed:@"plane.png"];
     
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
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.back2 = nil;
    self.upSen = nil;
    self.downSen = nil;
    self.glider = nil;
    self.lblSen = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
