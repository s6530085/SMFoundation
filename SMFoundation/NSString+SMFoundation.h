//
//  NSString+SMFoundation.h
//  SMFoundation
//
//  Created by study_sun on 15/1/29.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (SMFoundation)

- (instancetype)md5String;

- (BOOL)isEmptyAfterTrimmingWhitespaceAndNewlineCharacters;
- (NSString *)stringByTrimmingWhitespaceAndNewlineCharacters;

// 是否是邮箱
- (BOOL)conformsToEMailFormat;
// 是否是手机号，仅限中国
- (BOOL)conformsToMobileFormat;
// 长度是否在一个范围之内,包括范围值
- (BOOL)isLengthGreaterThanOrEqual:(NSInteger)minimum lessThanOrEqual:(NSInteger)maximum;
//验证车牌号
- (BOOL)isMatchedByRegex:(NSString *)regex;

- (NSRange)firstRangeOfURLSubstring;
- (NSString *)firstURLSubstring;
- (NSArray *)URLSubstrings;
- (NSString *)firstMatchUsingRegularExpression:(NSRegularExpression *)regularExpression;
- (NSString *)firstMatchUsingRegularExpressionPattern:(NSString *)regularExpressionPattern;
// 注意这个是全文匹配,而且默认已经是不区分大小写的
- (BOOL)matchesRegularExpressionPattern:(NSString *)regularExpressionPattern;
- (NSRange)rangeOfFirstMatchUsingRegularExpressionPattern:(NSString *)regularExpressionPattern;

- (NSString *)stringByReplacingMatchesUsingRegularExpressionPattern:(NSString *)regularExpressionPattern withTemplate:(NSString *)templ;

- (NSDictionary *)URLParameters;
+ (NSString *)stringWithDate:(NSDate *)date dateFormat:(NSString *)format;

- (NSInteger)numberOfDigits;

- (NSString *)urlEncoding;
- (NSString *)URLEncodedString;


- (NSString *)substringToMaxIndex:(NSInteger)index;
// 差不多就是做那种取五个中文或10个英文的
- (NSString *)substringToMaxAlphaCount:(NSInteger)count;

// iOS7出了新的计算字符大小的方法，这里封装一下顺便少写一些参数,当然也只能算出一行的,特别需要注意的是这里返回的数值在iOS7以后一般是浮点数，如果需要整形请自行处理
- (CGFloat)singleLineWidthWithFont:(UIFont *)font;
- (CGFloat)heightWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width;
- (CGSize)sizeWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width;
- (NSAttributedString *)attributeStringWithFont:(UIFont *)font lineSpacing:(CGFloat)lineSpacing;
- (CGFloat)heightWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width lineSpacing:(CGFloat)lineSpacing;
- (NSRange)fullRange;
- (NSString *)stringByLeftTrimWithFlag:(NSString *)flag;
- (NSString *)stringByReplaceWhiteSpace;
- (NSString *)stringByReplaceFlag:(NSString *)flag;

@end


