//
//  NSAttributedString+CoreText.m
//  CoreTextDemo
//
//  Created by joe on 3/1/12.
//  Copyright (c) 2012 NewPower Co. All rights reserved.
//

#import "NSAttributedString+CoreText.h"

@implementation NSMutableAttributedString (coretext)
- (void)setFont:(UIFont *)font size:(CGFloat)size range:(NSRange)range
{
    CTFontRef aFont = CTFontCreateWithName((__bridge CFStringRef)font.fontName, size, NULL);
    if (!aFont) return;
    [self addAttribute:(NSString *)kCTFontAttributeName value:(__bridge id)aFont range:range];
    CFRelease(aFont);
}


- (void)setKern:(CGFloat)kern range:(NSRange)range
{
    CFNumberRef numberRef ;
    CFNumberCreate(kCFAllocatorDefault, 6, &numberRef);
    [self addAttribute:(NSString *)kCTKernAttributeName value:(__bridge id)numberRef range:range];
    CFRelease(numberRef);
}

@end
