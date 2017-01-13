//
//  NSString+CategoryMethods.h
//  常用方法集合
//
//  Created by WOSHIPM on 17/1/13.
//  Copyright © 2017年 WOSHIPM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CategoryMethods)
- (NSString *)base64;
- (NSString *)urlCode;
- (BOOL)isAlphaNum;
- (BOOL)isChinese;
- (BOOL)isValidateEmail:(NSString *)email;
+ (BOOL)isPureInt:(NSString*)string;
- (BOOL)isPureNumandCharacters:(NSString *)string;
- (BOOL)isMobileNumber:(NSString *)mobileNum ;
-(NSString *)getDateStringWithTimeInterval:(NSString *)timeInterval DataFormatterString:(NSString *)dataFormatterString;
-(double)getTimeIntervalWithDateString:(NSString *)dateString DataFormatterString:(NSString *)dataFormatterString;
@end
