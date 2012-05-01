//
//  SyogakukinAppDelegate.m
//  Syogakukin
//
//  Created by 岡田 健 on 10/12/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "SyogakukinAppDelegate.h"
#import "SyogakukinViewController.h"

@implementation SyogakukinAppDelegate

@synthesize window;
@synthesize viewController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
