//
//  PIPCollectionView.m
//  PosterPicInPic
//
//  Created by zw on 2020/4/7.
//  Copyright © 2020 zw. All rights reserved.
//

#import "PIPCollectionView.h"
#import "PIPCollectionViewCell.h"
@implementation PIPCollectionView

-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    ZLCollectionViewHorzontalLayout *flowLayout = (ZLCollectionViewHorzontalLayout *)layout;
    flowLayout = [[ZLCollectionViewHorzontalLayout alloc] init];
    flowLayout.delegate = self;
    flowLayout.canDrag = NO;
    flowLayout.header_suspension = NO;
    self = [super initWithFrame:frame collectionViewLayout:flowLayout];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
        self.bounces = NO;
        self.showsHorizontalScrollIndicator = NO;
        [self registerClass:[PIPCollectionViewCell class] forCellWithReuseIdentifier:[PIPCollectionViewCell cellIdentifier]];
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.netArr.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *imgName = self.netArr[indexPath.item];
    PIPCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[PIPCollectionViewCell cellIdentifier] forIndexPath:indexPath];
    [cell render:imgName];
    return cell;
    
}

- (ZLLayoutType)collectionView:(UICollectionView *)collectionView layout:(ZLCollectionViewBaseFlowLayout *)collectionViewLayout typeOfLayout:(NSInteger)section {
    return ColumnLayout;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView layout:(ZLCollectionViewBaseFlowLayout *)collectionViewLayout columnCountOfSection:(NSInteger)section {
    return 1;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(ZLCollectionViewBaseFlowLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(100, Fit3XSizeH(60));
    
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(ZLCollectionViewBaseFlowLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return Fit3XSizeW(10);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(ZLCollectionViewBaseFlowLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return Fit3XSizeW(10);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(ZLCollectionViewBaseFlowLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return  UIEdgeInsetsMake(Fit3XSizeH(15), Fit3XSizeW(15), Fit3XSizeH(15), Fit3XSizeW(15));
}
#pragma mark 点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *imgStr = self.netArr[indexPath.item];
    if ([self.pipDelegate respondsToSelector:@selector(itemSelected:)]) {
        [self.pipDelegate itemSelected:imgStr];
    }
}


@end
