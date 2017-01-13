//
//  UITextField+LimitTextLength.h
//  常用方法集合
//
//  Created by WOSHIPM on 17/1/13.
//  Copyright © 2017年 WOSHIPM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (LimitTextLength)
-(void)limitTextLength:(NSInteger)length TextField:(UITextField *)textfield;
@end
