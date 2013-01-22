//
//  HelpViewController.m
//  GliderPlane
//
//  Created by Leon Pham on 2/15/11.
//  Copyright 2011 Dark Steed Games. All rights reserved.
//
#import "HelpViewController.h"
#import "SelectViewController.h"
#import "GliderPlaneViewController.h"
#import "PlayViewContoller.h"
#import "HighScoreViewController.h"
#import "EndlessViewController.h"
#import "LifeViewController.h"
#import "ShopViewController.h"


@implementation HelpViewController
@synthesize back11;

-(IBAction) back1;
{
	GliderPlaneViewController *Main = [[GliderPlaneViewController alloc] initWithNibName:nil bundle:nil];
	[self presentModalViewController: Main animated:YES];
}

-(void) popView: (UIView*) view {
	[view setHidden: NO];
	[[view layer] addAnimation: buttonAction
						forKey: @"trasnform.scale"]; 
}

-(void) viewWillAppear:(BOOL)animated {
	[buttonAction setDuration:0.3];
	[back11 setHidden:YES];
	
	[self performSelector:@selector(popView:)
			   withObject: back11 afterDelay: 0.30];
	
	
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
	self.back11 = nil;
}


- (void)dealloc {
    [super dealloc];
	[back11 release];
}


@end
