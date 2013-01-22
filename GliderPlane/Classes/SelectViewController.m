//
//  SelectViewController.m
//  GliderPlane
//
//  Created by Leon Pham on 2/14/11.
//  Copyright 2011 Dark Steed Games. All rights reserved.
//
#import "SelectViewController.h"
#import "GliderPlaneViewController.h"
#import "PlayViewContoller.h"
#import "HelpViewController.h"
#import "HighScoreViewController.h"
#import "EndlessViewController.h"
#import "LifeViewController.h"
#import "ShopViewController.h"


@implementation SelectViewController
@synthesize back1, classic1, endless1, life1;


-(IBAction) highScore
{
	
	HighScoreViewController *HighScore = [[HighScoreViewController alloc] initWithNibName:nil bundle:nil];
    [self presentModalViewController:HighScore animated:YES];
	
}
-(IBAction) classic
{
	PlayViewContoller *Play = [[PlayViewContoller alloc] initWithNibName: nil bundle: nil];
	[self presentModalViewController: Play animated:YES];		
	
}
-(IBAction) endless
{
    EndlessViewController *Endless = [[EndlessViewController alloc] initWithNibName:nil bundle:nil];
    [self presentModalViewController:Endless animated:YES];
}
-(IBAction) life{
    LifeViewController *Life = [[LifeViewController alloc] initWithNibName:nil bundle:nil];
    [self presentModalViewController:Life animated:YES];
}
-(IBAction) back
{
	GliderPlaneViewController *Main = [[GliderPlaneViewController alloc] initWithNibName:nil bundle:nil];
	[self presentModalViewController:Main animated:YES];
}

-(void) popView: (UIView*) view {
	[view setHidden: NO];
	[[view layer] addAnimation: buttonAction
						forKey: @"trasnform.scale"]; 
}

-(void) viewWillAppear:(BOOL)animated {
	[buttonAction setDuration:0.3];
	[classic1 setHidden:YES];
	[endless1 setHidden:YES];
    [life1 setHidden:YES];
	[back1 setHidden:YES];
	
	[self performSelector:@selector(popView:)
			   withObject: classic1 afterDelay: 0.30];
	[self performSelector:@selector(popView:)
			   withObject: endless1 afterDelay: 0.35];
    [self performSelector:@selector(popView:)
               withObject:life1 afterDelay:0.40];
	[self performSelector: @selector(popView:)
			   withObject: back1 afterDelay: 0.45];
	
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
	self.back1 = nil;
	self.classic1 = nil;
    self.life1 = nil;
}


- (void)dealloc {
    [super dealloc];
	[back1 release];
	[classic1 release];
    [life1 release];
}


@end
