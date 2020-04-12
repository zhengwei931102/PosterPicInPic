//
//  MoveView.h
//  PosterPicInPic
//
//  Created by zw on 2020/4/12.
//  Copyright © 2020 zw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BigPreviewImageView.h"
#import "ImageMoveView.h"
NS_ASSUME_NONNULL_BEGIN

@interface MoveView : UIView
@property (nonatomic,retain) BigPreviewImageView *bigPreviewImageView;
@property (nonatomic,retain) ImageMoveView *imageMoveView;
@end

NS_ASSUME_NONNULL_END
