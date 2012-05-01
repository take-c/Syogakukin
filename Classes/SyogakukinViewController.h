//
//  SyogakukinViewController.h
//  Syogakukin
//
//  Created by 岡田 健 on 10/12/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SyogakukinViewController
: UIViewController {
	IBOutlet UILabel *displayRemainPrice;//残金表示欄
	IBOutlet UILabel *displayTotalPrice;//総額表示欄	
	IBOutlet UIImageView *displayGraph;//グラフ表示
}

@end

