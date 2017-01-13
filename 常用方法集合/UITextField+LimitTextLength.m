//
//  UITextField+LimitTextLength.m
//  常用方法集合
//
//  Created by WOSHIPM on 17/1/13.
//  Copyright © 2017年 WOSHIPM. All rights reserved.
//

#import "UITextField+LimitTextLength.h"

@implementation UITextField (LimitTextLength)

-(void)limitTextLength:(NSInteger)length TextField:(UITextField *)textfield{
    NSString *toBeString = textfield.text;
    NSString *lang = self.textInputMode.primaryLanguage;
    if ([lang isEqualToString:@"zh-Hans"]) {
        UITextRange *selectedRang = [textfield markedTextRange];
        if (!selectedRang) {
            if (toBeString.length > length) {
                textfield.text = [toBeString substringToIndex:length];
            }
        }else{
            
        }
        
    }
    else{
        if (toBeString.length > length) {
            textfield.text = [toBeString substringToIndex:length];
        }
    }
    
}

@end
