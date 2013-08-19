//
//  DataManager.h
//  Memo
//
//  Created by Heaven on 13. 8. 8..
//  Copyright (c) 2013년 Heaven. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Memo;

@interface DataManager : NSObject

+ (id)defaultManager;

// 아래와 같은 형태로 각각을 입력 받도록 구성할 수도 있고
// 아니면 - (void)insertWithDictionary:(NSDictionary)dictionary 와 같이 범용적으로 사용할 수 있도록 구성 할 수도 있을 것 같습니다.
// 이외의 다른 형태로도 고민해 보시면 좋을 것 같네요.
- (void)insertWithTitle:(NSString *)title memo:(NSString *)memo;
- (void)updateWithTitle:(NSString *)title memo:(NSString *)memo where:(int)indexNumber;
- (NSArray *)memoList;

@end
