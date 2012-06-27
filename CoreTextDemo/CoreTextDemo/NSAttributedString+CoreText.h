//
//  NSAttributedString+CoreText.h
//  CoreTextDemo
//
//  Created by joe on 3/1/12.
//  Copyright (c) 2012 NewPower Co. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreText/CoreText.h>
@interface NSMutableAttributedString (coretext)

- (void)setFont:(UIFont *)font size:(CGFloat)size range:(NSRange)range;
- (void)setKern:(CGFloat)kern range:(NSRange)range;
@end
