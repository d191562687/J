//
//  AddBookViewController.h
//  BookManager
//
//  Created by SuperMan on 16/5/13.
//  Copyright © 2016年 SuperMan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Book;
@class AddBookViewController;

typedef void (^WillAddBlock)(Book *book, AddBookViewController *viewController);

@interface AddBookViewController : UIViewController

@property (nonatomic, copy) WillAddBlock willAddBlock;

@end
