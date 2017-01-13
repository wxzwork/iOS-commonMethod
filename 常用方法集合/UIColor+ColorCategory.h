//
//  UIColor+ColorCategory.h
//  常用方法集合
//
//  Created by WOSHIPM on 17/1/13.
//  Copyright © 2017年 WOSHIPM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ColorCategory)
+ (UIColor *)colorWithHex: (NSString *)color;
+ (UIColor *)colorWithHex: (NSString *)color alpha:(CGFloat)alpha;
@end
