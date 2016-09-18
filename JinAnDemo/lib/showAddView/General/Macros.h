//
//  Macros.h
//  BookManager
//
//  Created by SuperMan on 16/5/13.
//  Copyright © 2016年 SuperMan. All rights reserved.
//

#ifndef Macros_h
#define Macros_h

#define IsAvailableString(_ref)   (((_ref) != nil) && (![(_ref) isEqual:[NSNull null]]) && ([_ref isKindOfClass:[NSString class]]) && (_ref.length > 0))

#define WS(weakSelf)        __weak __typeof(&*self)weakSelf = self;

#define SYSTEM_VERSION      [[[UIDevice currentDevice] systemVersion] floatValue]

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#define SYSTEM_VERSION_IOS7_AND_LATER  (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0"))


#endif /* Macros_h */
