//
//  PIPCollectionViewCell.m
//  PosterPicInPic
//
//  Created by zw on 2020/4/7.
//  Copyright © 2020 zw. All rights reserved.
//

#import "PIPCollectionViewCell.h"
@interface PIPCollectionViewCell()
{
    UIImageView *imv;
}
@end

@implementation PIPCollectionViewCell
+ (NSString *)cellIdentifier {
    return @"PIPCollectionViewCell";
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = kColorClear;
        imv = [ZWViewControls imageViewCreateViewWithFrame:CGRectMake(0, 0, self.contentView.width, self.contentView.height) ImageName:@""];
        imv.userInteractionEnabled = YES;
        imv.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:imv];
        
        
    }
    return self;
}
- (void)render:(NSString *)name{
    [imv sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:kImage(name)];
}
@end
