//
//  Book.m
//  BookManager
//
//  Created by SuperMan on 16/5/13.
//  Copyright © 2016年 SuperMan. All rights reserved.
//

#import "Book.h"

@implementation Book

- (instancetype)initWithID:(NSString *)bookID name:(NSString *)bookName publishHouse:(NSString *)bookPH author:(NSString *)bookAuthor saveDate:(NSDate *)date introducation:(NSString *)bookIntroducation {
    if (self = [super init]) {
        _bookID = bookID;
        _name = bookName;
        _publishHouse = bookPH;
        _author = bookAuthor;
        _introducation = bookIntroducation;
        _saveDate = date;
        _favorite = 0;
    }
    
    return self;
}


@end
