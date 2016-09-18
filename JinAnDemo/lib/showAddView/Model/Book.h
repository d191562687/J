//
//  Book.h
//  BookManager
//
//  Created by SuperMan on 16/5/13.
//  Copyright © 2016年 SuperMan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Book : NSObject

@property (nonatomic, strong, readonly) NSString    *bookID;

@property (nonatomic, strong, readonly) NSString    *name;

@property (nonatomic, strong, readonly) NSString    *publishHouse;

@property (nonatomic, strong, readonly) NSString    *author;

@property (nonatomic ,strong, readonly) NSDate      *saveDate;

@property (nonatomic, strong) NSString              *introducation;

@property (nonatomic, assign) BOOL                  favorite;


- (instancetype)initWithID:(NSString *)bookID name:(NSString *)bookName publishHouse:(NSString *)bookPH author:(NSString *)bookAuthor saveDate:(NSDate *)date introducation:(NSString *)bookIntroducation;

@end
