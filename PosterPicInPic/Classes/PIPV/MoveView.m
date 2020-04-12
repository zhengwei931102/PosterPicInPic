//
//  MoveView.m
//  PosterPicInPic
//
//  Created by zw on 2020/4/12.
//  Copyright © 2020 zw. All rights reserved.
//

#import "MoveView.h"

@implementation MoveView

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        self.clipsToBounds = YES;
        self.bigPreviewImageView = [[BigPreviewImageView alloc] initWithFrame:self.bounds];
        [self addSubview:self.bigPreviewImageView];
        UIRotationGestureRecognizer *rotateGes = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotateImage:)];
        [self addGestureRecognizer:rotateGes];
        UIPinchGestureRecognizer *scaleGes = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(scaleImage:)];
        [self addGestureRecognizer:scaleGes];
        UIPanGestureRecognizer *moveGes = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveImage:)];
        [moveGes setMinimumNumberOfTouches:1];
        [moveGes setMaximumNumberOfTouches:1];
        [self addGestureRecognizer:moveGes];
        self.imageMoveView = [[ImageMoveView alloc] initWithFrame:self.bounds];
        self.imageMoveView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:self.imageMoveView];
        [self bringSubviewToFront:self.bigPreviewImageView];
    }
    return self;
}
#pragma mark 图片放大缩小
- (void)moveImage:(UIPanGestureRecognizer *)sender{
    [self.imageMoveView moveImage:sender];
}
- (void)scaleImage:(UIPinchGestureRecognizer *)sender{
    [self.imageMoveView scaleImage:sender];
}
- (void)rotateImage:(UIRotationGestureRecognizer *)sender{
    [self.imageMoveView rotateImage:sender];
}
@end
