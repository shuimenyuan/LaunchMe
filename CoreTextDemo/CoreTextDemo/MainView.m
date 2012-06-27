//
//  MainView.m
//  CoreTextDemo
//
//  Created by joe on 3/1/12.
//  Copyright (c) 2012 NewPower Co. All rights reserved.
//

#import "MainView.h"

@implementation MainView

@synthesize mutableAttString;

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0f, -1.0f);
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, self.bounds);
    CTFramesetterRef frameSetterRef = CTFramesetterCreateWithAttributedString(( __bridge CFAttributedStringRef)self.mutableAttString);
    CTFrameRef textFrameRef = CTFramesetterCreateFrame(frameSetterRef, CFRangeMake(0, [self.mutableAttString length]), path, NULL);
    CFRelease(path);
    CFRelease(frameSetterRef);
    CTFrameDraw(textFrameRef, context);
    CGContextRestoreGState(context);
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
