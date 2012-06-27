//
//  RootViewController.h
//  CoreTextDemo
//
//  Created by joe on 3/1/12.
//  Copyright (c) 2012 NewPower Co. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>
#import "NSAttributedString+CoreText.h"
#import "MainView.h"
@interface RootViewController : UIViewController

@property (nonatomic,strong)NSMutableAttributedString *mutableAttributedString;

@end
