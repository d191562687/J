//
//  BookManager.m
//  BookManager
//
//  Created by SuperMan on 16/5/13.
//  Copyright © 2016年 SuperMan. All rights reserved.
//

#import "BookManager.h"
#import "DataBase.h"
#import "Macros.h"
#import "SVProgressHUD.h"

@implementation BookManager

//单例 (可以使用GCD或者普通单例方式)
+ (BookManager *)sharedManager
{
    static BookManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[BookManager alloc] init];
    });
    
    return sharedManager;
}

//从数据库搜索结果中取出value生成Book对象
- (Book *)bookFromResultSet:(id<PLResultSet>)rs {
    NSString *ID = [rs stringForColumn:@"ID"];
    NSString *name = [rs stringForColumn:@"Name"];
    NSString *author = [rs stringForColumn:@"Author"];
    NSString *publishHouse = [rs stringForColumn:@"PublishHouse"];
    NSString *dateString = [rs stringForColumn:@"Date"];
    NSString *introducation = [rs objectForColumn:@"Introducation"];
    BOOL fav = [[rs stringForColumn:@"Favorite"] boolValue];

    NSDate *saveDate = nil;
    if (IsAvailableString(dateString)) {
        NSDateFormatter * dateFormatter =[[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        saveDate = [dateFormatter dateFromString:dateString];
    }
    
    Book *book = [[Book alloc] initWithID:ID name:name publishHouse:publishHouse author:author saveDate:saveDate introducation:introducation];
    book.favorite = fav;
    return book;
}

//查找数据库Book表中所有数据
- (NSArray *)findAllBooks {
    PLSqliteDatabase *dataBase = [DataBase setup];
    
    id<PLResultSet> rs;
    //数据库查找语句 SELECT *
    rs = [dataBase executeQuery:@"SELECT * FROM Book"];
    
    NSMutableArray *booksArray = [[NSMutableArray alloc] init];
    
    //把rs中的数据库信息遍历到books数组
    while ([rs next]) {
        Book *oneBook = [self bookFromResultSet:rs];
        if (oneBook) {
            [booksArray addObject:oneBook];
        }
    }
    //关闭数据库
    [rs close];
    
    return booksArray;
}

//根据ID搜索相关书籍的
- (NSArray *)findBook:(NSUInteger)ID {
    PLSqliteDatabase *dataBase = [DataBase setup];
    
    id<PLResultSet> rs;
    //数据库匹配查找语句 WHERE
    NSString *findSql = [NSString stringWithFormat:@"select * FROM Book WHERE ID = %d",ID];
    rs = [dataBase executeQuery:findSql];
    
    NSMutableArray *booksArray = [[NSMutableArray alloc] init];
    
    if([rs next]) {
        Book *oneBook = [self bookFromResultSet:rs];
        if (oneBook) {
            [booksArray addObject:oneBook];
        }
    }else {
        [SVProgressHUD showInfoWithStatus:@"Not Found"];
    }
    
    [rs close];
    
    return booksArray;
}

//根据ID查找数据，只会有一条存在
- (Book *)findBookWithID:(NSUInteger)ID {
    PLSqliteDatabase *dataBase = [DataBase setup];
    
    id<PLResultSet> rs;
    //数据库匹配查找语句 WHERE
    NSString *findSql = [NSString stringWithFormat:@"select * FROM Book WHERE ID = %d",ID];
    rs = [dataBase executeQuery:findSql];
    
    Book *book = nil;

    if([rs next]) {
        Book *oneBook = [self bookFromResultSet:rs];
        book = oneBook;
    }else {
        [SVProgressHUD showInfoWithStatus:@"Not Found"];
    }
    
    [rs close];
    
    return book;
}

//根据name查找数据，可能会有多条
- (NSArray *)findBookWithName:(NSString *)name {
    PLSqliteDatabase *dataBase = [DataBase setup];
    
    id<PLResultSet> rs;
    //数据库匹配查找语句 WHERE
    NSString *findSql = [NSString stringWithFormat:@"select * FROM Book WHERE NAME = %@",name];
    rs = [dataBase executeQuery:findSql];
    
    NSMutableArray *booksArray = [[NSMutableArray alloc] init];
    
    if([rs next]) {
        Book *oneBook = [self bookFromResultSet:rs];
        if (oneBook) {
            [booksArray addObject:oneBook];
        }
    }else {
        [SVProgressHUD showInfoWithStatus:@"Not Found"];
    }
    
    [rs close];
    
    return booksArray;
}

//查询当前数据库保存的数据数量
- (NSUInteger)bookCount {
    PLSqliteDatabase *dataBase = [DataBase setup];
    
    id<PLResultSet>rs;
    rs = [dataBase executeQuery:@"SELECT COUNT(*) AS EventCount FROM Event"];
    
    NSUInteger count = 0;
    if ([rs next]) {
        count = [[rs objectForColumn:@"BookCount"] integerValue];
    }
    
    [rs close];
    
    return count;
}

//创建新书籍的方法
- (BOOL)addBook:(Book *)oneBook {
    PLSqliteDatabase *dataBase = [DataBase setup];
    
    NSDateFormatter * dateFormatter =[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateString = [dateFormatter stringFromDate:oneBook.saveDate];
    
    NSString *fav = [NSString stringWithFormat:@"%d",oneBook.favorite];
    
    BOOL result = [dataBase executeUpdate: @"INSERT INTO Book (ID, Name, PublishHouse, Author, Introducation, Date, Favorite) VALUES (?,?,?,?,?,?,?)",
                   oneBook.bookID,
                   oneBook.name,
                   oneBook.publishHouse,
                   oneBook.author,
                   oneBook.introducation,
                   dateString,
                   fav];
    
    return result;
}

//修改某一本书籍的方法
- (BOOL)editBook:(Book *)oneBook {
    PLSqliteDatabase *dataBase = [DataBase setup];

    
    NSString *fav = [NSString stringWithFormat:@"%d",oneBook.favorite];

    BOOL result = [dataBase executeUpdate: @"UPDATE Book SET favorite = ? WHERE ID = ?",
                   fav,
                   oneBook.bookID];
    
    return result;
}

- (BOOL)deleteBook:(Book *)oneBook {
    PLSqliteDatabase *dataBase = [DataBase setup];
    
    BOOL result = [dataBase executeUpdate:@"DELETE FROM Book WHERE ID = ?",
                    oneBook.bookID];
    
    return result;
}

@end
