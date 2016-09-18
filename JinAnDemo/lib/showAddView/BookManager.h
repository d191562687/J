//
//  BookManager.h
//  BookManager
//
//  Created by SuperMan on 16/5/13.
//  Copyright © 2016年 SuperMan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"

@interface BookManager : NSObject

+ (BookManager *)sharedManager;

- (NSUInteger)bookCount;

- (NSArray *)findAllBooks;

- (Book *)findBookWithID:(NSUInteger)ID;

- (NSArray *)findBookWithName:(NSString *)name;

- (BOOL)addBook:(Book *)oneBook;

- (BOOL)editBook:(Book *)oneBook;

- (BOOL)deleteBook:(Book *)oneBook;


@end
