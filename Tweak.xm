#import <UIKit/UIKit.h>
#import "UIImageanimatedGIF.h"

#define gifPathURL @"/Library/Application Support/GifTest/patrick.gif"

UIView *gifView;
UIImageView *gifImageView;

%hook SBDashBoardMainPageView
-(void)layoutSubviews {
	%orig;
	CGRect gifViewRect = CGRectMake (100, 200, 100, 150);
	gifView = [[UIView alloc] initWithFrame:gifViewRect];
	gifView.backgroundColor = [UIColor clearColor];
	[self addSubview:gifView];
	[self sendSubviewToBack:gifView];
	
           gifImageView = [[UIImageView alloc] initWithFrame:gifView.bounds];	
           NSURL *gifImagePath = [NSURL fileURLWithPath:[NSString stringWithFormat:gifPathURL]];
           gifImageView.image = [UIImage animatedImageWithAnimatedGIFData:[NSData dataWithContentsOfURL:gifImagePath]];
           gifImageView.image = [UIImage animatedImageWithAnimatedGIFURL:gifImagePath];
           [gifView addSubview:gifImageView];
            
}
%end
