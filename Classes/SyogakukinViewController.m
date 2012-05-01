//
//  SyogakukinViewController.m
//  Syogakukin
//
//  Created by 岡田 健 on 10/12/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "SyogakukinViewController.h"

@implementation SyogakukinViewController



/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


// Implement loadView to create a view hierarchy programmatically, without using a nib.
/*- (void)loadView {
	num = 123;
	display.text = [NSString stringWithFormat:@"%d", num];
}*/


/*
 値段から、表記方式(万　円)に変換する
 */
- (id)convertToStrFromPrice:(int)iPrice{
	int iMan  = iPrice / 10000; //万の桁
	int iIchi = iPrice % 10000; //一の桁
	id strFixedPrice = [NSString stringWithFormat:@"%d万 %d円",iMan,iIchi];
	return strFixedPrice;
}

/*
 iRemain:残りの額、iPaid:払った額
 より、グラフを作成する
 */
- (void)showMyImage:(int)iRemain:(int)iPaid{
	
	float fRemain = (float) iRemain;
	float fPaid = (float) iPaid;
	float fRateRemain = (fRemain/(fPaid+fRemain));
	fRateRemain = fRateRemain * 100.0;
	int iPerRemain = (int) fRateRemain;//残りの額の％
	int iPerPaid = 100 - iPerRemain;//払った額の％
	//	NSLog(@"払った額： %d ％", iPerPaid);
	//	NSLog(@"残りの額： %d ％", iPerRemain);
	
	NSString *strUrl=@"https://chart.googleapis.com/";
	NSString *strFullUrl=[NSString stringWithFormat:@"%@chart?cht=p3&chd=t:%d,%d&chs=250x100&chl=払った|残り",strUrl,iPerPaid,iPerRemain];
	NSString *strFixedUrl=[strFullUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:strFixedUrl]];

	UIImage *myimage = [[UIImage alloc] initWithData:imageData];
	displayGraph.image=myimage;
}

/*
 奨学金　返還残額を表示する
 */
- (void)showPrice {
	
	int iTotalPrice = 1883540; //返還総額
	int iBasePrice = 12230; //毎月の返還額
	int iPaidPrice = 0; //返還済みの金額
	int iRemainPrice = iTotalPrice; //返還残額
	
	NSDate *dtNowDate = [[NSDate date] retain]; //現在時刻
	
	//第一回目の振替は2007年10月27日
	NSString *stBaseDate = @"2007/10/9";//返還を開始した日付
	
	// NSDateFormatterのインスタンスを取得
	NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateFormat:@"yyyy/MM/dd"];
	
	NSString *stNowDate = [dateFormatter stringFromDate:dtNowDate];
	
	NSArray *aNowDate = [stNowDate componentsSeparatedByString:@"/"];
	NSArray *aBaseDate = [stBaseDate componentsSeparatedByString:@"/"];
	id stNowYear = [aNowDate objectAtIndex:0];
	id stNowMonth = [aNowDate objectAtIndex:1];
	id stNowDay = [aNowDate objectAtIndex:2];
	id stBaseYear = [aBaseDate objectAtIndex:0];
	id stBaseMonth = [aBaseDate objectAtIndex:1];
	id stBaseDay = [aBaseDate objectAtIndex:2];
	int iNowYear = [stNowYear intValue];
	int iNowMonth = [stNowMonth intValue];
	int iNowDay = [stNowDay intValue];
	int iBaseYear = [stBaseYear intValue];
	int iBaseMonth = [stBaseMonth intValue];
	int iBaseDay = [stBaseDay intValue];
	int iDiffMonth = (((12 * iNowYear) + iNowMonth) - ((12 * iBaseYear) + iBaseMonth)+1);
	int iDiffDay = iNowDay - iBaseDay;
	if (iDiffDay < 0) iDiffMonth--;
	iPaidPrice = iBasePrice * iDiffMonth;
	
	iRemainPrice = iTotalPrice - iPaidPrice;
	
    id strFixedRemainPrice = [self convertToStrFromPrice:iRemainPrice];//残金をintから表示形式に変換
    id strFixedTotalPrice = [self convertToStrFromPrice:iTotalPrice];//総額をintから表示形式に変換
	/*
	NSLog(@"基準日： %d/%d/%d ", iBaseYear,iBaseMonth,iBaseDay);
	NSLog(@"今日： %d/%d/%d ", iNowYear,iNowMonth,iNowDay);
	NSLog(@"日差分： %d日", iDiffDay);
	NSLog(@"月差分(iDiffMonth)： %d月", iDiffMonth);
*/
	displayRemainPrice.text =[NSString stringWithFormat:@"たったの %@ だぜ！",strFixedRemainPrice];//残金表示
	displayTotalPrice.text =[NSString stringWithFormat:@"（総額 %@ ）",strFixedTotalPrice];//総額表示
	
	[self showMyImage:iRemainPrice:iPaidPrice];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	[self showPrice];
}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void)dealloc {
    [super dealloc];
}

@end