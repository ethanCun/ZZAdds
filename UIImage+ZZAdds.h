//
//  UIImage+ZZAdds.h
//  demo
//
//  Created by Cun ethan on 2019/7/25.
//  Copyright © 2019 Cun ethan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (ZZAdds)

/**
 改变图片颜色
 */
- (UIImage *)imageWithColor:(UIColor *)color;

/**
 颜色转图片
 */
+ (UIImage*)imageWithColor:(UIColor*)color;

/**
 URL转UIImage
 */
+ (UIImage *)getImageFromURL:(NSString *)fileURL;

/**
 根据url计算图片实际高度 宽度为屏幕款
 */
+ (double)imageHeightWithUrl:(NSString *)url;

/**
 加载指定bundle下的图片
 bundle:项目路径下的bundle名称
 type:"bundle"
 resource:指定bundle下的图片文件夹名称
 */
+ (UIImage *)imageWithName:(NSString *)name inBundle:(NSString *)bundleName type:(NSString *)type resourcePath:(NSString *)resourcePath;

@end

NS_ASSUME_NONNULL_END
