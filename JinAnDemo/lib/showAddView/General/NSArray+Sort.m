//
//  NSArray+Sort.m
// https://github.com/hackiftekhar/IQKeyboardManager
// Copyright (c) 2013-14 Iftekhar Qurashi.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "NSArray+Sort.h"
#import "Book.h"

#import <UIKit/UIView.h>

#import "IQKeyboardManagerConstantsInternal.h"

#import "PinYin4Objc.h"
#import "pinyin.h"
#import "ChineseToPinyin.h"

//IQ_LoadCategory(IQNSArraySort)


@implementation NSArray (Sort)

- (NSArray*)sortedArrayByTag
{
    return [self sortedArrayUsingComparator:^NSComparisonResult(UIView *obj1, UIView *obj2) {
        
        if ([obj1 respondsToSelector:@selector(tag)] && [obj2 respondsToSelector:@selector(tag)])
        {
            if ([obj1 tag] < [obj2 tag])	return NSOrderedAscending;
            
            else if ([obj1 tag] > [obj2 tag])	return NSOrderedDescending;
            
            else	return NSOrderedSame;
        }
        else
            return NSOrderedSame;
    }];
}

- (NSArray *) filterContentForText:(NSString *)text{
    NSMutableArray *tempResults = [NSMutableArray array];
    
    for (int i = 0; i < self.count; i++) {
        id obj = [self objectAtIndex:i];
        if ([obj isKindOfClass:[NSString class]]) {
            NSString *contentString = obj;
            if ([self containsString:text inString:contentString]) {
                [tempResults addObject:contentString];
            }

        }else if([obj isKindOfClass:[NSArray class]]) {
            NSArray *contentArray = obj;
            for (int j = 0; j < contentArray.count; j++) {
                id jObj = [contentArray objectAtIndex:j];
                if ([jObj isKindOfClass:[NSString class]]) {
                    NSString *contentString = jObj;
                    if ([self containsString:text inString:contentString]) {
                        [tempResults addObject:contentString];
                    }
                }else if ([jObj isKindOfClass:[NSDictionary class]]) {
                    NSString *contentString = [jObj objectForKey:@"name"];
                    if ([self containsString:text inString:contentString]) {
                        [tempResults addObject:jObj];
                    }
                }
            }
        }else if([obj isKindOfClass:[NSDictionary class]]) {
            NSDictionary *contentDictionary = obj;
            NSString *contentString = [contentDictionary objectForKey:@"title"];
            if ([self containsString:text inString:contentString]) {
                [tempResults addObject:contentString];
            }
        }else if([obj isKindOfClass:[Book class]]) {
            Book *book = obj;
            if ([self containsString:text inString:book.name]) {
                [tempResults addObject:book];
            }
        }
    }

    return tempResults;
}

- (BOOL)containsString:(NSString *)text inString:(NSString *)contentString{
    NSUInteger searchOptions = NSCaseInsensitiveSearch | NSDiacriticInsensitiveSearch;

    NSString *firstLetterName = [self namToPinYinFirstNameWith:contentString];
    NSString *pinyinName = [ChineseToPinyin pinyinFromChiniseString:contentString];
    
    NSRange storeRange1 = NSMakeRange(0, contentString.length);
    NSRange storeRange2 = NSMakeRange(0, firstLetterName.length);
    NSRange storeRange3 = NSMakeRange(0, pinyinName.length);
    
    NSRange foundRange1 = [contentString rangeOfString:text options:searchOptions range:storeRange1];
    NSRange foundRange2 = [firstLetterName rangeOfString:text options:searchOptions range:storeRange2];
    NSRange foundRange3 = [pinyinName rangeOfString:text options:searchOptions range:storeRange3];
    
    if (foundRange1.length || foundRange2.length || foundRange3.length) {
        return YES;
    }else {
        return NO;
    }
}

-(NSString *)nameToPinYinWith:(NSString *)name
{
    HanyuPinyinOutputFormat *outputFormat=[[HanyuPinyinOutputFormat alloc] init];
    [outputFormat setToneType:ToneTypeWithoutTone];
    [outputFormat setVCharType:VCharTypeWithV];
    [outputFormat setCaseType:CaseTypeLowercase];
    NSString *outputPinyin=[PinyinHelper toHanyuPinyinStringWithNSString:name withHanyuPinyinOutputFormat:outputFormat withNSString:@""];
    return outputPinyin;
}

-(NSString *)namToPinYinFirstNameWith:(NSString *)name
{
    NSString * outputString = @"";
    for (int i =0; i<[name length]; i++) {
        outputString = [NSString stringWithFormat:@"%@%c",outputString,pinyinFirstLetter([name characterAtIndex:i])];
    }
    return outputString;
}



@end
