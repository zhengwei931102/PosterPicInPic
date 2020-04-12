//
//  ViewController.m
//  PosterPicInPic
//
//  Created by zw on 2020/4/3.
//  Copyright © 2020 zw. All rights reserved.
//

#import "ViewController.h"
#import "MoveView.h"
@interface ViewController ()<PIPCollectionViewDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
{
    NSMutableArray *mutableArray;
    MoveView *moveView;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    mutableArray = [[NSMutableArray alloc] init];
    // Do any additional setup after loading the view.
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    PIPCollectionView *collectionView = [[PIPCollectionView alloc] initWithFrame:CGRectMake(0, HEIGHT-HOME_INDICATOR_HEIGHT-Fit3XSizeH(60)-Fit3XSizeH(40), WIDTH, Fit3XSizeH(60)) collectionViewLayout:flowLayout];
    collectionView.pipDelegate = self;
    [self.view addSubview:collectionView];
    [mutableArray addObject:@"1.jpg"];
    [mutableArray addObject:@"2.gif"];
    [mutableArray addObject:@"3.jpg"];
    [mutableArray addObject:@"4.jpg"];
    [mutableArray addObject:@"5.jpg"];
    [mutableArray addObject:@"6.jpg"];
    [mutableArray addObject:@"7.jpg"];
    [mutableArray addObject:@"8.png"];
    collectionView.netArr = [mutableArray copy];
    [collectionView reloadData];
    //可移动视图
    moveView = [[MoveView alloc] initWithFrame:CGRectMake(0, STATUS_BAR_HEIGHT, WIDTH, CGRectGetMinY(collectionView.frame)-STATUS_BAR_HEIGHT)];
    [self.view addSubview:moveView];
    //保存海报照片
    UIButton *saveBtn = [ZWViewControls buttonCreateWithFrame:CGRectMake(0, HEIGHT-HOME_INDICATOR_HEIGHT-Fit3XSizeH(25), Fit3XSizeW(100), Fit3XSizeH(25)) Title:@"保存" Font:15 IsBold:YES TitleColor:[UIColor redColor] TitleSelectColor:[UIColor redColor] ImageName:nil Target:self Action:@selector(save)];
    [self.view addSubview:saveBtn];
    //选取照片
    UIButton *selectBtn = [ZWViewControls buttonCreateWithFrame:CGRectMake(WIDTH-Fit3XSizeW(100), HEIGHT-HOME_INDICATOR_HEIGHT-Fit3XSizeH(25), Fit3XSizeW(100), Fit3XSizeH(25)) Title:@"选取" Font:15 IsBold:YES TitleColor:[UIColor redColor] TitleSelectColor:[UIColor redColor] ImageName:nil Target:self Action:@selector(select)];
    [self.view addSubview:selectBtn];

}
#pragma mark PIPCollectionViewDelegate
- (void)itemSelected:(NSString *)imgStr{
    moveView.bigPreviewImageView.image = kImage(imgStr);
}
#pragma mark 保存相册
- (void)save{
    UIImageWriteToSavedPhotosAlbum([self openglSnapshotImage], self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}
- (UIImage *)openglSnapshotImage{
    UIGraphicsBeginImageContextWithOptions(moveView.frame.size, NO, [UIScreen mainScreen].scale);
    [moveView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snapshotImage;
}
///保存图片完成之后的回调
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    // Was there an error?
    if (error != NULL)
    {
        // Show error message
        
    }
    else  // No errors
    {
        // Show message image successfully saved
        
        
    }
}
#pragma mark 选取照片
- (void)select{
    [LEEAlert actionsheet].config
    .LeeTitle(@"选取照片")
    .LeeAction(@"拍照", ^{
        [self selectPhotoWithType:0];
    })
    .LeeAction(@"从相册获取", ^{
        [self selectPhotoWithType:1];
    })
    .LeeCancelAction(@"取消",nil)
    .LeeShow();
}
-(void)selectPhotoWithType:(int)type {
    UIImagePickerController *ipVC = [[UIImagePickerController alloc] init];
    //设置跳转方式
    ipVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    //设置是否可对图片进行编辑
    ipVC.allowsEditing = YES;
    ipVC.delegate = self;
    if (type == 0) {
        NSLog(@"相机");
        BOOL isCamera = [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
        if (!isCamera) {
            NSLog(@"没有摄像头");
            return;
        }else{
            ipVC.sourceType = UIImagePickerControllerSourceTypeCamera;
            
        }
        
    }else{
        NSLog(@"相册");
        ipVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    ipVC.modalPresentationStyle =  UIModalPresentationFullScreen;
    [self presentViewController:ipVC animated:YES completion:nil];
    
}
#pragma mark imagePickerController协议方法

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    NSLog(@"info = %@",info);
    UIImage *image = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    if (image == nil) {
        image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        
    }
    //图片旋转
    if (image.imageOrientation != UIImageOrientationUp) {
        image = [self fixOrientation:image];
        
    }
    [self dismissViewControllerAnimated:YES completion:nil];
    //更换图片
    moveView.imageMoveView.image = image;
    moveView.imageMoveView.contentMode = UIViewContentModeScaleAspectFit;
}
#pragma mark 图片旋转处理
- (UIImage *)fixOrientation:(UIImage *)aImage {
    CGAffineTransform transform = CGAffineTransformIdentity;
    switch (aImage.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, aImage.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, aImage.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        default:
            break;
            
    }
    switch (aImage.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        default:
            break;
            
    }
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, aImage.size.width,aImage.size.height,CGImageGetBitsPerComponent(aImage.CGImage), 0,CGImageGetColorSpace(aImage.CGImage),CGImageGetBitmapInfo(aImage.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (aImage.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.height,aImage.size.width), aImage.CGImage);
            break;
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.width,aImage.size.height), aImage.CGImage);
            break;
            
    }
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
    
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
