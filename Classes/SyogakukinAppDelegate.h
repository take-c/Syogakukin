//
//  SyogakukinAppDelegate.h
//  Syogakukin
//
//  Created by 岡田 健 on 10/12/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SyogakukinViewController;

@interface SyogakukinAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    SyogakukinViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SyogakukinViewController *viewController;

@end

