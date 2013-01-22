//
//  GliderPlaneViewController.m
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
#import "SetViewController.h"


@implementation GliderPlaneViewController
@synthesize play1, highScore1, help1, about1, shop1;

-(IBAction) play
{
	SelectViewController *Play = [[SelectViewController alloc] initWithNibName: nil bundle: nil];
	[self presentModalViewController: Play animated:YES];	
	
}
-(IBAction) highScore
{
    PlayViewContoller *HighScore = [[HighScoreViewController alloc] initWithNibName:nil bundle:nil];
    [self presentModalViewController:HighScore animated:YES];
}
 
-(IBAction) help
{
	HelpViewController *Help = [[HelpViewController alloc] initWithNibName: nil bundle: nil];
	[self presentModalViewController: Help animated:YES];	
	
}
-(IBAction) about
{
    SetViewController *Set = [[SetViewController alloc] initWithNibName: nil bundle: nil];
    [self presentModalViewController:Set animated: YES];

}
-(IBAction) shop
{
    ShopViewController *Shop = [[ShopViewController alloc] initWithNibName:nil bundle:nil];
    [self presentModalViewController:Shop animated:YES];
}

-(void) popView: (UIView*) view {
	[view setHidden: NO];
	[[view layer] addAnimation: buttonAction
						forKey: @"trasnform.scale"]; 
}

-(void) viewWillAppear:(BOOL)animated {
	[buttonAction setDuration:0.3];
	[play1 setHidden:YES];
	[highScore1 setHidden:YES];
	[help1 setHidden:YES];
    [shop1 setHidden:YES];
	
	[self performSelector:@selector(popView:)
			   withObject: play1 afterDelay: 0.30];
	[self performSelector:@selector(popView:)
			   withObject: highScore1 afterDelay: 0.35];
	[self performSelector: @selector(popView:)
			   withObject: help1 afterDelay: 0.40];
    [self performSelector:@selector(popView:) 
               withObject:shop1 afterDelay:0.45];
	 
}


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


-(void)viewDidLoad {
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
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	self.play1 = nil;
	self.help1 = nil;
	self.highScore1 = nil;
	self.about1 = nil;
    self.shop1 = nil;
}


- (void)dealloc {
    [super dealloc];
	[play1 release];
	[help1 release];
	[highScore1 release];
	[about1 release];
    [shop1 release];

}

@end
