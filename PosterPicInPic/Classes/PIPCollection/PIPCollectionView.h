//
//  PIPCollectionView.h
//  PosterPicInPic
//
//  Created by zw on 2020/4/7.
//  Copyright © 2020 zw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLCollectionViewHorzontalLayout.h"
#import "UICollectionView+ARDynamicCacheHeightLayoutCell.h"
NS_ASSUME_NONNULL_BEGIN
@protocol PIPCollectionViewDelegate <NSObject>

- (void)itemSelected:(NSString *)imgStr;

@end
@interface PIPCollectionView : UICollectionView<UICollectionViewDelegate,UICollectionViewDataSource,ZLCollectionViewBaseFlowLayoutDelegate>
@property (nonatomic,retain)NSArray *netArr;
@property (nonatomic,assign)id <PIPCollectionViewDelegate> pipDelegate;
@end

NS_ASSUME_NONNULL_END
