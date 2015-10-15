//
//  AppDelegate.h
//  Sample
//
//  Created by TEJA on 03/06/15.
//  Copyright (c) 2015 Satya Swaroop. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VSWordDetector.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) VSWordDetector *wordDict;

@end

