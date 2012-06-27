//
//  RootViewController.m
//  CoreTextDemo
//
//  Created by joe on 3/1/12.
//  Copyright (c) 2012 NewPower Co. All rights reserved.
//

#import "RootViewController.h"

@implementation RootViewController
@synthesize mutableAttributedString;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    MainView *view = [[MainView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    self.view = view;
}

#pragma Fuctions
- (NSString *)getString
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"text" ofType:@"rtf"];
    NSString *string = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    return string;
}


-(void)attributes
{
    NSInteger attStringLength = [self.mutableAttributedString length];
    UIFont *font = [UIFont systemFontOfSize:14.0f];
    [self.mutableAttributedString setFont:font size:14.0f range:NSMakeRange(0, attStringLength)];
    [self.mutableAttributedString setKern:10.0f range:NSMakeRange(0, attStringLength)];
}
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *string = [self getString];
    self.mutableAttributedString = [[NSMutableAttributedString alloc] initWithString:string];
    [self attributes];
    [(MainView *)self.view setMutableAttString:self.mutableAttributedString];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
