//
//  ImageMoveView.h
//  PosterPicInPic
//
//  Created by zw on 2020/4/12.
//  Copyright © 2020 zw. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageMoveView : UIImageView
- (void)moveImage:(UIPanGestureRecognizer *)sender;
- (void)scaleImage:(UIPinchGestureRecognizer *)sender;
- (void)rotateImage:(UIRotationGestureRecognizer *)sender;
@end

NS_ASSUME_NONNULL_END
