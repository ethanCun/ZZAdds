//
//  UIImage+ZZAdds.m
//  demo
//
//  Created by Cun ethan on 2019/7/25.
//  Copyright © 2019 Cun ethan. All rights reserved.
//

#import "UIImage+ZZAdds.h"

@implementation UIImage (ZZAdds)

- (UIImage *)imageWithColor:(UIColor *)color
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, self.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextClipToMask(context, rect, self.CGImage);
    [color setFill];
    CGContextFillRect(context, rect);
    UIImage*newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (UIImage*)imageWithColor:(UIColor*)color
{
    CGRect rect=CGRectMake(0.0f,0.0f,1.0f,1.0f);
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context=UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return theImage;
}

+ (UIImage *)getImageFromURL:(NSString *)fileURL
{
    if (!fileURL) {
        return nil;
    }
    
    UIImage * result;
    
    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:fileURL]];
    
    result = [UIImage imageWithData:data];
    
    return result;
}

/**
 根据url计算图片实际高度 宽度为屏幕款
 */
+ (double)imageHeightWithUrl:(NSString *)url{
    
    if (url == nil || [url isEqualToString:@""]) {
        return 0;
    }
    
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    
    UIImage *image = [UIImage imageWithData:imageData];
    
    if (image == nil) {
        
        return 0;
    }else{
        return [UIScreen mainScreen].bounds.size.width *image.size.height/image.size.width;
    }
}

+ (UIImage *)imageWithName:(NSString *)name inBundle:(NSString *)bundleName type:(NSString *)type resourcePath:(NSString *)resourcePath
{
    NSString *path = [[NSBundle mainBundle] pathForResource:bundleName ofType:type];
    
    NSBundle *bundle = [NSBundle bundleWithPath:[NSString stringWithFormat:@"%@/%@", path, resourcePath]];
    
   return [UIImage imageNamed:name inBundle:bundle compatibleWithTraitCollection:nil];
}

@end
