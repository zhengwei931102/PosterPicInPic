//
//  PIPCollectionViewCell.h
//  PosterPicInPic
//
//  Created by zw on 2020/4/7.
//  Copyright © 2020 zw. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PIPCollectionViewCell : UICollectionViewCell
+ (NSString *)cellIdentifier;
- (void)render:(NSString *)name;
@end

NS_ASSUME_NONNULL_END

